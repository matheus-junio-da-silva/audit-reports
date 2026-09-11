# Context: UniswapV2TokenAdapter.aboveLiquidity

**Contract:** `UniswapV2TokenAdapter` (Inherits: ICSSRAdapter)
**Signature:** `aboveLiquidity(address,address) returns (bool)`
**Method Selector ID:** `0xff9d4b83`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** cssrRouter, minimumLiquidity, sushiCSSR, uniswapCSSR
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `ICSSRRouter.TMP_67(float) = HIGH_LEVEL_CALL, dest:cssrRouter(ICSSRRouter), function:getPrice, arguments:['_pairedWith']  `
- `ICSSRRouter.TMP_63(float) = HIGH_LEVEL_CALL, dest:cssrRouter(ICSSRRouter), function:getPrice, arguments:['_pairedWith']  `
- `IUniswapV2CSSR.TMP_62(uint256) = HIGH_LEVEL_CALL, dest:uniswapCSSR(IUniswapV2CSSR), function:getLiquidity, arguments:['_asset', '_pairedWith']  `
- `IUniswapV2CSSR.TMP_66(uint256) = HIGH_LEVEL_CALL, dest:sushiCSSR(IUniswapV2CSSR), function:getLiquidity, arguments:['_asset', '_pairedWith']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.TRY - liq = uniswapCSSR.getLiquidity(_asset,_pairedWith)"]
    Node_1 --> Node_2
    Node_1 --> Node_5
    Node_2["2: NodeType.CATCH - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - price = cssrRouter.getPrice(_pairedWith)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.RETURN - convertToValue(liq,price) >= minimumLiquidity"]
    Node_5["5: NodeType.CATCH - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.TRY - liq_scope_0 = sushiCSSR.getLiquidity(_asset,_pairedWith)"]
    Node_6 --> Node_7
    Node_6 --> Node_10
    Node_7["7: NodeType.CATCH - "]
    Node_7 --> Node_8
    Node_8["8: NodeType.VARIABLE - price_scope_1 = cssrRouter.getPrice(_pairedWith)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.RETURN - convertToValue(liq_scope_0,price_scope_1) >= minimumLiquidity"]
    Node_10["10: NodeType.CATCH - "]
    Node_10 --> Node_11
    Node_11["11: NodeType.RETURN - false"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-cssr/contracts/adapter/UniswapV2TokenAdapter.sol` on lines **198** to **218**

```solidity
    function aboveLiquidity(address _asset, address _pairedWith)
        public
        view
        returns (bool)
    {
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

```
