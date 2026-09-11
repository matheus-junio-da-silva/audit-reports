# Context: OracleLibrary.consult

**Contract:** `OracleLibrary` (Inherits: None)
**Signature:** `consult(address,uint32) returns (int24)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(period != 0,BP)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IUniswapV3Pool.TUPLE_7(int56[],uint160[]) = HIGH_LEVEL_CALL, dest:TMP_916(IUniswapV3Pool), function:observe, arguments:['secondAgos']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(period != 0,BP)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - secondAgos = new uint32()(2)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - secondAgos(0) = period"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - secondAgos(1) = 0"]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - (tickCumulatives,None) = IUniswapV3Pool(pool).observe(secondAgos)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - tickCumulativesDelta = tickCumulatives(1) - tickCumulatives(0)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - timeWeightedAverageTick = int24(tickCumulativesDelta / period)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.IF - tickCumulativesDelta < 0 && (tickCumulativesDelta % period != 0)"]
    Node_9 --> Node_10
    Node_9 --> Node_11
    Node_10["10: NodeType.EXPRESSION - timeWeightedAverageTick --"]
    Node_10 --> Node_11
    Node_11["11: NodeType.ENDIF - "]
    Node_11 --> Node_12
    Node_12["12: NodeType.RETURN - timeWeightedAverageTick"]
```

### Source Mapping
Declared in: `node_modules/@uniswap/v3-periphery/contracts/libraries/OracleLibrary.sol` on lines **17** to **31**

```solidity
    function consult(address pool, uint32 period) internal view returns (int24 timeWeightedAverageTick) {
        require(period != 0, 'BP');

        uint32[] memory secondAgos = new uint32[](2);
        secondAgos[0] = period;
        secondAgos[1] = 0;

        (int56[] memory tickCumulatives, ) = IUniswapV3Pool(pool).observe(secondAgos);
        int56 tickCumulativesDelta = tickCumulatives[1] - tickCumulatives[0];

        timeWeightedAverageTick = int24(tickCumulativesDelta / period);

        // Always round to negative infinity
        if (tickCumulativesDelta < 0 && (tickCumulativesDelta % period != 0)) timeWeightedAverageTick--;
    }

```
