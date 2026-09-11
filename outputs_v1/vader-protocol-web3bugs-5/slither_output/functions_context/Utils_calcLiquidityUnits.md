# Context: Utils.calcLiquidityUnits

**Contract:** `Utils` (Inherits: None)
**Signature:** `calcLiquidityUnits(uint256,uint256,uint256,uint256,uint256) returns (uint256)`
**Method Selector ID:** `0xc5c11ee9`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** one
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- None

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.IF - P == 0"]
    Node_1 --> Node_2
    Node_1 --> Node_3
    Node_2["2: NodeType.RETURN - b"]
    Node_3["3: NodeType.VARIABLE - slipAdjustment = getSlipAdustment(b,B,t,T)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - part1 = (t * B)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - part2 = (T * b)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - part3 = (T * B) * 2"]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - _units = (((P * part1) + part2) / part3)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.RETURN - (_units * slipAdjustment) / one"]
```

### Source Mapping
Declared in: `contracts/Utils.sol` on lines **229** to **242**

```solidity
    function calcLiquidityUnits(uint b, uint B, uint t, uint T, uint P) external view returns (uint){
        if(P == 0){
            return b;
        } else {
            // units = ((P (t B + T b))/(2 T B)) * slipAdjustment
            // P * (part1 + part2) / (part3) * slipAdjustment
            uint slipAdjustment = getSlipAdustment(b, B, t, T);
            uint part1 = (t * B);
            uint part2 = (T * b);
            uint part3 = (T * B) * 2;
            uint _units = (((P * part1) + part2) / part3);
            return (_units * slipAdjustment) / one;  // Divide by 10**18
        }
    }

```
