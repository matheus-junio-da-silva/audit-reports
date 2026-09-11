// SPDX-License-Identifier: AGPL-3.0
pragma solidity 0.8.4;

abstract contract NativeMetaTransaction {
    bool private _initializedEIP712;
    mapping(address => uint256) private _nonces;

    function _initializeEIP712(string memory /*name*/, string memory /*version*/) internal virtual {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff003a0000, 1037618708538) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff003a0001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff003a0004, 9) }
        _initializedEIP712 = true;
    }

    function getNonce(address user) public view returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00390000, 1037618708537) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00390001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00390005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00396000, user) }
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

    function msgSender() internal view virtual returns (address) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff003b0000, 1037618708539) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff003b0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff003b0004, 0) }
        return msg.sender;
    }
}
