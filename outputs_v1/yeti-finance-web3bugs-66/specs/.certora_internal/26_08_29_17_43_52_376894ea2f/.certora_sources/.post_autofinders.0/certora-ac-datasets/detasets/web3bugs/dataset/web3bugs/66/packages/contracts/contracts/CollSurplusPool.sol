// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.6.11;

import "./Interfaces/ICollSurplusPool.sol";
import "./Interfaces/IWhitelist.sol";
import "./Dependencies/SafeMath.sol";
import "./Dependencies/Ownable.sol";
import "./Dependencies/CheckContract.sol";
import "./Dependencies/LiquityBase.sol";
import "./Interfaces/IWAsset.sol";


/**
 * The CollSurplusPool holds all the bonus collateral that occurs from liquidations and
 * redemptions, to be claimed by the trove owner.ß
 */
contract CollSurplusPool is Ownable, CheckContract, ICollSurplusPool, LiquityBase {
    using SafeMath for uint256;

    string public constant NAME = "CollSurplusPool";

    address internal borrowerOperationsAddress;
    address internal troveManagerAddress;
    address internal troveManagerRedemptionsAddress;
    address internal activePoolAddress;

    // deposited collateral tracker. Colls is always the whitelist list of all collateral tokens. Amounts
    newColls internal poolColl;

    // Collateral surplus claimable by trove owners
    mapping(address => newColls) internal balances;

    // --- Events ---

    event BorrowerOperationsAddressChanged(address _newBorrowerOperationsAddress);
    event TroveManagerAddressChanged(address _newTroveManagerAddress);
    event ActivePoolAddressChanged(address _newActivePoolAddress);

    event CollBalanceUpdated(address indexed _account);
    event CollateralSent(address _to);

    // --- Contract setters ---

    function setAddresses(
        address _borrowerOperationsAddress,
        address _troveManagerAddress,
        address _troveManagerRedemptionsAddress,
        address _activePoolAddress,
        address _whitelistAddress
    ) external override onlyOwner {
        checkContract(_borrowerOperationsAddress);
        checkContract(_troveManagerAddress);
        checkContract(_troveManagerRedemptionsAddress);
        checkContract(_activePoolAddress);
        checkContract(_whitelistAddress);

        borrowerOperationsAddress = _borrowerOperationsAddress;
        troveManagerAddress = _troveManagerAddress;
        troveManagerRedemptionsAddress = _troveManagerRedemptionsAddress;
        activePoolAddress = _activePoolAddress;
        whitelist = IWhitelist(_whitelistAddress);

        emit BorrowerOperationsAddressChanged(_borrowerOperationsAddress);
        emit TroveManagerAddressChanged(_troveManagerAddress);
        emit ActivePoolAddressChanged(_activePoolAddress);

        _renounceOwnership();
    }

    /*
     * Returns the VC of the contract
     *
     * Not necessarily equal to the the contract's raw VC balance - Collateral can be forcibly sent to contracts.
     *
     * Computed when called by taking the collateral balances and
     * multiplying them by the corresponding price and ratio and then summing that
     */
    function getCollVC() external view override returns (uint256) {
        return _getVCColls(poolColl);
    }

    /*
     * View function for getting the amount claimable by a particular trove owner.
     */
    function getAmountClaimable(address _account, address _collateral)
        external
        view
        override
        returns (uint256)
    {
        uint256 collateralIndex = whitelist.getIndex(_collateral);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000001,collateralIndex)}
        if (balances[_account].amounts.length > collateralIndex) {
            return balances[_account].amounts[collateralIndex];
        }
        return 0;
    }

    /*
     * Returns the collateralBalance for a given collateral
     *
     * Returns the amount of a given collateral in state. Not necessarily the contract's actual balance.
     */
    function getCollateral(address _collateral) external view override returns (uint256) {
        uint256 collateralIndex = whitelist.getIndex(_collateral);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000002,collateralIndex)}
        return poolColl.amounts[collateralIndex];
    }

    /*
     *
     * Returns all collateral balances in state. Not necessarily the contract's actual balances.
     */
    function getAllCollateral() external view override returns (address[] memory, uint256[] memory) {
        return (poolColl.tokens, poolColl.amounts);
    }

    // --- Pool functionality ---

    // Surplus value is accounted by the trove manager.
    function accountSurplus(
        address _account,
        address[] memory _tokens,
        uint256[] memory _amounts
    ) external override {
        _requireCallerIsTroveManager();
        balances[_account] = _sumColls(balances[_account], _tokens, _amounts);
        emit CollBalanceUpdated(_account);
    }

    // Function called by borrower operations which claims the collateral that is owned by
    // a particular trove user.
    function claimColl(address _account) external override {
        _requireCallerIsBorrowerOperations();

        newColls memory claimableColl = balances[_account];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010003,0)}
        require(_CollsIsNonZero(claimableColl), "CSP: No collateral available");

        balances[_account].amounts = new uint256[](poolColl.tokens.length); // sets balance of account to 0
        emit CollBalanceUpdated(_account);

        poolColl.amounts = _leftSubColls(poolColl, claimableColl.tokens, claimableColl.amounts);
        emit CollateralSent(_account);

        bool success = _sendColl(_account, claimableColl);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000004,success)}
        require(success, "CSP: sending Collateral failed");
    }

    // --- 'require' functions ---

    function _requireCallerIsBorrowerOperations() internal view {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000004, 0) }
        if (
            msg.sender != borrowerOperationsAddress) {
            _revertWrongFuncCaller();
        }
    }

    function _requireCallerIsTroveManager() internal view {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010000, 1037618708481) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010004, 0) }
        if (
            msg.sender != troveManagerAddress && msg.sender != troveManagerRedemptionsAddress) {
            _revertWrongFuncCaller();
        }
    }

    function _requireCallerIsActivePool() internal view {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030000, 1037618708483) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00030004, 0) }
        if (msg.sender != activePoolAddress) {
            _revertWrongFuncCaller();
        }
    }

    function _requireCallerIsWhitelist() internal view {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040000, 1037618708484) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00040004, 0) }
        if (msg.sender != address(whitelist)) {
            _revertWrongFuncCaller();
        }
    }

    function _revertWrongFuncCaller() internal view{assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020000, 1037618708482) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00020004, 0) }
        revert("CSP: External caller not allowed");
    }

    function receiveCollateral(address[] memory _tokens, uint256[] memory _amounts)
        external
        override
    {
        _requireCallerIsActivePool();
        poolColl.amounts = _leftSumColls(poolColl, _tokens, _amounts);
    }

    // Adds collateral type from the whitelist.
    function addCollateralType(address _collateral) external override {
        _requireCallerIsWhitelist();
        poolColl.tokens.push(_collateral);
        poolColl.amounts.push(0);
    }

    // Function to send collateral out to an address, and checks if the asset is wrapped so that it can 
    // unwrap in that case. 
    function _sendColl(address _to, newColls memory _colls) internal returns (bool) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050000, 1037618708485) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00050005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00056001, _colls) }
        uint256 tokensLen = _colls.tokens.length;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000005,tokensLen)}
        for (uint256 i; i < tokensLen; ++i) {
            address token = _colls.tokens[i];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000006,token)}
            if (whitelist.isWrapped(token)) {
                // Collects rewards automatically for that amount and unwraps for the original borrower. 
                // CSP actually owns these assets so it transfers it from this contract to the _to param. 
                IWAsset(token).unwrapFor(_to, _to, _colls.amounts[i]);
            } else {
                // Otherwise transfer like normal ERC20
                if (!IERC20(token).transfer(_to, _colls.amounts[i])) {
                    return false;
                }
            }
        }
        return true;
    }
}
