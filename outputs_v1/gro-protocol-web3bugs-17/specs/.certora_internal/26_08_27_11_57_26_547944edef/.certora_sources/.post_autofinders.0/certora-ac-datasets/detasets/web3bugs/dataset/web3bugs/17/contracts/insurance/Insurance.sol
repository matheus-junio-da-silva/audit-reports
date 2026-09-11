// SPDX-License-Identifier: AGPLv3
pragma solidity >=0.6.0 <0.7.0;
pragma experimental ABIEncoderV2;

import "@openzeppelin/contracts/token/ERC20/SafeERC20.sol";
import "@openzeppelin/contracts/math/SafeMath.sol";
import "../common/StructDefinitions.sol";
import "../common/Constants.sol";
import "../common/Controllable.sol";
import "../common/Whitelist.sol";
import "../interfaces/IAllocation.sol";
import "../interfaces/IInsurance.sol";
import "../interfaces/IExposure.sol";

import "../interfaces/IERC20Detailed.sol";
import "../interfaces/ILifeGuard.sol";
import "../interfaces/IVault.sol";
import "../interfaces/IBuoy.sol";
import "../interfaces/IPnL.sol";

/// @notice Contract for supporting protocol insurance logic - used for calculating large deposits,
///     withdrawals, rebalancing vaults and strategies and calculating risk exposure.
///     The gro protocol needs to ensure that all assets are kept within certain bounds,
///     defined on both a stablecoin and a protocol level. The stablecoin exposure is defined as
///     a system parameter (by governance), protocol exposure is calculated based on utilisation
///     ratio of gvt versus pwrd.
///
///     *****************************************************************************
///     Dependencies - insurance strategies
///     *****************************************************************************
///     Allocation.sol
///      - Protocol Allocation calculations
///     Exposure.sol
///      - Protocol Exposure calculations
///
///     Current system vaults : strategies:
///      - DAI vault : Harvest finance, Yearn generic lender
///      - USDC vaults : Harvest finance, Yearn generic lender
///      - USDT vault : Harvest finance, Yearn generic lender
///      - Curve vault : CurveXpool (Curve meta pool + yearn strategy)
///
///     Risk exposures:
///      - Stable coin - DAI, USDC, USDT
///      - LP tokens - 3Crv, Metapool tokens
contract Insurance is Constants, Controllable, Whitelist, IInsurance {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;

    IAllocation public allocation;
    IExposure public exposure;

    mapping(uint256 => uint256) public underlyingTokensPercents;
    uint256 public curveVaultPercent;

    // Buffer used to ensure that exposures don't get to close to the limit
    // (defined as 100% - (utilisation ratio / 2), will ensure that
    // rebalance will trigger before any overexposures have occured
    uint256 public exposureBufferRebalance;
    // How much can be withdrawn from a single vault before triggering a whale withdrawal
    //  - Whale withdrawal will withdraw from multiple vaults based on the vaults
    //      current exposure delta (difference between current assets vs target assets).
    //      The assets will be swapped into the request asset/s (via Curve)
    uint256 public maxPercentForWithdraw;
    // How much can be deposited into a single vault before triggering a whale deposit
    //  - Whale deposit will deposit into multiple vaults based on stablecoin allocation targets.
    //      The deposited asset/s will be swapped into the desired asset amounts (via Curve)
    uint256 public maxPercentForDeposit;

    event LogNewAllocation(address allocation);
    event LogNewExposure(address exposure);
    event LogNewTargetAllocation(uint256 indexed index, uint256 percent);
    event LogNewCurveAllocation(uint256 percent);
    event LogNewExposureBuffer(uint256 buffer);
    event LogNewVaultMax(bool deposit, uint256 percent);

    modifier onlyValidIndex(uint256 index) {
        require(index >= 0 && index < N_COINS, "Invalid index value.");
        _;
    }

    /// @notice Set strategy allocation contract
    /// @param _allocation Address of allocation logic strategy
    function setAllocation(address _allocation) external onlyOwner {
        require(_allocation != address(0), "Zero address provided");
        allocation = IAllocation(_allocation);
        emit LogNewAllocation(_allocation);
    }

    /// @notice Set exposure contract
    /// @param _exposure Address of exposure logic strategy
    function setExposure(address _exposure) external onlyOwner {
        require(_exposure != address(0), "Zero address provided");
        exposure = IExposure(_exposure);
        emit LogNewExposure(_exposure);
    }

    /// @notice Set allocation target for stablecoins
    /// @param coinIndex Protocol index of stablecoin
    /// @param percent Target allocation percent
    function setUnderlyingTokenPercent(uint256 coinIndex, uint256 percent) external override onlyValidIndex(coinIndex) {
        require(msg.sender == controller || msg.sender == owner(), "setUnderlyingTokenPercent: !authorized");
        underlyingTokensPercents[coinIndex] = percent;
        emit LogNewTargetAllocation(coinIndex, percent);
    }

    function setCurveVaultPercent(uint256 _curveVaultPercent) external onlyOwner {
        curveVaultPercent = _curveVaultPercent;
        emit LogNewCurveAllocation(_curveVaultPercent);
    }

    /// @notice Set target for exposure buffer, this is used by the system to determine when to rebalance
    /// @param rebalanceBuffer Buffer percentage
    function setExposureBufferRebalance(uint256 rebalanceBuffer) external onlyOwner {
        exposureBufferRebalance = rebalanceBuffer;
        emit LogNewExposureBuffer(rebalanceBuffer);
    }

    /// @notice Set max percent of the vault assets for whale withdrawal,
    ///     if the withdrawal amount <= max percent * the total assets of target vault,
    ///     withdraw target assets from single vault
    /// @param _maxPercentForWithdraw Target max pecent in %BP
    function setWhaleThresholdWithdraw(uint256 _maxPercentForWithdraw) external onlyOwner {
        maxPercentForWithdraw = _maxPercentForWithdraw;
        emit LogNewVaultMax(false, _maxPercentForWithdraw);
    }

    /// @notice Set max percent of the vault assets for whale deposits,
    ///     if the deposit amount >= max percent * the total assets of target vault,
    ///     deposit into single vault
    /// @param _maxPercentForDeposit Target max pecent in %BP
    function setWhaleThresholdDeposit(uint256 _maxPercentForDeposit) external onlyOwner {
        maxPercentForDeposit = _maxPercentForDeposit;
        emit LogNewVaultMax(true, _maxPercentForDeposit);
    }

    /// @notice Deposit deltas => stablecoin allocation targets. Large deposits will thus
    ///     always push the system towards a steady state
    function calculateDepositDeltasOnAllVaults() public view override returns (uint256[N_COINS] memory) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00220000, 1037618708514) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00220001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00220004, 0) }
        return getStablePercents();
    }

    /// @notice Get the vaults order by their current exposure
    /// @param amount Amount deposited
    function getVaultDeltaForDeposit(uint256 amount)
        external
        view
        override
        returns (
            uint256[N_COINS] memory,
            uint256[N_COINS] memory,
            uint256
        )
    {
        uint256[N_COINS] memory investDelta;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010007,0)}
        uint256[N_COINS] memory vaultIndexes;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010008,0)}
        (uint256 totalAssets, uint256[N_COINS] memory vaultAssets) = exposure.getUnifiedAssets(_controller().vaults());assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010009,0)}
        // If deposited amount is less than the deposit limit for a the system, the
        // deposited is treated as a tuna deposit (single vault target)...
        if (amount < totalAssets.mul(maxPercentForDeposit).div(PERCENTAGE_DECIMAL_FACTOR)) {
            uint256[N_COINS] memory _vaultIndexes = exposure.sortVaultsByDelta(
                false,
                totalAssets,
                vaultAssets,
                getStablePercents()
            );
            investDelta[vaultIndexes[0]] = 10000;
            vaultIndexes[0] = _vaultIndexes[0];
            vaultIndexes[1] = _vaultIndexes[1];
            vaultIndexes[2] = _vaultIndexes[2];

            return (investDelta, vaultIndexes, 1);
            // ...Else its a whale deposit, and the deposit will be spread across all vaults,
            // based on allocation targets
        } else {
            return (investDelta, vaultIndexes, N_COINS);
        }
    }

    /// @notice Sort vaults by the delta of target asset - current asset,
    ///     only support 3 vaults now
    /// @param bigFirst Return array order most exposed -> least exposed
    function sortVaultsByDelta(bool bigFirst) external view override returns (uint256[N_COINS] memory vaultIndexes) {
        (uint256 totalAssets, uint256[N_COINS] memory vaultAssets) = exposure.getUnifiedAssets(_controller().vaults());assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001000a,0)}
        return exposure.sortVaultsByDelta(bigFirst, totalAssets, vaultAssets, getStablePercents());
    }

    /// @notice Prepares system for rebalance by comparing current system risk exposure to target exposure
    function rebalanceTrigger() external view override returns (bool sysNeedRebalance) {
        SystemState memory sysState = prepareCalculation();assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001000b,0)}
        sysState.utilisationRatio = IPnL(_controller().pnl()).utilisationRatio();uint256 certora_local42 = sysState.utilisationRatio;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000002a,certora_local42)}
        sysState.rebalanceThreshold = PERCENTAGE_DECIMAL_FACTOR.sub(sysState.utilisationRatio.div(2)).sub(
            exposureBufferRebalance
        );uint256 certora_local43 = sysState.rebalanceThreshold;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000002b,certora_local43)}
        ExposureState memory expState = exposure.calcRiskExposure(sysState);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001000c,0)}
        sysNeedRebalance = expState.stablecoinExposed || expState.protocolExposed;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000002c,sysNeedRebalance)}
    }

    /// @notice Rebalance will check the exposure and calculate the delta of overexposed assets/protocols.
    ///     Rebalance will attempt to withdraw assets from overexposed strategies to minimize protocol exposure.
    ///     After which it will pull assets out from overexposed vaults and invest the freed up assets
    ///     to the other stablecoin vaults.
    function rebalance() external override onlyWhitelist {
        SystemState memory sysState = prepareCalculation();assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001000d,0)}
        sysState.utilisationRatio = IPnL(_controller().pnl()).utilisationRatio();uint256 certora_local45 = sysState.utilisationRatio;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000002d,certora_local45)}
        sysState.rebalanceThreshold = PERCENTAGE_DECIMAL_FACTOR.sub(sysState.utilisationRatio.div(2)).sub(
            exposureBufferRebalance
        );uint256 certora_local46 = sysState.rebalanceThreshold;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000002e,certora_local46)}
        ExposureState memory expState = exposure.calcRiskExposure(sysState);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001000e,0)}
        /// If the system is in an OK state, do nothing...
        if (!expState.stablecoinExposed && !expState.protocolExposed) return;
        /// ...Else, trigger a rebalance
        sysState.targetBuffer = exposureBufferRebalance;uint256 certora_local47 = sysState.targetBuffer;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000002f,certora_local47)}
        AllocationState memory allState = allocation.calcSystemTargetDelta(sysState, expState);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001000f,0)}
        _rebalance(allState);
    }

    /// @notice Rebalancing for large withdrawals, calculates changes in utilisation ratio based
    ///     on the amount withdrawn, and rebalances to get additional assets for withdrawal
    /// @param withdrawUsd Target USD amount to withdraw
    /// @param pwrd Pwrd or gvt
    function rebalanceForWithdraw(uint256 withdrawUsd, bool pwrd) external override returns (bool) {
        require(msg.sender == _controller().withdrawHandler(), "rebalanceForWithdraw: !withdrawHandler");
        return withdraw(withdrawUsd, pwrd);
    }

    /// @notice Determine if part of a deposit should be routed to the LP vault - This only applies
    ///     to Tuna and Whale deposits
    /// @dev If the current Curve exposure > target curve exposure, no more assets should be invested
    ///     to the LP vault
    function calcSkim() external view override returns (uint256) {
        IPnL pnl = IPnL(_controller().pnl());assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010010,0)}
        (uint256 gvt, uint256 pwrd) = pnl.calcPnL();assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010011,0)}
        uint256 totalAssets = gvt.add(pwrd);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000012,totalAssets)}
        uint256 curveAssets = IVault(_controller().curveVault()).totalAssets();assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000013,curveAssets)}
        if (totalAssets != 0 && curveAssets.mul(PERCENTAGE_DECIMAL_FACTOR).div(totalAssets) >= curveVaultPercent) {
            return 0;
        }
        return curveVaultPercent;
    }

    /// @notice Calculate assets distribution for strategies
    function getStrategiesTargetRatio(uint256 utilRatio) external view override returns (uint256[] memory) {
        return allocation.calcStrategyPercent(utilRatio);
    }

    /// @notice Get protocol and vault total assets
    function prepareCalculation() public view returns (SystemState memory systemState) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00240000, 1037618708516) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00240001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00240004, 0) }
        ILifeGuard lg = getLifeGuard();assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010014,0)}
        IBuoy buoy = IBuoy(lg.getBuoy());assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010015,0)}
        require(buoy.safetyCheck());
        IVault curve = IVault(_controller().curveVault());assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010016,0)}
        systemState.lifeguardCurrentAssetsUsd = lg.totalAssetsUsd();uint256 certora_local48 = systemState.lifeguardCurrentAssetsUsd;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000030,certora_local48)}
        systemState.curveCurrentAssetsUsd = buoy.lpToUsd(curve.totalAssets());uint256 certora_local49 = systemState.curveCurrentAssetsUsd;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000031,certora_local49)}
        systemState.totalCurrentAssetsUsd = systemState.lifeguardCurrentAssetsUsd.add(
            systemState.curveCurrentAssetsUsd
        );uint256 certora_local50 = systemState.totalCurrentAssetsUsd;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000032,certora_local50)}
        systemState.curvePercent = curveVaultPercent;uint256 certora_local51 = systemState.curvePercent;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000033,certora_local51)}
        address[N_COINS] memory vaults = _controller().vaults();assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010017,0)}
        // Stablecoin total assets
        for (uint256 i = 0; i < N_COINS; i++) {
            IVault vault = IVault(vaults[i]);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010039,0)}
            uint256 vaultAssets = vault.totalAssets();assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000003a,vaultAssets)}
            uint256 vaultAssetsUsd = buoy.singleStableToUsd(vaultAssets, i);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000003b,vaultAssetsUsd)}
            systemState.totalCurrentAssetsUsd = systemState.totalCurrentAssetsUsd.add(vaultAssetsUsd);uint256 certora_local64 = systemState.totalCurrentAssetsUsd;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000040,certora_local64)}
            systemState.vaultCurrentAssets[i] = vaultAssets;uint256 certora_local65 = systemState.vaultCurrentAssets[i];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000041,certora_local65)}
            systemState.vaultCurrentAssetsUsd[i] = vaultAssetsUsd;uint256 certora_local66 = systemState.vaultCurrentAssetsUsd[i];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000042,certora_local66)}
        }
        systemState.stablePercents = getStablePercents();assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00020034,0)}
    }

    /// @notice Logic for large withdrawals - We attempt to optimize large withdrawals on both
    ///     vault and strategy level - depending on the quantity being withdrawn, we try to limit
    ///     gas costs by reducing the number of vaults and strategies to interact with
    /// @param amount Amount to withdraw in USD
    /// @param pwrd Is pwrd or vault being burned - affects withdrawal queue
    function withdraw(uint256 amount, bool pwrd) private returns (bool curve) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00190000, 1037618708505) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00190001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00190005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00196001, pwrd) }
        address[N_COINS] memory vaults = _controller().vaults();assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010018,0)}

        // Determine if it's possible to withdraw from one or two vaults without breaking exposure
        (uint256 withdrawType, uint256[N_COINS] memory withdrawalAmounts) = calculateWithdrawalAmountsOnPartVaults(
            amount,
            vaults
        );assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010019,0)}

        // If it's not possible to withdraw from a subset of the vaults, calculate how much
        // to withdraw from each based on current amounts in vaults vs allocation targets

        // Withdraw from more than one vault
        if (withdrawType > 1) {
            // Withdraw from all stablecoin vaults
            if (withdrawType == 2)
                withdrawalAmounts = calculateWithdrawalAmountsOnAllVaults(amount, vaults);
                // Withdraw from all stable coin vaults + LP vault
            else {
                // withdrawType == 3
                for (uint256 i; i < N_COINS; i++) {
                    withdrawalAmounts[i] = IVault(vaults[i]).totalAssets();uint256 certora_local72 = withdrawalAmounts[i];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000048,certora_local72)}
                }
            }
        }
        ILifeGuard lg = getLifeGuard();assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001001a,0)}
        for (uint256 i = 0; i < N_COINS; i++) {
            // Withdraw assets from vault adaptor - if assets are available they will be pulled
            // direcly from the adaptor, otherwise assets will have to be pulled from the underlying
            // strategies, which will costs additional gas
            if (withdrawalAmounts[i] > 0) {
                IVault(vaults[i]).withdrawByStrategyOrder(withdrawalAmounts[i], address(lg), pwrd);
            }
        }

        if (withdrawType == 3) {
            // If more assets are needed than are available in the stablecoin vaults,
            // assets will be withdrawn from the LP Vault. This possibly involves additional
            // fees, which will be deducted from the users withdrawal amount.
            IBuoy buoy = IBuoy(lg.getBuoy());
            uint256[N_COINS] memory _withdrawalAmounts;
            _withdrawalAmounts[0] = withdrawalAmounts[0];
            _withdrawalAmounts[1] = withdrawalAmounts[1];
            _withdrawalAmounts[2] = withdrawalAmounts[2];
            uint256 leftUsd = amount.sub(buoy.stableToUsd(_withdrawalAmounts, false));
            IVault curveVault = IVault(_controller().curveVault());
            uint256 curveVaultUsd = buoy.lpToUsd(curveVault.totalAssets());
            require(curveVaultUsd > leftUsd, "no enough system assets");
            curveVault.withdraw(buoy.usdToLp(leftUsd), address(lg));
            curve = true;
        }
    }

    /// @notice Calculate withdrawal amounts based on part vaults, if the sum of part vaults'
    ///     maxWithdrawal can meet required amount, return true and valid array,
    ///     otherwise return false and invalid array
    /// @return withdrawType
    ///     1 - withdraw from part stablecoin vaults
    ///     2 - withdraw from all stablecoin vaults
    ///     3 - withdraw from all stablecoin vaults and Curve vault/lifeguard
    function calculateWithdrawalAmountsOnPartVaults(uint256 amount, address[N_COINS] memory vaults)
        private
        view
        returns (uint256 withdrawType, uint256[N_COINS] memory withdrawalAmounts)
    {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001a0000, 1037618708506) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001a0001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001a0005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001a6001, vaults) }
        uint256 maxWithdrawal;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000001b,maxWithdrawal)}
        uint256 leftAmount = amount;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000001c,leftAmount)}
        uint256 vaultIndex;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000001d,vaultIndex)}
        (uint256 totalAssets, uint256[N_COINS] memory vaultAssets) = exposure.getUnifiedAssets(vaults);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001001e,0)}
        if (amount > totalAssets) {
            withdrawType = 3;
        } else {
            withdrawType = 2;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000043,withdrawType)}
            // Get list of vaults order by most exposed => least exposed
            uint256[N_COINS] memory vaultIndexes = exposure.sortVaultsByDelta(
                true,
                totalAssets,
                vaultAssets,
                getStablePercents()
            );assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001003c,0)}

            IBuoy buoy = IBuoy(getLifeGuard().getBuoy());assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001003d,0)}
            // Establish how much needs to be withdrawn from each vault
            for (uint256 i; i < N_COINS - 1; i++) {
                vaultIndex = vaultIndexes[i];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000046,vaultIndex)}
                // Limit of how much can be withdrawn from this vault
                maxWithdrawal = vaultAssets[vaultIndex].mul(maxPercentForWithdraw).div(PERCENTAGE_DECIMAL_FACTOR);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000047,maxWithdrawal)}
                // If withdraw amount exceeds withdraw capacity, withdraw remainder
                // from next vault in list...
                if (leftAmount > maxWithdrawal) {
                    withdrawalAmounts[vaultIndex] = buoy.singleStableFromUsd(maxWithdrawal, int128(vaultIndex));
                    leftAmount = leftAmount.sub(maxWithdrawal);
                    // ...Else, stop. Withdrawal covered by one vault.
                } else {
                    withdrawType = 1;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000049,withdrawType)}
                    withdrawalAmounts[vaultIndex] = buoy.singleStableFromUsd(leftAmount, int128(vaultIndex));uint256 certora_local74 = withdrawalAmounts[vaultIndex];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000004a,certora_local74)}
                    break;
                }
            }
        }
    }

    /// @notice Calcualte difference between vault current assets and target assets
    /// @param withdrawUsd USD value of withdrawals
    function getDelta(uint256 withdrawUsd) external view override returns (uint256[N_COINS] memory delta) {
        address[N_COINS] memory vaults = _controller().vaults();assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001001f,0)}
        delta = exposure.calcRoughDelta(getStablePercents(), vaults, withdrawUsd);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00020035,0)}
    }

    /// @notice Calculate withdrawal amounts based on target percents of all vaults,
    ///     if one withdrawal amount > one vault's total asset, use rebalance calculation
    function calculateWithdrawalAmountsOnAllVaults(uint256 amount, address[N_COINS] memory vaults)
        private
        view
        returns (uint256[N_COINS] memory withdrawalAmounts)
    {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c0000, 1037618708508) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c0001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c0005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c6001, vaults) }
        // Simple == true - withdraw from all vaults based on target percents
        bool simple = true;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000020,simple)}
        // First pass uses rough usd calculations to asses the distribution of withdrawals
        // from the vaults...
        uint256[N_COINS] memory delta = exposure.calcRoughDelta(getStablePercents(), vaults, amount);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010021,0)}
        for (uint256 i = 0; i < N_COINS; i++) {
            IVault vault = IVault(vaults[i]);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001003e,0)}
            withdrawalAmounts[i] = amount
            .mul(delta[i])
            .mul(uint256(10)**IERC20Detailed(vault.token()).decimals())
            .div(PERCENTAGE_DECIMAL_FACTOR)
            .div(DEFAULT_DECIMALS_FACTOR);uint256 certora_local68 = withdrawalAmounts[i];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000044,certora_local68)}
            if (withdrawalAmounts[i] > vault.totalAssets()) {
                simple = false;
                break;
            }
        }
        // ...If this doesn't work, we do a more complex calculation to establish
        // how much we need to withdraw
        if (!simple) {
            (withdrawalAmounts, ) = calculateVaultSwapData(amount);
        }
    }

    /// @notice calculateVaultsSwapData will compare the current asset excluding withdraw
    ///     amount with target for each vault
    ///     swapInAmounts Stores the coin need to be withdraw above the target in vault
    ///     swapOutPercent Stores the required percent for vault below target
    /// @param withdrawAmount The whale withdraw amount
    function calculateVaultSwapData(uint256 withdrawAmount)
        private
        view
        returns (uint256[N_COINS] memory swapInAmounts, uint256[N_COINS] memory swapOutPercents)
    {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001d0000, 1037618708509) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001d0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001d0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001d6000, withdrawAmount) }
        // Calculate total assets and total number of strategies
        SystemState memory state = prepareCalculation();assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010022,0)}

        require(withdrawAmount < state.totalCurrentAssetsUsd, "Withdrawal exceeds system assets");
        state.totalCurrentAssetsUsd = state.totalCurrentAssetsUsd.sub(withdrawAmount);uint256 certora_local54 = state.totalCurrentAssetsUsd;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000036,certora_local54)}

        StablecoinAllocationState memory stableState = allocation.calcVaultTargetDelta(state, false);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010023,0)}
        swapInAmounts = stableState.swapInAmounts;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00020037,0)}
        swapOutPercents = stableState.swapOutPercents;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00020038,0)}
    }

    function getLifeGuard() private view returns (ILifeGuard) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b0000, 1037618708507) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b0004, 0) }
        return ILifeGuard(_controller().lifeGuard());
    }

    /// @notice Rebalance will pull assets out from the overexposed vaults
    ///     and transfer to the other vaults
    function _rebalance(AllocationState memory allState) private {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001e0000, 1037618708510) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001e0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001e0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001e6000, allState) }
        address[N_COINS] memory vaults = _controller().vaults();assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010024,0)}
        ILifeGuard lg = getLifeGuard();assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010025,0)}
        IBuoy buoy = IBuoy(lg.getBuoy());assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010026,0)}
        // Withdraw from strategies that are overexposed
        if (allState.needProtocolWithdrawal) {
            for (uint256 i = 0; i < N_COINS; i++) {
                if (allState.protocolWithdrawalUsd[i] > 0) {
                    uint256 amount = buoy.singleStableFromUsd(allState.protocolWithdrawalUsd[i], int128(i));
                    IVault(vaults[i]).withdrawByStrategyIndex(
                        amount,
                        IVault(vaults[i]).vault(),
                        allState.protocolExposedIndex
                    );
                }
            }
        }

        bool hasWithdrawal = moveAssetsFromVaultsToLifeguard(
            vaults,
            allState.stableState.swapInAmounts,
            lg,
            allState.needProtocolWithdrawal ? 0 : allState.protocolExposedIndex,
            allState.strategyTargetRatio // Only adjust strategy ratio here
        );assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000027,hasWithdrawal)}

        // Withdraw from Curve vault
        uint256 curveDeltaUsd = allState.stableState.curveTargetDeltaUsd;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000028,curveDeltaUsd)}
        if (curveDeltaUsd > 0) {
            uint256 usdAmount = lg.totalAssetsUsd();
            // This step moves all lifeguard assets into swap out stablecoin vaults, it might cause
            // protocol over exposure in some edge cases after invest/harvest. But it won't have a
            // large impact on the system, as investToCurve should be run periodically by external actors,
            // minimising the total amount of assets in the lifeguard.
            //   - Its recommended to check the total assets in the lifeguard and run the invest to curve
            //   trigger() to determine if investToCurve needs to be run manually before rebalance
            lg.depositStable(true);
            if (usdAmount < curveDeltaUsd) {
                IVault(_controller().curveVault()).withdraw(buoy.usdToLp(curveDeltaUsd.sub(usdAmount)), address(lg));
            }
        }

        if (curveDeltaUsd == 0 && hasWithdrawal) lg.depositStable(false);

        // Keep buffer asset in lifeguard and convert the rest of the assets to target stablecoin.
        // If swapOutPercent all are zero, don't run prepareInvestment
        for (uint256 i = 0; i < N_COINS; i++) {
            if (allState.stableState.swapOutPercents[i] > 0) {
                uint256[N_COINS] memory _swapOutPercents;
                _swapOutPercents[0] = allState.stableState.swapOutPercents[0];
                _swapOutPercents[1] = allState.stableState.swapOutPercents[1];
                _swapOutPercents[2] = allState.stableState.swapOutPercents[2];
                lg.invest(0, _swapOutPercents);
                break;
            }
        }
    }

    /// @notice Move assets from Strategies to lifeguard in preparation to have them
    ///     swapped and redistributed to other stablecoin vaults
    /// @param vaults Underlying vaults
    /// @param swapInAmounts Amount to remove from vault
    /// @param lg Lifeguard
    /// @param strategyIndex Index of strategy to withdraw from
    /// @param strategyTargetRatio Targets debt ratios of strategies
    function moveAssetsFromVaultsToLifeguard(
        address[N_COINS] memory vaults,
        uint256[N_COINS] memory swapInAmounts,
        ILifeGuard lg,
        uint256 strategyIndex,
        uint256[] memory strategyTargetRatio
    ) private returns (bool) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001f0000, 1037618708511) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001f0001, 5) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001f0005, 4681) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001f6004, strategyTargetRatio) }
        bool moved = false;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000029,moved)}

        for (uint256 i = 0; i < N_COINS; i++) {
            IVault vault = IVault(vaults[i]);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001003f,0)}
            if (swapInAmounts[i] > 0) {
                moved = true;
                vault.withdrawByStrategyIndex(swapInAmounts[i], address(lg), strategyIndex);
            }
            vault.updateStrategyRatio(strategyTargetRatio);
        }

        return moved;
    }

    function getStablePercents() private view returns (uint256[N_COINS] memory stablePercents) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00200000, 1037618708512) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00200001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00200004, 0) }
        for (uint256 i = 0; i < N_COINS; i++) {
            stablePercents[i] = underlyingTokensPercents[i];uint256 certora_local69 = stablePercents[i];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000045,certora_local69)}
        }
    }
}
