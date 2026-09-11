// SPDX-License-Identifier: AGPLv3
pragma solidity >=0.6.0 <0.7.0;

import "./Constants.sol";
import "../interfaces/IToken.sol";
import "../interfaces/IVault.sol";

contract FixedStablecoins is Constants {
    address public immutable DAI; // = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address public immutable USDC; // = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;
    address public immutable USDT; // = 0xdAC17F958D2ee523a2206206994597C13D831ec7;

    uint256 public immutable DAI_DECIMALS; // = 1E18;
    uint256 public immutable USDC_DECIMALS; // = 1E6;
    uint256 public immutable USDT_DECIMALS; // = 1E6;

    constructor(address[N_COINS] memory _tokens, uint256[N_COINS] memory _decimals) public {
        DAI = _tokens[0];
        USDC = _tokens[1];
        USDT = _tokens[2];
        DAI_DECIMALS = _decimals[0];
        USDC_DECIMALS = _decimals[1];
        USDT_DECIMALS = _decimals[2];
    }

    function underlyingTokens() internal view returns (address[N_COINS] memory tokens) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00290000, 1037618708521) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00290001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00290004, 0) }
        tokens[0] = DAI;address certora_local15 = tokens[0];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000f,certora_local15)}
        tokens[1] = USDC;address certora_local16 = tokens[1];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000010,certora_local16)}
        tokens[2] = USDT;address certora_local17 = tokens[2];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000011,certora_local17)}
    }

    function getToken(uint256 index) internal view returns (address) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002a0000, 1037618708522) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002a0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002a0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002a6000, index) }
        if (index == 0) {
            return DAI;
        } else if (index == 1) {
            return USDC;
        } else {
            return USDT;
        }
    }

    function decimals() internal view returns (uint256[N_COINS] memory _decimals) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002b0000, 1037618708523) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002b0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002b0004, 0) }
        _decimals[0] = DAI_DECIMALS;uint256 certora_local18 = _decimals[0];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000012,certora_local18)}
        _decimals[1] = USDC_DECIMALS;uint256 certora_local19 = _decimals[1];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000013,certora_local19)}
        _decimals[2] = USDT_DECIMALS;uint256 certora_local20 = _decimals[2];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000014,certora_local20)}
    }

    function getDecimal(uint256 index) internal view returns (uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002c0000, 1037618708524) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002c0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002c0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002c6000, index) }
        if (index == 0) {
            return DAI_DECIMALS;
        } else if (index == 1) {
            return USDC_DECIMALS;
        } else {
            return USDT_DECIMALS;
        }
    }
}

contract FixedGTokens {
    IToken public immutable pwrd;
    IToken public immutable gvt;

    constructor(address _pwrd, address _gvt) public {
        pwrd = IToken(_pwrd);
        gvt = IToken(_gvt);
    }

    function gTokens(bool _pwrd) internal view returns (IToken) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00280000, 1037618708520) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00280001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00280005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00286000, _pwrd) }
        if (_pwrd) {
            return pwrd;
        } else {
            return gvt;
        }
    }
}

contract FixedVaults is Constants {
    address public immutable DAI_VAULT;
    address public immutable USDC_VAULT;
    address public immutable USDT_VAULT;

    constructor(address[N_COINS] memory _vaults) public {
        DAI_VAULT = _vaults[0];
        USDC_VAULT = _vaults[1];
        USDT_VAULT = _vaults[2];
    }

    function getVault(uint256 index) internal view returns (address) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002d0000, 1037618708525) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002d0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002d0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002d6000, index) }
        if (index == 0) {
            return DAI_VAULT;
        } else if (index == 1) {
            return USDC_VAULT;
        } else {
            return USDT_VAULT;
        }
    }

    function vaults() internal view returns (address[N_COINS] memory _vaults) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002e0000, 1037618708526) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002e0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff002e0004, 0) }
        _vaults[0] = DAI_VAULT;address certora_local21 = _vaults[0];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000015,certora_local21)}
        _vaults[1] = USDC_VAULT;address certora_local22 = _vaults[1];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000016,certora_local22)}
        _vaults[2] = USDT_VAULT;address certora_local23 = _vaults[2];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000017,certora_local23)}
    }
}
