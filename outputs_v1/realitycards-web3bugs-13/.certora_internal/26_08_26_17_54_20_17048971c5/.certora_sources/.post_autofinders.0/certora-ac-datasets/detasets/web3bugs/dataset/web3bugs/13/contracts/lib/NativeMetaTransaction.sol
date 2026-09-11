// SPDX-License-Identifier: AGPL-3.0
pragma solidity 0.8.4;

abstract contract NativeMetaTransaction {
    bool private _initializedEIP712;
    mapping(address => uint256) private _nonces;

    function _initializeEIP712(string memory /*name*/, string memory /*version*/) internal virtual {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00200000, 1037618708512) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00200001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00200004, 9) }
        _initializedEIP712 = true;
    }

    function getNonce(address user) public view returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c0000, 1037618708508) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c6000, user) }
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

    function msgSender() internal view virtual returns (address) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00210000, 1037618708513) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00210001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00210004, 0) }
        return msg.sender;
    }
}
