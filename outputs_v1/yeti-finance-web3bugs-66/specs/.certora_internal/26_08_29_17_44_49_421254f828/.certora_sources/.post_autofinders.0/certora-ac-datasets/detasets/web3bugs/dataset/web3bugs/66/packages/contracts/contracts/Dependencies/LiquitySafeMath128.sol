// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.6.11;

// uint128 addition and subtraction, with overflow protection.

library LiquitySafeMath128 {
    function add(uint128 a, uint128 b) internal pure returns (uint128) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001f0000, 1037618708511) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001f0001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001f0005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001f6001, b) }
        uint128 c = a + b;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000025,c)}
        require(c >= a, "LiquitySafeMath128: addition overflow");

        return c;
    }
   
    function sub(uint128 a, uint128 b) internal pure returns (uint128) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00200000, 1037618708512) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00200001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00200005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00206001, b) }
        require(b <= a, "LiquitySafeMath128: subtraction overflow");
        uint128 c = a - b;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000026,c)}

        return c;
    }
}