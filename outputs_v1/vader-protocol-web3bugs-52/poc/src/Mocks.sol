// SPDX-License-Identifier: Unlicense
pragma solidity =0.8.9;

import "contracts/interfaces/shared/IERC20Extended.sol";
import "contracts/interfaces/dex-v2/synth/ISynthFactory.sol";
import "contracts/interfaces/dex-v2/synth/ISynth.sol";
import "contracts/interfaces/dex-v2/wrapper/ILPWrapper.sol";

contract ERC20Mock is IERC20Extended {
    string public name;
    string public symbol;
    uint8 public decimals = 18;
    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    constructor(string memory _name, string memory _symbol) {
        name = _name;
        symbol = _symbol;
    }

    function mint(address to, uint256 amount) external {
        totalSupply += amount;
        balanceOf[to] += amount;
    }

    function burn(uint256 amount) external {
        totalSupply -= amount;
        balanceOf[msg.sender] -= amount;
    }

    function transfer(address to, uint256 amount) external returns (bool) {
        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;
        return true;
    }

    function transferFrom(address from, address to, uint256 amount)
        external
        returns (bool)
    {
        allowance[from][msg.sender] -= amount;
        balanceOf[from] -= amount;
        balanceOf[to] += amount;
        return true;
    }

    function approve(address spender, uint256 amount) external returns (bool) {
        allowance[msg.sender][spender] = amount;
        return true;
    }
}

contract SynthFactoryMock is ISynthFactory {
    mapping(IERC20 => ISynth) private reg;

    function synths(IERC20 token) external view override returns (ISynth) {
        return reg[token];
    }

    function setSynth(IERC20 token, ISynth synth) external {
        reg[token] = synth;
    }

    function createSynth(IERC20Extended token)
        external
        override
        returns (ISynth)
    {
        ISynth s = reg[IERC20(address(token))];
        require(address(s) != address(0), "SynthFactoryMock: unregistered");
        return s;
    }
}

contract WrapperMock is ILPWrapper {
    mapping(IERC20 => IERC20Extended) private reg;

    function tokens(IERC20 foreignAsset)
        external
        view
        override
        returns (IERC20Extended)
    {
        return reg[foreignAsset];
    }

    function setToken(IERC20 foreignAsset, IERC20Extended token) external {
        reg[foreignAsset] = token;
    }

    function createWrapper(IERC20 foreignAsset) external override {}
}