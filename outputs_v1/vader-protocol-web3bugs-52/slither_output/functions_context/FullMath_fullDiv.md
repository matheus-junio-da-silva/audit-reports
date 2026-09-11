# Context: FullMath.fullDiv

**Contract:** `FullMath` (Inherits: None)
**Signature:** `fullDiv(uint256,uint256,uint256) returns (uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `private`
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
- None

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - pow2 = d & uint256(- int256(d))"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - d /= pow2"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - l /= pow2"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - l += h * (uint256(- int256(pow2)) / pow2 + 1)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - r = 1"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - r *= 2 - d * r"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - r *= 2 - d * r"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - r *= 2 - d * r"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - r *= 2 - d * r"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - r *= 2 - d * r"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - r *= 2 - d * r"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - r *= 2 - d * r"]
    Node_12 --> Node_13
    Node_13["13: NodeType.EXPRESSION - r *= 2 - d * r"]
    Node_13 --> Node_14
    Node_14["14: NodeType.RETURN - l * r"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/external/libraries/FullMath.sol` on lines **18** to **37**

```solidity
    function fullDiv(
        uint256 l,
        uint256 h,
        uint256 d
    ) private pure returns (uint256) {
        uint256 pow2 = d & uint256(-int256(d));
        d /= pow2;
        l /= pow2;
        l += h * (uint256(-int256(pow2)) / pow2 + 1);
        uint256 r = 1;
        r *= 2 - d * r;
        r *= 2 - d * r;
        r *= 2 - d * r;
        r *= 2 - d * r;
        r *= 2 - d * r;
        r *= 2 - d * r;
        r *= 2 - d * r;
        r *= 2 - d * r;
        return l * r;
    }

```
