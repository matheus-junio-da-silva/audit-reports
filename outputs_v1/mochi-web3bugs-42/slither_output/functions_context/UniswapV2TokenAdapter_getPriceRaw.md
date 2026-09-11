# Context: UniswapV2TokenAdapter.getPriceRaw

**Contract:** `UniswapV2TokenAdapter` (Inherits: ICSSRAdapter)
**Signature:** `getPriceRaw(address) returns (uint256, uint256)`
**Method Selector ID:** `0x9178bc7e`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** cssrRouter, keyCurrency, minimumLiquidity, sushiCSSR, uniswapCSSR
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IUniswapV2CSSR.TMP_43(uint256) = HIGH_LEVEL_CALL, dest:sushiCSSR(IUniswapV2CSSR), function:getExchangeRatio, arguments:['_asset', 'key']  `
- `IUniswapV2CSSR.TMP_33(uint256) = HIGH_LEVEL_CALL, dest:uniswapCSSR(IUniswapV2CSSR), function:getLiquidity, arguments:['_asset', 'key']  `
- `IUniswapV2CSSR.TMP_39(uint256) = HIGH_LEVEL_CALL, dest:sushiCSSR(IUniswapV2CSSR), function:getLiquidity, arguments:['_asset', 'key']  `
- `ICSSRRouter.TMP_31(float) = HIGH_LEVEL_CALL, dest:cssrRouter(ICSSRRouter), function:getPrice, arguments:['key']  `
- `IUniswapV2CSSR.TMP_36(uint256) = HIGH_LEVEL_CALL, dest:uniswapCSSR(IUniswapV2CSSR), function:getExchangeRatio, arguments:['_asset', 'key']  `
- `IUniswapV2CSSR.TMP_40(uint256) = HIGH_LEVEL_CALL, dest:sushiCSSR(IUniswapV2CSSR), function:getLiquidity, arguments:['_asset', 'key']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_3
    Node_1["1: NodeType.STARTLOOP - "]
    Node_1 --> Node_4
    Node_2["2: NodeType.ENDLOOP - "]
    Node_2 --> Node_28
    Node_3["3: NodeType.VARIABLE - i = 0"]
    Node_3 --> Node_1
    Node_4["4: NodeType.IFLOOP - i < keyCurrency.length"]
    Node_4 --> Node_5
    Node_4 --> Node_2
    Node_5["5: NodeType.VARIABLE - key = keyCurrency(i)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - currencyPrice = cssrRouter.getPrice(key)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.IF - _asset == key"]
    Node_7 --> Node_8
    Node_7 --> Node_9
    Node_8["8: NodeType.CONTINUE - "]
    Node_8 --> Node_27
    Node_9["9: NodeType.ENDIF - "]
    Node_9 --> Node_10
    Node_10["10: NodeType.TRY - liq = uniswapCSSR.getLiquidity(_asset,key)"]
    Node_10 --> Node_11
    Node_10 --> Node_17
    Node_10 --> Node_18
    Node_11["11: NodeType.CATCH - "]
    Node_11 --> Node_12
    Node_12["12: NodeType.VARIABLE - liquidityValue = convertToValue(liq,currencyPrice)"]
    Node_12 --> Node_13
    Node_13["13: NodeType.IF - liquidityValue >= minimumLiquidity"]
    Node_13 --> Node_14
    Node_13 --> Node_16
    Node_14["14: NodeType.EXPRESSION - sumLiquidity += liquidityValue"]
    Node_14 --> Node_15
    Node_15["15: NodeType.EXPRESSION - sumPrice += convertToValue(uniswapCSSR.getExchangeRatio(_asset,key),currencyPrice) * liquidityValue"]
    Node_15 --> Node_16
    Node_16["16: NodeType.ENDIF - "]
    Node_16 --> Node_18
    Node_17["17: NodeType.CATCH - "]
    Node_17 --> Node_18
    Node_18["18: NodeType.TRY - liq_scope_0 = sushiCSSR.getLiquidity(_asset,key)"]
    Node_18 --> Node_19
    Node_18 --> Node_26
    Node_18 --> Node_27
    Node_19["19: NodeType.CATCH - "]
    Node_19 --> Node_20
    Node_20["20: NodeType.VARIABLE - liq_scope_1 = sushiCSSR.getLiquidity(_asset,key)"]
    Node_20 --> Node_21
    Node_21["21: NodeType.VARIABLE - liquidityValue_scope_2 = convertToValue(liq_scope_1,currencyPrice)"]
    Node_21 --> Node_22
    Node_22["22: NodeType.IF - liquidityValue_scope_2 >= minimumLiquidity"]
    Node_22 --> Node_23
    Node_22 --> Node_25
    Node_23["23: NodeType.EXPRESSION - sumLiquidity += liquidityValue_scope_2"]
    Node_23 --> Node_24
    Node_24["24: NodeType.EXPRESSION - sumPrice += convertToValue(sushiCSSR.getExchangeRatio(_asset,key),currencyPrice) * liquidityValue_scope_2"]
    Node_24 --> Node_25
    Node_25["25: NodeType.ENDIF - "]
    Node_25 --> Node_27
    Node_26["26: NodeType.CATCH - "]
    Node_26 --> Node_27
    Node_27["27: NodeType.EXPRESSION - i ++"]
    Node_27 --> Node_4
    Node_28["28: NodeType.RETURN - (sumPrice,sumLiquidity)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-cssr/contracts/adapter/UniswapV2TokenAdapter.sol` on lines **117** to **156**

```solidity
    function getPriceRaw(address _asset)
        public
        view
        returns (uint256 sumPrice, uint256 sumLiquidity)
    {
        for (uint256 i = 0; i < keyCurrency.length; i++) {
            address key = keyCurrency[i];
            float memory currencyPrice = cssrRouter.getPrice(key);
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

```
