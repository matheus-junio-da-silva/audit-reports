// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.6.11;

import "./LiquityMath.sol";
import "../Interfaces/IActivePool.sol";
import "../Interfaces/IDefaultPool.sol";
import "../Interfaces/ILiquityBase.sol";
import "./YetiCustomBase.sol";


/* 
* Base contract for TroveManager, BorrowerOperations and StabilityPool. Contains global system constants and
* common functions. 
*/
contract LiquityBase is ILiquityBase, YetiCustomBase {

    uint constant public _100pct = 1e18; // 1e18 == 100%

    uint constant public _110pct = 11e17; // 1.1e18 == 110%

    // Minimum collateral ratio for individual troves
    uint constant public MCR = 11e17; // 110%

    // Critical system collateral ratio. If the system's total collateral ratio (TCR) falls below the CCR, Recovery Mode is triggered.
    uint constant public CCR = 15e17; // 150%

    // Amount of YUSD to be locked in gas pool on opening troves
    uint constant public YUSD_GAS_COMPENSATION = 200e18;

    // Minimum amount of net YUSD debt a must have
    uint constant public MIN_NET_DEBT = 1800e18;
    // uint constant public MIN_NET_DEBT = 0; 

    uint constant public PERCENT_DIVISOR = 200; // dividing by 200 yields 0.5%

    uint constant public BORROWING_FEE_FLOOR = DECIMAL_PRECISION / 1000 * 5; // 0.5%
    uint constant public REDEMPTION_FEE_FLOOR = DECIMAL_PRECISION / 1000 * 5; // 0.5%

    IActivePool internal activePool;

    IDefaultPool internal defaultPool;

    // --- Gas compensation functions ---

    // Returns the composite debt (drawn debt + gas compensation) of a trove, for the purpose of ICR calculation
    function _getCompositeDebt(uint _debt) internal pure returns (uint) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0000, 1037618708491) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000b6000, _debt) }
        return _debt.add(YUSD_GAS_COMPENSATION);
    }


    function _getNetDebt(uint _debt) internal pure returns (uint) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0000, 1037618708492) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c6000, _debt) }
        return _debt.sub(YUSD_GAS_COMPENSATION);
    }



    // Return the system's Total Virtual Coin Balance
    // Virtual Coins are a way to keep track of the system collateralization given
    // the collateral ratios of each collateral type
    function getEntireSystemColl() public view returns (uint) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070000, 1037618708487) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00070004, 0) }
        uint activeColl = activePool.getVC();assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000008,activeColl)}
        uint liquidatedColl = defaultPool.getVC();assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000009,liquidatedColl)}

        return activeColl.add(liquidatedColl);
    }


    function getEntireSystemDebt() public override view returns (uint) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060000, 1037618708486) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00060004, 0) }
        uint activeDebt = activePool.getYUSDDebt();assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000a,activeDebt)}
        uint closedDebt = defaultPool.getYUSDDebt();assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000b,closedDebt)}

        return activeDebt.add(closedDebt);
    }


    function _getICRColls(newColls memory _colls, uint _debt) internal view returns (uint ICR) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0000, 1037618708494) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e6001, _debt) }
        uint totalVC = _getVCColls(_colls);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000c,totalVC)}
        ICR = LiquityMath._computeCR(totalVC, _debt);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000016,ICR)}
    }


    function _getVC(address[] memory _tokens, uint[] memory _amounts) internal view returns (uint totalVC) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0000, 1037618708495) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f6001, _amounts) }
        uint256 tokensLen = _tokens.length;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000d,tokensLen)}
        require(tokensLen == _amounts.length, "Not same length");
        for (uint256 i; i < tokensLen; ++i) {
            uint tokenVC = whitelist.getValueVC(_tokens[i], _amounts[i]);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000018,tokenVC)}
            totalVC = totalVC.add(tokenVC);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000001b,totalVC)}
        }
    }


    function _getVCColls(newColls memory _colls) internal view returns (uint VC) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0000, 1037618708493) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d6000, _colls) }
        uint256 tokensLen = _colls.tokens.length;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000e,tokensLen)}
        for (uint256 i; i < tokensLen; ++i) {
            uint valueVC = whitelist.getValueVC(_colls.tokens[i], _colls.amounts[i]);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000019,valueVC)}
            VC = VC.add(valueVC);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000001c,VC)}
        }
    }


    function _getUSDColls(newColls memory _colls) internal view returns (uint USDValue) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100000, 1037618708496) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00106000, _colls) }
        uint256 tokensLen = _colls.tokens.length;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000f,tokensLen)}
        for (uint256 i; i < tokensLen; ++i) {
            uint valueUSD = whitelist.getValueUSD(_colls.tokens[i], _colls.amounts[i]);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000001a,valueUSD)}
            USDValue = USDValue.add(valueUSD);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000001d,USDValue)}
        }
    }


    function _getTCR() internal view returns (uint TCR) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110000, 1037618708497) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110004, 0) }
        uint entireSystemColl = getEntireSystemColl();assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000010,entireSystemColl)}
        uint entireSystemDebt = getEntireSystemDebt();assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000011,entireSystemDebt)}
        
        TCR = LiquityMath._computeCR(entireSystemColl, entireSystemDebt);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000017,TCR)}
    }


    function _checkRecoveryMode() internal view returns (bool) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120000, 1037618708498) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120004, 0) }
        uint TCR = _getTCR();assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000012,TCR)}
        return TCR < CCR;
    }

    // fee and amount are denominated in dollar
    function _requireUserAcceptsFee(uint _fee, uint _amount, uint _maxFeePercentage) internal pure {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130000, 1037618708499) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00136002, _maxFeePercentage) }
        uint feePercentage = _fee.mul(DECIMAL_PRECISION).div(_amount);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000013,feePercentage)}
        require(feePercentage <= _maxFeePercentage, "Fee > max");
    }

    // checks coll has a nonzero balance of at least one token in coll.tokens
    function _CollsIsNonZero(newColls memory _colls) internal pure returns (bool) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00140000, 1037618708500) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00140001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00140005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00146000, _colls) }
        uint256 tokensLen = _colls.tokens.length;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000014,tokensLen)}
        for (uint256 i; i < tokensLen; ++i) {
            if (_colls.amounts[i] != 0) {
                return true;
            }
        }
        return false;
    }


    // Check whether or not the system *would be* in Recovery Mode, given the entire system coll and debt.
    // returns true if the system would be in recovery mode and false if not
    function _checkPotentialRecoveryMode(uint _entireSystemColl, uint _entireSystemDebt)
    internal
    pure
    returns (bool)
    {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00150000, 1037618708501) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00150001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00150005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00156001, _entireSystemDebt) }
        uint TCR = LiquityMath._computeCR(_entireSystemColl, _entireSystemDebt);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000015,TCR)}

        return TCR < CCR;
    }



}
