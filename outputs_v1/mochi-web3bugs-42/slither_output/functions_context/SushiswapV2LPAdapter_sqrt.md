# Context: SushiswapV2LPAdapter.sqrt

**Contract:** `SushiswapV2LPAdapter` (Inherits: ICSSRAdapter)
**Signature:** `sqrt(uint256) returns (uint256)`
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
- None

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.IF - x > 3"]
    Node_1 --> Node_2
    Node_1 --> Node_9
    Node_2["2: NodeType.VARIABLE - z = x / 2 + 1"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - y = x"]
    Node_3 --> Node_4
    Node_4["4: NodeType.STARTLOOP - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.IFLOOP - z < y"]
    Node_5 --> Node_6
    Node_5 --> Node_8
    Node_6["6: NodeType.EXPRESSION - y = z"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - z = (x / z + z) / 2"]
    Node_7 --> Node_5
    Node_8["8: NodeType.ENDLOOP - "]
    Node_8 --> Node_12
    Node_9["9: NodeType.IF - x != 0"]
    Node_9 --> Node_10
    Node_9 --> Node_11
    Node_10["10: NodeType.EXPRESSION - y = 1"]
    Node_10 --> Node_11
    Node_11["11: NodeType.ENDIF - "]
    Node_11 --> Node_12
    Node_12["12: NodeType.ENDIF - "]
    Node_12 --> Node_13
    Node_13["13: NodeType.RETURN - y"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-cssr/contracts/adapter/SushiswapV2LPAdapter.sol` on lines **106** to **117**

```solidity
    function sqrt(uint x) internal pure returns (uint y) {
        if (x > 3) {
            uint z = x / 2 + 1;
            y = x;
            while (z < y) {
                y = z;
                z = (x / z + z) / 2;
            }
        } else if (x != 0) {
            y = 1;
        }
    }

```
