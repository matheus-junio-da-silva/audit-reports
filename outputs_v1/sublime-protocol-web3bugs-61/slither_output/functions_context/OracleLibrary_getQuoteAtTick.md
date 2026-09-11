# Context: OracleLibrary.getQuoteAtTick

**Contract:** `OracleLibrary` (Inherits: None)
**Signature:** `getQuoteAtTick(int24,uint128,address,address) returns (uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `FullMath.TMP_940(uint256) = LIBRARY_CALL, dest:FullMath, function:FullMath.mulDiv(uint256,uint256,uint256), arguments:['ratioX128', 'baseAmount', 'TMP_939'] `
- `TickMath.TMP_925(uint160) = LIBRARY_CALL, dest:TickMath, function:TickMath.getSqrtRatioAtTick(int24), arguments:['tick'] `
- `FullMath.TMP_935(uint256) = LIBRARY_CALL, dest:FullMath, function:FullMath.mulDiv(uint256,uint256,uint256), arguments:['ratioX192', 'baseAmount', 'TMP_934'] `
- `FullMath.TMP_937(uint256) = LIBRARY_CALL, dest:FullMath, function:FullMath.mulDiv(uint256,uint256,uint256), arguments:['TMP_936', 'baseAmount', 'ratioX192'] `
- `FullMath.TMP_942(uint256) = LIBRARY_CALL, dest:FullMath, function:FullMath.mulDiv(uint256,uint256,uint256), arguments:['TMP_941', 'baseAmount', 'ratioX128'] `
- `FullMath.TMP_932(uint256) = LIBRARY_CALL, dest:FullMath, function:FullMath.mulDiv(uint256,uint256,uint256), arguments:['sqrtRatioX96', 'sqrtRatioX96', 'TMP_931'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - sqrtRatioX96 = TickMath.getSqrtRatioAtTick(tick)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.IF - sqrtRatioX96 <= type()(uint128).max"]
    Node_2 --> Node_3
    Node_2 --> Node_5
    Node_3["3: NodeType.VARIABLE - ratioX192 = uint256(sqrtRatioX96) * sqrtRatioX96"]
    Node_3 --> Node_8
    Node_5["5: NodeType.VARIABLE - ratioX128 = FullMath.mulDiv(sqrtRatioX96,sqrtRatioX96,1 << 64)"]
    Node_5 --> Node_12
    Node_7["7: NodeType.ENDIF - "]
    Node_7 --> Node_16
    Node_8["8: NodeType.IF - baseToken < quoteToken"]
    Node_8 --> Node_9
    Node_8 --> Node_10
    Node_9["9: NodeType.EXPRESSION - quoteAmount = FullMath.mulDiv(ratioX192,baseAmount,1 << 192)"]
    Node_9 --> Node_11
    Node_10["10: NodeType.EXPRESSION - quoteAmount = FullMath.mulDiv(1 << 192,baseAmount,ratioX192)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.ENDIF - "]
    Node_11 --> Node_7
    Node_12["12: NodeType.IF - baseToken < quoteToken"]
    Node_12 --> Node_13
    Node_12 --> Node_14
    Node_13["13: NodeType.EXPRESSION - quoteAmount = FullMath.mulDiv(ratioX128,baseAmount,1 << 128)"]
    Node_13 --> Node_15
    Node_14["14: NodeType.EXPRESSION - quoteAmount = FullMath.mulDiv(1 << 128,baseAmount,ratioX128)"]
    Node_14 --> Node_15
    Node_15["15: NodeType.ENDIF - "]
    Node_15 --> Node_7
    Node_16["16: NodeType.RETURN - quoteAmount"]
```

### Source Mapping
Declared in: `node_modules/@uniswap/v3-periphery/contracts/libraries/OracleLibrary.sol` on lines **39** to **59**

```solidity
    function getQuoteAtTick(
        int24 tick,
        uint128 baseAmount,
        address baseToken,
        address quoteToken
    ) internal pure returns (uint256 quoteAmount) {
        uint160 sqrtRatioX96 = TickMath.getSqrtRatioAtTick(tick);

        // Calculate quoteAmount with better precision if it doesn't overflow when multiplied by itself
        if (sqrtRatioX96 <= type(uint128).max) {
            uint256 ratioX192 = uint256(sqrtRatioX96) * sqrtRatioX96;
            quoteAmount = baseToken < quoteToken
                ? FullMath.mulDiv(ratioX192, baseAmount, 1 << 192)
                : FullMath.mulDiv(1 << 192, baseAmount, ratioX192);
        } else {
            uint256 ratioX128 = FullMath.mulDiv(sqrtRatioX96, sqrtRatioX96, 1 << 64);
            quoteAmount = baseToken < quoteToken
                ? FullMath.mulDiv(ratioX128, baseAmount, 1 << 128)
                : FullMath.mulDiv(1 << 128, baseAmount, ratioX128);
        }
    }

```
