# Context: Utils.getSlipAdustment

**Contract:** `Utils` (Inherits: None)
**Signature:** `getSlipAdustment(uint256,uint256,uint256,uint256) returns (uint256)`
**Method Selector ID:** `0x6da0f1fc`
**Visibility:** `public`
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
    Node_1["1: NodeType.VARIABLE - part1 = B * t"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - part2 = b * T"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - part3 = (b * 2) + B"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - part4 = t + T"]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.IF - part1 > part2"]
    Node_6 --> Node_7
    Node_6 --> Node_8
    Node_7["7: NodeType.EXPRESSION - numerator = (part1 - part2)"]
    Node_7 --> Node_9
    Node_8["8: NodeType.EXPRESSION - numerator = (part2 - part1)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.ENDIF - "]
    Node_9 --> Node_10
    Node_10["10: NodeType.VARIABLE - denominator = (part3 * part4)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.RETURN - one - (numerator * one) / denominator"]
```

### Source Mapping
Declared in: `contracts/Utils.sol` on lines **244** to **259**

```solidity
    function getSlipAdustment(uint b, uint B, uint t, uint T) public view returns (uint){
        // slipAdjustment = (1 - ABS((B t - b T)/((2 b + B) (t + T))))
        // 1 - ABS(part1 - part2)/(part3 * part4))
        uint part1 = B * t;
        uint part2 = b * T;
        uint part3 = (b * 2) + B;
        uint part4 = t + T;
        uint numerator;
        if(part1 > part2){
            numerator = (part1 - part2);
        } else {
            numerator = (part2 - part1);
        }
        uint denominator = (part3 * part4);
        return one - (numerator * one) / denominator; // Multiply by 10**18
    }

```
