// SPDX-License-Identifier: AGPL-3.0

pragma solidity ^0.8.0;

import "../interfaces/IMochiEngine.sol";

contract MinterV0 is IMinter {
    IMochiEngine public immutable engine;

    mapping(address => bool) public isMinter;

    address[] public factories;

    constructor(address _engine) {
        engine = IMochiEngine(_engine);
    }

    modifier onlyPermission() {
        require(hasPermission(msg.sender), "!permission");
        _;
    }

    modifier onlyGov() {
        require(msg.sender == engine.governance(), "!gov");
        _;
    }

    function addMinter(address _minter) external onlyGov {
        isMinter[_minter] = true;
    }

    function removeMinter(address _minter) external onlyGov {
        isMinter[_minter] = false;
    }

    function mint(address _to, uint256 _amount)
        external
        override
        onlyPermission
    {
        engine.usdm().mint(_to, _amount);
    }

    function hasPermission(address _user) public view override returns (bool) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000000, 1037618708480) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00000005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00006000, _user) }
        return isMinter[_user] || isVault(_user);
    }

    function isVault(address _vault) public view override returns (bool) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010000, 1037618708481) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00010005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00016000, _vault) }
        return
            address(
                engine.vaultFactory().getVault(
                    address(IMochiVault(_vault).asset())
                )
            ) == _vault;
    }
}
