// SPDX-License-Identifier: AGPL-3.0
pragma solidity 0.8.4;

abstract contract NativeMetaTransaction {
    bool private _initializedEIP712;
    mapping(address => uint256) private _nonces;

    function _initializeEIP712(string memory /*name*/, string memory /*version*/) internal virtual {
        _initializedEIP712 = true;
    }

    function getNonce(address user) public view returns (uint256) {
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

    function msgSender() internal view virtual returns (address) {
        return msg.sender;
    }
}
