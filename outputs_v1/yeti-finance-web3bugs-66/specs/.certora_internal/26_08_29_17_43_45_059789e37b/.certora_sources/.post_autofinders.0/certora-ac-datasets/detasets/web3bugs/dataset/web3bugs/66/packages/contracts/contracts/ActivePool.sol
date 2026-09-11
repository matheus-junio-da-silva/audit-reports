// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.6.11;

import './Interfaces/IActivePool.sol';
import "./Interfaces/IWhitelist.sol";
import './Interfaces/IERC20.sol';
import "./Interfaces/IWAsset.sol";
import "./Dependencies/SafeMath.sol";
import "./Dependencies/Ownable.sol";
import "./Dependencies/CheckContract.sol";
import "./Dependencies/YetiCustomBase.sol";
import "./Dependencies/SafeERC20.sol";

/*
 * The Active Pool holds the all collateral and YUSD debt (but not YUSD tokens) for all active troves.
 *
 * When a trove is liquidated, its collateral and YUSD debt are transferred from the Active Pool, to either the
 * Stability Pool, the Default Pool, or both, depending on the liquidation conditions.
 *
 */
contract ActivePool is Ownable, CheckContract, IActivePool, YetiCustomBase {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;

    bytes32 constant public NAME = "ActivePool";

    address internal borrowerOperationsAddress;
    address internal troveManagerAddress;
    address internal stabilityPoolAddress;
    address internal defaultPoolAddress;
    address internal troveManagerLiquidationsAddress;
    address internal troveManagerRedemptionsAddress;
    address internal collSurplusPoolAddress;

    
    // deposited collateral tracker. Colls is always the whitelist list of all collateral tokens. Amounts 
    newColls internal poolColl;

    // YUSD Debt tracker. Tracker of all debt in the system. 
    uint256 internal YUSDDebt;

    // --- Events ---

    event BorrowerOperationsAddressChanged(address _newBorrowerOperationsAddress);
    event TroveManagerAddressChanged(address _newTroveManagerAddress);
    event ActivePoolYUSDDebtUpdated(uint _YUSDDebt);
    event ActivePoolBalanceUpdated(address _collateral, uint _amount);
    event ActivePoolBalancesUpdated(address[] _collaterals, uint256[] _amounts);
    event CollateralsSent(address[] _collaterals, uint256[] _amounts, address _to);

    // --- Contract setters ---

    function setAddresses(
        address _borrowerOperationsAddress,
        address _troveManagerAddress,
        address _stabilityPoolAddress,
        address _defaultPoolAddress,
        address _whitelistAddress,
        address _troveManagerLiquidationsAddress,
        address _troveManagerRedemptionsAddress,
        address _collSurplusPoolAddress
    )
        external
        onlyOwner
    {
        checkContract(_borrowerOperationsAddress);
        checkContract(_troveManagerAddress);
        checkContract(_stabilityPoolAddress);
        checkContract(_defaultPoolAddress);
        checkContract(_whitelistAddress);
        checkContract(_troveManagerLiquidationsAddress);
        checkContract(_troveManagerRedemptionsAddress);
        checkContract(_collSurplusPoolAddress);

        borrowerOperationsAddress = _borrowerOperationsAddress;
        troveManagerAddress = _troveManagerAddress;
        stabilityPoolAddress = _stabilityPoolAddress;
        defaultPoolAddress = _defaultPoolAddress;
        whitelist = IWhitelist(_whitelistAddress);
        troveManagerLiquidationsAddress = _troveManagerLiquidationsAddress;
        troveManagerRedemptionsAddress = _troveManagerRedemptionsAddress;
        collSurplusPoolAddress = _collSurplusPoolAddress;

        emit BorrowerOperationsAddressChanged(_borrowerOperationsAddress);
        emit TroveManagerAddressChanged(_troveManagerAddress);
        emit StabilityPoolAddressChanged(_stabilityPoolAddress);
        emit DefaultPoolAddressChanged(_defaultPoolAddress);
        emit WhitelistAddressChanged(_whitelistAddress);

        _renounceOwnership();
    }

    // --- Internal Functions ---

    // --- Getters for public variables. Required by IPool interface ---

    /*
    * Returns the collateralBalance for a given collateral
    *
    * Returns the amount of a given collateral in state. Not necessarily the contract's actual balance.
    */
    function getCollateral(address _collateral) public view override returns (uint) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090000, 1037618708489) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00090005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00096000, _collateral) }
        return poolColl.amounts[whitelist.getIndex(_collateral)];
    }

    /*
    * Returns all collateral balances in state. Not necessarily the contract's actual balances.
    */
    function getAllCollateral() public view override returns (address[] memory, uint256[] memory) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0000, 1037618708491) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0004, 0) }
        return (poolColl.tokens, poolColl.amounts);
    }

    // returns the VC value of a given collateralAddress in this contract
    function getCollateralVC(address _collateral) external view override returns (uint) {
        return whitelist.getValueVC(_collateral, getCollateral(_collateral));
    }


    /*
    * Returns the VC of the contract
    *
    * Not necessarily equal to the the contract's raw VC balance - Collateral can be forcibly sent to contracts.
    *
    * Computed when called by taking the collateral balances and
    * multiplying them by the corresponding price and ratio and then summing that
    */
    function getVC() external view override returns (uint totalVC) {
        uint len = poolColl.tokens.length;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000001,len)}
        for (uint256 i; i < len; ++i) {
            address collateral = poolColl.tokens[i];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000006,collateral)}
            uint amount = poolColl.amounts[i];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000007,amount)}

            uint collateralVC = whitelist.getValueVC(collateral, amount);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000008,collateralVC)}

            totalVC = totalVC.add(collateralVC);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000009,totalVC)}
        }
    }


    // Debt that this pool holds. 
    function getYUSDDebt() external view override returns (uint) {
        return YUSDDebt;
    }

    // --- Pool functionality ---

    // Internal function to send collateral to a different pool. 
    function _sendCollateral(address _to, address _collateral, uint _amount) internal {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00006002, _amount) }
        uint index = whitelist.getIndex(_collateral);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000002,index)}
        poolColl.amounts[index] = poolColl.amounts[index].sub(_amount);
        IERC20(_collateral).safeTransfer(_to, _amount);

        emit ActivePoolBalanceUpdated(_collateral, _amount);
        emit CollateralSent(_collateral, _to, _amount);
    }

    // Returns true if all payments were successfully sent. Must be called by borrower operations, trove manager, or stability pool. 
    function sendCollaterals(address _to, address[] calldata _tokens, uint[] calldata _amounts) external override returns (bool) {
        _requireCallerIsBOorTroveMorTMLorSP();
        uint256 len = _tokens.length;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000003,len)}
        require(len == _amounts.length, "AP:Lengths");
        uint256 thisAmount;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000004,thisAmount)}
        for (uint256 i; i < len; ++i) {
            thisAmount = _amounts[i];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000a,thisAmount)}
            if (thisAmount != 0) {
                _sendCollateral(_to, _tokens[i], thisAmount); // reverts if send fails
            }
        }

        if (_needsUpdateCollateral(_to)) {
            ICollateralReceiver(_to).receiveCollateral(_tokens, _amounts);
        }

        emit CollateralsSent(_tokens, _amounts, _to);
        
        return true;
    }

    // Returns true if all payments were successfully sent. Must be called by borrower operations, trove manager, or stability pool.
    // This function als ounwraps the collaterals and sends them to _to, if they are wrapped assets. If collect rewards is set to true,
    // It also harvests rewards on the user's behalf. 
    // _from is where the reward balance is, _to is where to send the tokens. 
    function sendCollateralsUnwrap(address _from, address _to, address[] calldata _tokens, uint[] calldata _amounts) external override returns (bool) {
        _requireCallerIsBOorTroveMorTMLorSP();
        uint256 tokensLen = _tokens.length;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000005,tokensLen)}
        require(tokensLen == _amounts.length, "AP:Lengths");
        for (uint256 i; i < tokensLen; ++i) {
            if (whitelist.isWrapped(_tokens[i])) {
                // Collects rewards automatically for that amount and unwraps for the original borrower. 
                IWAsset(_tokens[i]).unwrapFor(_from, _to, _amounts[i]);
            } else {
                _sendCollateral(_to, _tokens[i], _amounts[i]); // reverts if send fails
            }
        }
        return true;
    }

    // Function for sending single collateral. Currently only used by borrower operations unlever up functionality
    function sendSingleCollateral(address _to, address _token, uint256 _amount) external override returns (bool) {
        _requireCallerIsBorrowerOperations();
        _sendCollateral(_to, _token, _amount); // reverts if send fails
        return true;
    }

    // Function for sending single collateral and unwrapping. Currently only used by borrower operations unlever up functionality
    function sendSingleCollateralUnwrap(address _from, address _to, address _token, uint256 _amount) external override returns (bool) {
        _requireCallerIsBorrowerOperations();
        if (whitelist.isWrapped(_token)) {
            // Collects rewards automatically for that amount and unwraps for the original borrower. 
            IWAsset(_token).unwrapFor(_from, _to, _amount);
        } else {
            _sendCollateral(_to, _token, _amount); // reverts if send fails
        }
        return true;
    }

    // View function that returns if the contract transferring to needs to have its balances updated. 
    function _needsUpdateCollateral(address _contractAddress) internal view returns (bool) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010000, 1037618708481) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00016000, _contractAddress) }
        return ((_contractAddress == defaultPoolAddress) || (_contractAddress == stabilityPoolAddress) || (_contractAddress == collSurplusPoolAddress));
    }

    // Increases the YUSD Debt of this pool. 
    function increaseYUSDDebt(uint _amount) external override {
        _requireCallerIsBOorTroveM();
        YUSDDebt  = YUSDDebt.add(_amount);
        emit ActivePoolYUSDDebtUpdated(YUSDDebt);
    }

    // Decreases the YUSD Debt of this pool. 
    function decreaseYUSDDebt(uint _amount) external override {
        _requireCallerIsBOorTroveMorSP();
        YUSDDebt = YUSDDebt.sub(_amount);
        emit ActivePoolYUSDDebtUpdated(YUSDDebt);
    }

    // --- 'require' functions ---

    function _requireCallerIsBOorTroveMorTMLorSP() internal view {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030000, 1037618708483) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030004, 0) }
        if (
            msg.sender != borrowerOperationsAddress &&
            msg.sender != troveManagerAddress &&
            msg.sender != stabilityPoolAddress &&
            msg.sender != troveManagerLiquidationsAddress &&
            msg.sender != troveManagerRedemptionsAddress) {
                _revertWrongFuncCaller();
            }
    }

    function _requireCallerIsBorrowerOperationsOrDefaultPool() internal view {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040000, 1037618708484) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040004, 0) }
        if (msg.sender != borrowerOperationsAddress &&
            msg.sender != defaultPoolAddress) {
                _revertWrongFuncCaller();
            }
    }

    function _requireCallerIsBorrowerOperations() internal view {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020000, 1037618708482) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020004, 0) }
        if (msg.sender != borrowerOperationsAddress) {
                _revertWrongFuncCaller();
            }
    }

    function _requireCallerIsBOorTroveMorSP() internal view {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050000, 1037618708485) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050004, 0) }
        if (msg.sender != borrowerOperationsAddress &&
            msg.sender != troveManagerAddress &&
            msg.sender != stabilityPoolAddress &&
            msg.sender != troveManagerRedemptionsAddress) {
                _revertWrongFuncCaller();
            }
    }

    function _requireCallerIsBOorTroveM() internal view {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060000, 1037618708486) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060004, 0) }
        if (msg.sender != borrowerOperationsAddress &&
            msg.sender != troveManagerAddress) {
                _revertWrongFuncCaller();
            }
    }

    function _requireCallerIsWhitelist() internal view {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070000, 1037618708487) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070004, 0) }
        if (msg.sender != address(whitelist)) {
            _revertWrongFuncCaller();
        }
    }

    function _revertWrongFuncCaller() internal view {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080000, 1037618708488) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00080004, 0) }
        revert("AP: External caller not allowed");
    }

    // should be called by BorrowerOperations or DefaultPool
    // __after__ collateral is transferred to this contract.
    function receiveCollateral(address[] calldata _tokens, uint[] calldata _amounts) external override {
        _requireCallerIsBorrowerOperationsOrDefaultPool();
        poolColl.amounts = _leftSumColls(poolColl, _tokens, _amounts);
        emit ActivePoolBalancesUpdated(_tokens, _amounts);
    }

    // Adds collateral type from whitelist. 
    function addCollateralType(address _collateral) external override {
        _requireCallerIsWhitelist();
        poolColl.tokens.push(_collateral);
        poolColl.amounts.push(0);
    }

}
