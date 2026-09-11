// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@mochifi/library/contracts/UniswapV2Library.sol";
import "@mochifi/library/contracts/SushiswapV2Library.sol";
import "../interfaces/ICSSRRouter.sol";
import "../interfaces/ICSSRAdapter.sol";
import "../interfaces/IUniswapV2CSSR.sol";
import "../interfaces/IGovernanceOwned.sol";

contract UniswapV2TokenAdapter is ICSSRAdapter {
    IGovernanceOwned public immutable owned;
    ICSSRRouter public immutable cssrRouter;
    IUniswapV2CSSR public immutable uniswapCSSR;
    IUniswapV2CSSR public immutable sushiCSSR;

    address[] public keyCurrency;
    uint256 public minimumLiquidity;
    mapping(address => bool) public isKeyCurrency;

    modifier onlyGov() {
        require(msg.sender == owned.governance(), "!gov");
        _;
    }

    constructor(
        address _owned,
        address _router,
        address _uniCSSR,
        address _sushiCSSR
    ) {
        owned = IGovernanceOwned(_owned);
        cssrRouter = ICSSRRouter(_router);
        uniswapCSSR = IUniswapV2CSSR(_uniCSSR);
        sushiCSSR = IUniswapV2CSSR(_sushiCSSR);
    }

    function addKeyCurrency(address _currency) external onlyGov {
        keyCurrency.push(_currency);
        isKeyCurrency[_currency] = true;
    }

    function removeKeyCurrency(uint256 _idx, address _currency)
        external
        onlyGov
    {
        require(keyCurrency[_idx] == _currency, "!match");
        keyCurrency[_idx] = keyCurrency[keyCurrency.length - 1];
        keyCurrency.pop();
        isKeyCurrency[_currency] = false;
    }

    function setMinimumLiquidity(uint256 _liquidity)
        external
        onlyGov
    {
        minimumLiquidity = _liquidity;
    }

    function support(address _asset) external view override returns (bool) {
        // check if liquidity passes the minimum
        for (uint256 i = 0; i < keyCurrency.length; i++) {
            if (aboveLiquidity(_asset, keyCurrency[i])) {
                return true;
            }
        }
        return false;
    }

    function update(address _asset, bytes memory _data)
        external
        override
        returns (float memory)
    {
        (uint256 cssrType, bytes memory data) = abi.decode(_data, (uint256, bytes));assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001002d,0)}
        if(cssrType == 0){
            (
                address p,
                bytes memory bd,
                bytes memory ap,
                bytes memory rp,
                bytes memory pp0,
                bytes memory pp1
            ) = abi.decode(data, (address, bytes, bytes, bytes, bytes, bytes));
            require(isKeyCurrency[p], "!keyCurrency");
            (, uint256 bn, ) = uniswapCSSR.saveState(bd);
            address pair = UniswapV2Library.pairFor(
                uniswapCSSR.uniswapFactory(),
                _asset,
                p
            );
            uniswapCSSR.saveReserve(bn, pair, ap, rp, pp0, pp1);
        } else if(cssrType == 1){
            (
                address p,
                bytes memory bd,
                bytes memory ap,
                bytes memory rp,
                bytes memory pp0,
                bytes memory pp1
            ) = abi.decode(data, (address, bytes, bytes, bytes, bytes, bytes));
            require(isKeyCurrency[p], "!keyCurrency");
            (, uint256 bn, ) = sushiCSSR.saveState(bd);
            address pair = SushiswapV2Library.pairFor(
                sushiCSSR.uniswapFactory(),
                _asset,
                p
            );
            sushiCSSR.saveReserve(bn, pair, ap, rp, pp0, pp1);
        } else {
            revert("!supported type");
        }
        return getPrice(_asset);
    }

    function getPriceRaw(address _asset)
        public
        view
        returns (uint256 sumPrice, uint256 sumLiquidity)
    {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130000, 1037618708499) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00136000, _asset) }
        for (uint256 i = 0; i < keyCurrency.length; i++) {
            address key = keyCurrency[i];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000002f,key)}
            float memory currencyPrice = cssrRouter.getPrice(key);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010030,0)}
            if (_asset == key) {
                continue;
            }
            try uniswapCSSR.getLiquidity(_asset, key) returns (uint256 liq) {
                uint256 liquidityValue = convertToValue(liq, currencyPrice);
                if (liquidityValue >= minimumLiquidity) {
                    sumLiquidity += liquidityValue;
                    sumPrice +=
                        convertToValue(
                            uniswapCSSR.getExchangeRatio(_asset, key),
                            currencyPrice
                        ) *
                        liquidityValue;
                }
            } catch {
            }
            try sushiCSSR.getLiquidity(_asset, key) returns (uint256 liq) {
                uint256 liq = sushiCSSR.getLiquidity(_asset,key);
                uint256 liquidityValue = convertToValue(liq, currencyPrice);
                if (liquidityValue >= minimumLiquidity) {
                    sumLiquidity += liquidityValue;
                    sumPrice +=
                        convertToValue(
                            sushiCSSR.getExchangeRatio(_asset, key),
                            currencyPrice
                        ) *
                        liquidityValue;
                }
            } catch {
            }
        }
    }

    function getPrice(address _asset)
        public
        view
        override
        returns (float memory price)
    {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120000, 1037618708498) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00126000, _asset) }
        (uint256 sumPrice, uint256 sumLiquidity) = getPriceRaw(_asset);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001002e,0)}
        require(sumLiquidity > 0, "!updated");
        return float({numerator: sumPrice / 2**112, denominator: sumLiquidity});
    }

    function getLiquidity(address _asset)
        external
        view
        override
        returns (uint256 sum)
    {
        for (uint256 i = 0; i < keyCurrency.length; i++) {
            address key = keyCurrency[i];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000031,key)}
            float memory currencyPrice = cssrRouter.getPrice(key);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010032,0)}
            if (_asset == key) {
                continue;
            }
            try uniswapCSSR.getLiquidity(_asset, key) returns (uint256 liq) {
                uint256 liquidityValue = convertToValue(liq, currencyPrice);
                if (liquidityValue >= minimumLiquidity) {
                    sum += liquidityValue;
                }
            } catch {
            }
            try sushiCSSR.getLiquidity(_asset, key) returns (uint256 liq) {
                uint256 liquidityValue = convertToValue(liq, currencyPrice);
                if (liquidityValue >= minimumLiquidity) {
                    sum += liquidityValue;
                }
            } catch {
            }
        }
    }

    function aboveLiquidity(address _asset, address _pairedWith)
        public
        view
        returns (bool)
    {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110000, 1037618708497) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00116001, _pairedWith) }
        try uniswapCSSR.getLiquidity(_asset, _pairedWith) returns (
            uint256 liq
        ) {
            float memory price = cssrRouter.getPrice(_pairedWith);
            return convertToValue(liq, price) >= minimumLiquidity;
        } catch {
            try sushiCSSR.getLiquidity(_asset, _pairedWith) returns (
                uint256 liq
            ) {
                float memory price = cssrRouter.getPrice(_pairedWith);
                return convertToValue(liq, price) >= minimumLiquidity;
            } catch {
                return false;
            }
        }
    }

    function convertToValue(uint256 _amount, float memory _price)
        internal
        pure
        returns (uint256)
    {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100000, 1037618708496) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00106001, _price) }
        return (_amount * _price.numerator) / _price.denominator;
    }
}
