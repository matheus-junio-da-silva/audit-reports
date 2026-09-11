// SPDX-License-Identifier: AGPL-3.0
pragma solidity 0.8.4;

abstract contract NativeMetaTransaction {
    bool private _initializedEIP712;
    mapping(address => uint256) private _nonces;

    function _initializeEIP712(string memory /*name*/, string memory /*version*/) internal virtual {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c0000, 1037618708508) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c0001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c0004, 9) }
        _initializedEIP712 = true;
    }

    function getNonce(address user) public view returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b0000, 1037618708507) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b6000, user) }
        return _nonces[user];
    }

    function executeMetaTransaction(
        address user,
        address targets,
        bytes calldata callDatas,
        uint256 gasValues,
        bytes calldata signatures,
        bytes calldata datas
    ) external payable {
        // Stub for AST extraction
    }

    function msgSender() internal view virtual returns (address) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001d0000, 1037618708509) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001d0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001d0004, 0) }
        return msg.sender;
    }
}
