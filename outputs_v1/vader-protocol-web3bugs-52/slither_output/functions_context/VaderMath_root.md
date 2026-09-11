# Context: VaderMath.root

**Contract:** `VaderMath` (Inherits: None)
**Signature:** `root(uint256) returns (uint256)`
**Method Selector ID:** `0xe56bf027`
**Visibility:** `public`
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
    Node_1["1: NodeType.IF - a > 3"]
    Node_1 --> Node_2
    Node_1 --> Node_9
    Node_2["2: NodeType.EXPRESSION - c = a"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - x = a / 2 + 1"]
    Node_3 --> Node_4
    Node_4["4: NodeType.STARTLOOP - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.IFLOOP - x < c"]
    Node_5 --> Node_6
    Node_5 --> Node_8
    Node_6["6: NodeType.EXPRESSION - c = x"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - x = (a / x + x) / 2"]
    Node_7 --> Node_5
    Node_8["8: NodeType.ENDLOOP - "]
    Node_8 --> Node_12
    Node_9["9: NodeType.IF - a != 0"]
    Node_9 --> Node_10
    Node_9 --> Node_11
    Node_10["10: NodeType.EXPRESSION - c = 1"]
    Node_10 --> Node_11
    Node_11["11: NodeType.ENDIF - "]
    Node_11 --> Node_12
    Node_12["12: NodeType.ENDIF - "]
    Node_12 --> Node_13
    Node_13["13: NodeType.RETURN - c"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/dex/math/VaderMath.sol` on lines **170** to **181**

```solidity
    function root(uint256 a) public pure returns (uint256 c) {
        if (a > 3) {
            c = a;
            uint256 x = a / 2 + 1;
            while (x < c) {
                c = x;
                x = (a / x + x) / 2;
            }
        } else if (a != 0) {
            c = 1;
        }
    }

```
