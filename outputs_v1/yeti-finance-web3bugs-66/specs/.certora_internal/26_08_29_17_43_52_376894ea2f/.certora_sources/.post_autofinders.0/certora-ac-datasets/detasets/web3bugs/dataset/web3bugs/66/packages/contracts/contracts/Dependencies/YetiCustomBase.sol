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
    {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00250000, 1037618708517) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00250001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00250005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00256001, _coll2) }
        newColls memory coll3;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001002a,0)}

        coll3.tokens = whitelist.getValidCollateral();assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00020044,0)}
        uint256 coll1Len = _coll1.tokens.length;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000002b,coll1Len)}
        uint256 coll2Len = _coll2.tokens.length;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000002c,coll2Len)}
        uint256 coll3Len = coll3.tokens.length;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000002d,coll3Len)}
        coll3.amounts = new uint256[](coll3Len);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00020045,0)}

        uint256 n = 0;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000002e,n)}
        for (uint256 i; i < coll1Len; ++i) {
            uint256 tokenIndex = whitelist.getIndex(_coll1.tokens[i]);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000004e,tokenIndex)}
            if (_coll1.amounts[i] != 0) {
                n++;
                coll3.amounts[tokenIndex] = _coll1.amounts[i];
            }
        }

        for (uint256 i; i < coll2Len; ++i) {
            uint256 tokenIndex = whitelist.getIndex(_coll2.tokens[i]);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000004f,tokenIndex)}
            if (_coll2.amounts[i] != 0) {
                if (coll3.amounts[tokenIndex] == 0) {
                    n++;
                }
                coll3.amounts[tokenIndex] = coll3.amounts[tokenIndex].add(_coll2.amounts[i]);
            }
        }

        address[] memory sumTokens = new address[](n);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001002f,0)}
        uint256[] memory sumAmounts = new uint256[](n);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010030,0)}
        uint256 j;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000031,j)}

        // should only find n amounts over 0
        for (uint256 i; i < coll3Len; ++i) {
            if (coll3.amounts[i] != 0) {
                sumTokens[j] = coll3.tokens[i];
                sumAmounts[j] = coll3.amounts[i];
                j++;
            }
        }
        finalColls.tokens = sumTokens;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00020046,0)}
        finalColls.amounts = sumAmounts;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00020047,0)}
    }


    // gets the sum of coll1 with tokens and amounts
    function _sumColls(
        newColls memory _coll1,
        address[] memory tokens,
        uint256[] memory amounts
    ) internal view returns (newColls memory) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00260000, 1037618708518) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00260001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00260005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00266002, amounts) }
        newColls memory coll2 = newColls(tokens, amounts);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010032,0)}
        return _sumColls(_coll1, coll2);
    }


    function _sumColls(
        address[] memory tokens1,
        uint256[] memory amounts1,
        address[] memory tokens2,
        uint256[] memory amounts2
    ) internal view returns (newColls memory) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00280000, 1037618708520) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00280001, 4) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00280005, 585) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00286003, amounts2) }
        newColls memory coll1 = newColls(tokens1, amounts1);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010033,0)}
        return _sumColls(coll1, tokens2, amounts2);
    }


    // Function for summing colls when coll1 includes all the tokens in the whitelist
    // Used in active, default, stability, and surplus pools
    // assumes _coll1.tokens = all whitelisted tokens
    function _leftSumColls(
        newColls memory _coll1,
        address[] memory _tokens,
        uint256[] memory _amounts
    ) internal view returns (uint[] memory) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00290000, 1037618708521) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00290001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00290005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00296002, _amounts) }
        uint[] memory sumAmounts = _getArrayCopy(_coll1.amounts);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010034,0)}

        uint256 coll1Len = _tokens.length;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000035,coll1Len)}
        // assumes that sumAmounts length = whitelist tokens length.
        for (uint256 i; i < coll1Len; ++i) {
            uint tokenIndex = whitelist.getIndex(_tokens[i]);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000050,tokenIndex)}
            sumAmounts[tokenIndex] = sumAmounts[tokenIndex].add(_amounts[i]);uint256 certora_local82 = sumAmounts[tokenIndex];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000052,certora_local82)}
        }

        return sumAmounts;
    }


    // Function for summing colls when one list is all tokens. Used in active, default, stability, and surplus pools
    function _leftSubColls(newColls memory _coll1, address[] memory _subTokens, uint[] memory _subAmounts)
        internal
        view
        returns (uint[] memory)
    {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00270000, 1037618708519) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00270001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00270005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00276002, _subAmounts) }
        uint[] memory diffAmounts = _getArrayCopy(_coll1.amounts);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010036,0)}

        //assumes that coll1.tokens = whitelist tokens. Keeps all of coll1's tokens, and subtracts coll2's amounts
        uint256 subTokensLen = _subTokens.length;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000037,subTokensLen)}
        for (uint256 i; i < subTokensLen; ++i) {
            uint256 tokenIndex = whitelist.getIndex(_subTokens[i]);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000051,tokenIndex)}
            diffAmounts[tokenIndex] = diffAmounts[tokenIndex].sub(_subAmounts[i]);uint256 certora_local83 = diffAmounts[tokenIndex];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000053,certora_local83)}
        }
        return diffAmounts;
    }
    

    // Returns _coll1 minus _tokens and _amounts
    // will error if _tokens include a token not in _coll1.tokens
    function _subColls(newColls memory _coll1, address[] memory _tokens, uint[] memory _amounts)
        internal
        view
        returns (newColls memory finalColls)
    {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002a0000, 1037618708522) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002a0001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002a0005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002a6002, _amounts) }
        uint256 coll1Len = _coll1.tokens.length;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000038,coll1Len)}
        uint256 tokensLen = _tokens.length;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000039,tokensLen)}
        require(tokensLen == _amounts.length, "SubColls invalid input");

        newColls memory coll3;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001003a,0)}
        coll3.tokens = whitelist.getValidCollateral();assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00020048,0)}
        uint256 coll3Len = coll3.tokens.length;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000003b,coll3Len)}
        coll3.amounts = new uint256[](coll3Len);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00020049,0)}
        uint256 n = 0;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000003c,n)}
        uint256 tokenIndex;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000003d,tokenIndex)}
        uint256 i;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000003e,i)}
        for (; i < coll1Len; ++i) {
            if (_coll1.amounts[i] != 0) {
                tokenIndex = whitelist.getIndex(_coll1.tokens[i]);
                coll3.amounts[tokenIndex] = _coll1.amounts[i];
                n++;
            }
        }
        uint256 thisAmounts;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000003f,thisAmounts)}
        tokenIndex = 0;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000004a,tokenIndex)}
        i = 0;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000004b,i)}
        for (; i < tokensLen; ++i) {
            tokenIndex = whitelist.getIndex(_tokens[i]);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000054,tokenIndex)}
            thisAmounts = _amounts[i];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000055,thisAmounts)}
            require(coll3.amounts[tokenIndex] >= thisAmounts, "illegal sub");
            coll3.amounts[tokenIndex] = coll3.amounts[tokenIndex].sub(thisAmounts);uint256 certora_local86 = coll3.amounts[tokenIndex];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000056,certora_local86)}
            if (coll3.amounts[tokenIndex] == 0) {
                n--;
            }
        }

        address[] memory diffTokens = new address[](n);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010040,0)}
        uint256[] memory diffAmounts = new uint256[](n);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010041,0)}
        
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
        finalColls.tokens = diffTokens;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0002004c,0)}
        finalColls.amounts = diffAmounts;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0002004d,0)}
        // returns finalColls;
    }

    function _getArrayCopy(uint[] memory _arr) internal pure returns (uint[] memory){assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002b0000, 1037618708523) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002b0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002b0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002b6000, _arr) }
        uint256 arrLen = _arr.length;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000042,arrLen)}
        uint[] memory copy = new uint[](arrLen);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010043,0)}
        for (uint256 i; i < arrLen; ++i) {
            copy[i] = _arr[i];uint256 certora_local87 = copy[i];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000057,certora_local87)}
        }
        return copy;
    }
}
