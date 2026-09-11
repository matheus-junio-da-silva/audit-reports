// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.6.11;

import "./BaseMath.sol";
import "./SafeMath.sol";
import "../Interfaces/IERC20.sol";
import "../Interfaces/IWhitelist.sol";


contract YetiCustomBase is BaseMath {
    using SafeMath for uint256;

    IWhitelist whitelist;

    struct newColls {
        // tokens and amounts should be the same length
        address[] tokens;
        uint256[] amounts;
    }

    // Collateral math

    // gets the sum of _coll1 and _coll2
    function _sumColls(newColls memory _coll1, newColls memory _coll2)
        internal
        view
        returns (newColls memory finalColls)
    {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00320000, 1037618708530) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00320001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00320005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00326001, _coll2) }
        newColls memory coll3;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001002f,0)}

        coll3.tokens = whitelist.getValidCollateral();assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00020049,0)}
        uint256 coll1Len = _coll1.tokens.length;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000030,coll1Len)}
        uint256 coll2Len = _coll2.tokens.length;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000031,coll2Len)}
        uint256 coll3Len = coll3.tokens.length;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000032,coll3Len)}
        coll3.amounts = new uint256[](coll3Len);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0002004a,0)}

        uint256 n = 0;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000033,n)}
        for (uint256 i; i < coll1Len; ++i) {
            uint256 tokenIndex = whitelist.getIndex(_coll1.tokens[i]);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000053,tokenIndex)}
            if (_coll1.amounts[i] != 0) {
                n++;
                coll3.amounts[tokenIndex] = _coll1.amounts[i];
            }
        }

        for (uint256 i; i < coll2Len; ++i) {
            uint256 tokenIndex = whitelist.getIndex(_coll2.tokens[i]);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000054,tokenIndex)}
            if (_coll2.amounts[i] != 0) {
                if (coll3.amounts[tokenIndex] == 0) {
                    n++;
                }
                coll3.amounts[tokenIndex] = coll3.amounts[tokenIndex].add(_coll2.amounts[i]);
            }
        }

        address[] memory sumTokens = new address[](n);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010034,0)}
        uint256[] memory sumAmounts = new uint256[](n);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010035,0)}
        uint256 j;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000036,j)}

        // should only find n amounts over 0
        for (uint256 i; i < coll3Len; ++i) {
            if (coll3.amounts[i] != 0) {
                sumTokens[j] = coll3.tokens[i];
                sumAmounts[j] = coll3.amounts[i];
                j++;
            }
        }
        finalColls.tokens = sumTokens;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0002004b,0)}
        finalColls.amounts = sumAmounts;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0002004c,0)}
    }


    // gets the sum of coll1 with tokens and amounts
    function _sumColls(
        newColls memory _coll1,
        address[] memory tokens,
        uint256[] memory amounts
    ) internal view returns (newColls memory) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00330000, 1037618708531) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00330001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00330005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00336002, amounts) }
        newColls memory coll2 = newColls(tokens, amounts);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010037,0)}
        return _sumColls(_coll1, coll2);
    }


    function _sumColls(
        address[] memory tokens1,
        uint256[] memory amounts1,
        address[] memory tokens2,
        uint256[] memory amounts2
    ) internal view returns (newColls memory) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00350000, 1037618708533) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00350001, 4) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00350005, 585) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00356003, amounts2) }
        newColls memory coll1 = newColls(tokens1, amounts1);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010038,0)}
        return _sumColls(coll1, tokens2, amounts2);
    }


    // Function for summing colls when coll1 includes all the tokens in the whitelist
    // Used in active, default, stability, and surplus pools
    // assumes _coll1.tokens = all whitelisted tokens
    function _leftSumColls(
        newColls memory _coll1,
        address[] memory _tokens,
        uint256[] memory _amounts
    ) internal view returns (uint[] memory) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00360000, 1037618708534) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00360001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00360005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00366002, _amounts) }
        uint[] memory sumAmounts = _getArrayCopy(_coll1.amounts);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010039,0)}

        uint256 coll1Len = _tokens.length;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000003a,coll1Len)}
        // assumes that sumAmounts length = whitelist tokens length.
        for (uint256 i; i < coll1Len; ++i) {
            uint tokenIndex = whitelist.getIndex(_tokens[i]);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000055,tokenIndex)}
            sumAmounts[tokenIndex] = sumAmounts[tokenIndex].add(_amounts[i]);uint256 certora_local87 = sumAmounts[tokenIndex];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000057,certora_local87)}
        }

        return sumAmounts;
    }


    // Function for summing colls when one list is all tokens. Used in active, default, stability, and surplus pools
    function _leftSubColls(newColls memory _coll1, address[] memory _subTokens, uint[] memory _subAmounts)
        internal
        view
        returns (uint[] memory)
    {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00340000, 1037618708532) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00340001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00340005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00346002, _subAmounts) }
        uint[] memory diffAmounts = _getArrayCopy(_coll1.amounts);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001003b,0)}

        //assumes that coll1.tokens = whitelist tokens. Keeps all of coll1's tokens, and subtracts coll2's amounts
        uint256 subTokensLen = _subTokens.length;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000003c,subTokensLen)}
        for (uint256 i; i < subTokensLen; ++i) {
            uint256 tokenIndex = whitelist.getIndex(_subTokens[i]);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000056,tokenIndex)}
            diffAmounts[tokenIndex] = diffAmounts[tokenIndex].sub(_subAmounts[i]);uint256 certora_local88 = diffAmounts[tokenIndex];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000058,certora_local88)}
        }
        return diffAmounts;
    }
    

    // Returns _coll1 minus _tokens and _amounts
    // will error if _tokens include a token not in _coll1.tokens
    function _subColls(newColls memory _coll1, address[] memory _tokens, uint[] memory _amounts)
        internal
        view
        returns (newColls memory finalColls)
    {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00370000, 1037618708535) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00370001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00370005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00376002, _amounts) }
        uint256 coll1Len = _coll1.tokens.length;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000003d,coll1Len)}
        uint256 tokensLen = _tokens.length;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000003e,tokensLen)}
        require(tokensLen == _amounts.length, "SubColls invalid input");

        newColls memory coll3;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001003f,0)}
        coll3.tokens = whitelist.getValidCollateral();assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0002004d,0)}
        uint256 coll3Len = coll3.tokens.length;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000040,coll3Len)}
        coll3.amounts = new uint256[](coll3Len);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0002004e,0)}
        uint256 n = 0;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000041,n)}
        uint256 tokenIndex;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000042,tokenIndex)}
        uint256 i;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000043,i)}
        for (; i < coll1Len; ++i) {
            if (_coll1.amounts[i] != 0) {
                tokenIndex = whitelist.getIndex(_coll1.tokens[i]);
                coll3.amounts[tokenIndex] = _coll1.amounts[i];
                n++;
            }
        }
        uint256 thisAmounts;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000044,thisAmounts)}
        tokenIndex = 0;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000004f,tokenIndex)}
        i = 0;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000050,i)}
        for (; i < tokensLen; ++i) {
            tokenIndex = whitelist.getIndex(_tokens[i]);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000059,tokenIndex)}
            thisAmounts = _amounts[i];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000005a,thisAmounts)}
            require(coll3.amounts[tokenIndex] >= thisAmounts, "illegal sub");
            coll3.amounts[tokenIndex] = coll3.amounts[tokenIndex].sub(thisAmounts);uint256 certora_local91 = coll3.amounts[tokenIndex];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000005b,certora_local91)}
            if (coll3.amounts[tokenIndex] == 0) {
                n--;
            }
        }

        address[] memory diffTokens = new address[](n);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010045,0)}
        uint256[] memory diffAmounts = new uint256[](n);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010046,0)}
        
        if (n != 0) {
            uint j;
            i = 0;
            for (; i < coll3Len; ++i) {
                if (coll3.amounts[i] != 0) {
                    diffTokens[j] = coll3.tokens[i];
                    diffAmounts[j] = coll3.amounts[i];
                    ++j;
                }
            }
        }
        finalColls.tokens = diffTokens;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00020051,0)}
        finalColls.amounts = diffAmounts;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00020052,0)}
        // returns finalColls;
    }

    function _getArrayCopy(uint[] memory _arr) internal pure returns (uint[] memory){assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00380000, 1037618708536) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00380001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00380005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00386000, _arr) }
        uint256 arrLen = _arr.length;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000047,arrLen)}
        uint[] memory copy = new uint[](arrLen);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010048,0)}
        for (uint256 i; i < arrLen; ++i) {
            copy[i] = _arr[i];uint256 certora_local92 = copy[i];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000005c,certora_local92)}
        }
        return copy;
    }
}
