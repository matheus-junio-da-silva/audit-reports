// SPDX-License-Identifier: AGPLv3
pragma solidity >=0.6.0 <0.7.0;
pragma experimental ABIEncoderV2;

import "@openzeppelin/contracts/token/ERC20/SafeERC20.sol";
import "@openzeppelin/contracts/math/SafeMath.sol";
import "../common/StructDefinitions.sol";
import "../common/Constants.sol";
import "../common/Controllable.sol";
import "../common/Whitelist.sol";
import "../interfaces/IERC20Detailed.sol";
import "../interfaces/ILifeGuard.sol";
import "../interfaces/IExposure.sol";
import "../interfaces/IVault.sol";
import "../interfaces/IBuoy.sol";

/// @notice Contract for calculating current protocol exposures on a stablecoin and
///     protocol level. This contract can be upgraded if the systems underlying protocols
///     or tokens have changed. Protocol exposure are calculated at a high level, as any
///     additional exposures from underlying protocol exposures should at most be equal to
///     the high level exposure.
///     For example: harvest finance stablecoin vaults (fTokens)
///         - High level exposure
///             - Harvest finance
///         - Low level exposures (from fToken investments):
///             - Compound
///             - Idle finance
///     Neither of these two low level exposures should matter as long as there arent
///     additional exposure to these protocol elsewhere. So by desing, the protocols
///     are given indexes based on the strategies in the stablecoin vaults, which need
///     to be symetrical for this to work - e.g. all vaults needs to have the same exposure
///     profile, and non of these exposure profiles can overlap. In the case where the
///     additional exposure needs to be taken into account (maker has USDC collateral,
///     Curve adds exposure to all stablecoins in a liquidity pool), they will be calculated
///     and added ontop of the base exposure from vaults and strategies.
///
///     --------------------------------------------------------
///     Current protocol setup:
///     --------------------------------------------------------
///     Stablecoins: DAI, USDC, USDT
///     LP tokens: 3Crv
///     Vaults: DAIVault, USDCVault, USDTVault, 3Crv vault
///     Strategy (exposures):
///         - Compound
///         - Idle finance
///         - Yearn Generic Lender:
///             - Cream
///         - CurveXpool:
///             - Curve3Pool
///             - CurveMetaPool
///             - Yearn
contract Exposure is Constants, Controllable, Whitelist, IExposure {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;

    uint256 public protocolCount;
    uint256 public makerUSDCExposure;

    event LogNewProtocolCount(uint256 count);
    event LogNewMakerExposure(uint256 exposure);

    /// @notice Add protocol for the exposure calculations
    /// @dev Currently set to:
    ///     1 - Harvest finance
    ///     2 - Cream
    ///     Curve exposure is calculated separately as it has wider system impact
    function setProtocolCount(uint256 _protocolCount) external onlyOwner {
        protocolCount = _protocolCount;
        emit LogNewProtocolCount(_protocolCount);
    }

    /// @notice Specify additional USDC exposure to Maker
    /// @param _makerUSDCExposure Exposure amount to Maker
    function setMakerUSDCExposure(uint256 _makerUSDCExposure) external onlyOwner {
        makerUSDCExposure = _makerUSDCExposure;
        emit LogNewMakerExposure(_makerUSDCExposure);
    }

    function getExactRiskExposure(SystemState calldata sysState)
        external
        view
        override
        returns (ExposureState memory expState)
    {
        expState = _calcRiskExposure(sysState, false);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00020014,0)}
        ILifeGuard lifeguard = ILifeGuard(_controller().lifeGuard());assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010007,0)}
        IBuoy buoy = IBuoy(_controller().buoy());assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010008,0)}
        for (uint256 i = 0; i < N_COINS; i++) {
            uint256 assets = lifeguard.assets(i);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000001e,assets)}
            uint256 assetsUsd = buoy.singleStableToUsd(assets, i);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000001f,assetsUsd)}
            expState.stablecoinExposure[i] = expState.stablecoinExposure[i].add(
                assetsUsd.mul(PERCENTAGE_DECIMAL_FACTOR).div(sysState.totalCurrentAssetsUsd)
            );uint256 certora_local37 = expState.stablecoinExposure[i];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000025,certora_local37)}
        }
    }

    /// @notice Calculate stablecoin and protocol level risk exposure
    /// @param sysState Struct holding info about systems current state
    /// @dev This loops through all the vaults, checks the amount of assets in them
    ///     and their underlying strategies to understand stablecoin exposure
    ///     - Any assets invested in Curve or similar AMM will have additional stablecoin exposure.
    ///     The protocol exposure is calculated by assessing the amount of assets each
    ///     vault has invested in a strategy.
    function calcRiskExposure(SystemState calldata sysState)
        external
        view
        override
        returns (ExposureState memory expState)
    {
        expState = _calcRiskExposure(sysState, true);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00020015,0)}

        // Establish if any stablecoin/protocol is over exposed
        (expState.stablecoinExposed, expState.protocolExposed) = isExposed(
            sysState.rebalanceThreshold,
            expState.stablecoinExposure,
            expState.protocolExposure,
            expState.curveExposure
        );assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00020016,0)}
    }

    /// @notice Do a rough USD dollar calculation by treating every stablecoin as
    ///     worth 1 USD and set all Decimals to 18
    function getUnifiedAssets(address[N_COINS] calldata vaults)
        public
        view
        override
        returns (uint256 unifiedTotalAssets, uint256[N_COINS] memory unifiedAssets)
    {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001f0000, 1037618708511) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001f0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001f0005, 4) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001f6200, vaults) }
        // unify all assets to 18 decimals, treat each stablecoin as being worth 1 USD
        for (uint256 i = 0; i < N_COINS; i++) {
            uint256 assets = IVault(vaults[i]).totalAssets();assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000020,assets)}
            unifiedAssets[i] = assets.mul(DEFAULT_DECIMALS_FACTOR).div(
                uint256(10)**IERC20Detailed(IVault(vaults[i]).token()).decimals()
            );uint256 certora_local38 = unifiedAssets[i];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000026,certora_local38)}
            unifiedTotalAssets = unifiedTotalAssets.add(unifiedAssets[i]);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000027,unifiedTotalAssets)}
        }
    }

    /// @notice Rough delta calculation - assumes each stablecoin is priced at 1 USD,
    ///     and looks at differences between current allocations and target allocations
    /// @param targets Stable coin allocation targest
    /// @param vaults Stablecoin vaults
    /// @param withdrawUsd USD value of withdrawals
    function calcRoughDelta(
        uint256[N_COINS] calldata targets,
        address[N_COINS] calldata vaults,
        uint256 withdrawUsd
    ) external view override returns (uint256[N_COINS] memory delta) {
        (uint256 totalAssets, uint256[N_COINS] memory vaultTotalAssets) = getUnifiedAssets(vaults);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010009,0)}

        require(totalAssets > withdrawUsd, "totalAssets < withdrawalUsd");
        totalAssets = totalAssets.sub(withdrawUsd);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000017,totalAssets)}
        uint256 totalDelta;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000a,totalDelta)}
        for (uint256 i; i < N_COINS; i++) {
            uint256 target = totalAssets.mul(targets[i]).div(PERCENTAGE_DECIMAL_FACTOR);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000021,target)}
            if (vaultTotalAssets[i] > target) {
                delta[i] = vaultTotalAssets[i].sub(target);
                totalDelta = totalDelta.add(delta[i]);
            }
        }
        uint256 percent = PERCENTAGE_DECIMAL_FACTOR;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000b,percent)}
        for (uint256 i; i < N_COINS - 1; i++) {
            if (delta[i] > 0) {
                delta[i] = delta[i].mul(PERCENTAGE_DECIMAL_FACTOR).div(totalDelta);
                percent = percent.sub(delta[i]);
            }
        }
        delta[N_COINS - 1] = percent;uint256 certora_local24 = delta[N_COINS - 1];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000018,certora_local24)}
        return delta;
    }

    /// @notice Sort vaults by the delta of target asset - current asset,
    ///     only support 3 vaults now
    /// @param bigFirst Return array order most exposed -> least exposed
    /// @param unifiedTotalAssets Estimated system USD assets
    /// @param unifiedAssets Estimated vault USD assets
    /// @param targetPercents Vault target percent array
    function sortVaultsByDelta(
        bool bigFirst,
        uint256 unifiedTotalAssets,
        uint256[N_COINS] calldata unifiedAssets,
        uint256[N_COINS] calldata targetPercents
    ) external pure override returns (uint256[N_COINS] memory vaultIndexes) {
        uint256 maxIndex;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000c,maxIndex)}
        uint256 minIndex;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000d,minIndex)}
        int256 maxDelta;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000e,maxDelta)}
        int256 minDelta;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000f,minDelta)}
        for (uint256 i = 0; i < N_COINS; i++) {
            // Get difference between vault current assets and vault target
            int256 delta = int256(
                unifiedAssets[i] - unifiedTotalAssets.mul(targetPercents[i]).div(PERCENTAGE_DECIMAL_FACTOR)
            );assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000022,delta)}
            // Establish order
            if (delta > maxDelta) {
                maxDelta = delta;
                maxIndex = i;
            } else if (delta < minDelta) {
                minDelta = delta;
                minIndex = i;
            }
        }
        if (bigFirst) {
            vaultIndexes[0] = maxIndex;
            vaultIndexes[2] = minIndex;
        } else {
            vaultIndexes[0] = minIndex;uint256 certora_local40 = vaultIndexes[0];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000028,certora_local40)}
            vaultIndexes[2] = maxIndex;uint256 certora_local41 = vaultIndexes[2];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000029,certora_local41)}
        }
        vaultIndexes[1] = N_COINS - maxIndex - minIndex;uint256 certora_local25 = vaultIndexes[1];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000019,certora_local25)}
    }

    /// @notice Calculate what percentage of system total assets the assets in a strategy make up
    /// @param vault Address of target vault that holds the strategy
    /// @param index Index of strategy
    /// @param vaultAssetsPercent Percentage of system assets
    /// @param vaultAssets Total assets in vaults
    function calculatePercentOfSystem(
        address vault,
        uint256 index,
        uint256 vaultAssetsPercent,
        uint256 vaultAssets
    ) private view returns (uint256 percentOfSystem) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00190000, 1037618708505) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00190001, 4) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00190005, 585) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00196003, vaultAssets) }
        if (vaultAssets == 0) return 0;
        uint256 strategyAssetsPercent = IVault(vault).getStrategyAssets(index).mul(PERCENTAGE_DECIMAL_FACTOR).div(
            vaultAssets
        );assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000010,strategyAssetsPercent)}

        percentOfSystem = vaultAssetsPercent.mul(strategyAssetsPercent).div(PERCENTAGE_DECIMAL_FACTOR);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000001a,percentOfSystem)}
    }

    /// @notice Calculate the net stablecoin exposure
    /// @param directlyExposure Amount of stablecoin in vault+strategies
    /// @param curveExposure Percent of assets in Curve
    function calculateStableCoinExposure(uint256[N_COINS] memory directlyExposure, uint256 curveExposure)
        private
        view
        returns (uint256[N_COINS] memory stableCoinExposure)
    {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001a0000, 1037618708506) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001a0001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001a0005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001a6001, curveExposure) }
        uint256 maker = directlyExposure[0].mul(makerUSDCExposure).div(PERCENTAGE_DECIMAL_FACTOR);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000011,maker)}
        for (uint256 i = 0; i < N_COINS; i++) {
            uint256 indirectExposure = curveExposure;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000023,indirectExposure)}
            if (i == 1) {
                indirectExposure = indirectExposure.add(maker);
            }
            stableCoinExposure[i] = directlyExposure[i].add(indirectExposure);uint256 certora_local42 = stableCoinExposure[i];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000002a,certora_local42)}
        }
    }

    /// @notice Determine if an assets or protocol is overexposed
    /// @param rebalanceThreshold Threshold for triggering a rebalance due to overexposure
    /// @param stableCoinExposure Current stable coin exposures
    /// @param protocolExposure Current prtocol exposures
    /// @param curveExposure Current Curve exposure
    function isExposed(
        uint256 rebalanceThreshold,
        uint256[N_COINS] memory stableCoinExposure,
        uint256[] memory protocolExposure,
        uint256 curveExposure
    ) private pure returns (bool stablecoinExposed, bool protocolExposed) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b0000, 1037618708507) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b0001, 4) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b0005, 585) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b6003, curveExposure) }
        for (uint256 i = 0; i < N_COINS; i++) {
            if (stableCoinExposure[i] > rebalanceThreshold) {
                stablecoinExposed = true;
                break;
            }
        }
        for (uint256 i = 0; i < protocolExposure.length; i++) {
            if (protocolExposure[i] > rebalanceThreshold) {
                protocolExposed = true;
                break;
            }
        }
        if (!protocolExposed && curveExposure > rebalanceThreshold) protocolExposed = true;
        return (stablecoinExposed, protocolExposed);
    }

    function _calcRiskExposure(SystemState memory sysState, bool treatLifeguardAsCurve)
        private
        view
        returns (ExposureState memory expState)
    {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c0000, 1037618708508) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c0001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c0005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c6001, treatLifeguardAsCurve) }
        address[N_COINS] memory vaults = _controller().vaults();assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010012,0)}
        uint256 pCount = protocolCount;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000013,pCount)}
        expState.protocolExposure = new uint256[](pCount);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0002001b,0)}
        if (sysState.totalCurrentAssetsUsd == 0) {
            return expState;
        }
        // Stablecoin exposure
        for (uint256 i = 0; i < N_COINS; i++) {
            uint256 vaultAssetsPercent = sysState.vaultCurrentAssetsUsd[i].mul(PERCENTAGE_DECIMAL_FACTOR).div(
                sysState.totalCurrentAssetsUsd
            );assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000024,vaultAssetsPercent)}
            expState.stablecoinExposure[i] = vaultAssetsPercent;uint256 certora_local43 = expState.stablecoinExposure[i];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000002b,certora_local43)}
            // Protocol exposure
            for (uint256 j = 0; j < pCount; j++) {
                uint256 percentOfSystem = calculatePercentOfSystem(
                    vaults[i],
                    j,
                    vaultAssetsPercent,
                    sysState.vaultCurrentAssets[i]
                );assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000002d,percentOfSystem)}
                expState.protocolExposure[j] = expState.protocolExposure[j].add(percentOfSystem);uint256 certora_local46 = expState.protocolExposure[j];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000002e,certora_local46)}
            }
        }
        if (treatLifeguardAsCurve) {
            // Curve exposure is calculated by adding the Curve vaults total assets and any
            // assets in the lifeguard which are poised to be invested into the Curve vault
            expState.curveExposure = sysState.curveCurrentAssetsUsd.add(sysState.lifeguardCurrentAssetsUsd);
        } else {
            expState.curveExposure = sysState.curveCurrentAssetsUsd;uint256 certora_local44 = expState.curveExposure;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000002c,certora_local44)}
        }
        expState.curveExposure = expState.curveExposure.mul(PERCENTAGE_DECIMAL_FACTOR).div(
            sysState.totalCurrentAssetsUsd
        );uint256 certora_local28 = expState.curveExposure;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000001c,certora_local28)}

        // Calculate stablecoin exposures
        expState.stablecoinExposure = calculateStableCoinExposure(expState.stablecoinExposure, expState.curveExposure);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0002001d,0)}
    }
}
