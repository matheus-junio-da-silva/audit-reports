# Context: Utils.sortArray

**Contract:** `Utils` (Inherits: None)
**Signature:** `sortArray(uint256[]) returns (uint256[])`
**Method Selector ID:** `0xe379976e`
**Visibility:** `external`
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
    Node_1["1: NodeType.VARIABLE - l = array.length"]
    Node_1 --> Node_4
    Node_2["2: NodeType.STARTLOOP - "]
    Node_2 --> Node_5
    Node_3["3: NodeType.ENDLOOP - "]
    Node_3 --> Node_17
    Node_4["4: NodeType.VARIABLE - i = 0"]
    Node_4 --> Node_2
    Node_5["5: NodeType.IFLOOP - i < l"]
    Node_5 --> Node_8
    Node_5 --> Node_3
    Node_6["6: NodeType.STARTLOOP - "]
    Node_6 --> Node_9
    Node_7["7: NodeType.ENDLOOP - "]
    Node_7 --> Node_16
    Node_8["8: NodeType.VARIABLE - j = i + 1"]
    Node_8 --> Node_6
    Node_9["9: NodeType.IFLOOP - j < l"]
    Node_9 --> Node_10
    Node_9 --> Node_7
    Node_10["10: NodeType.IF - array(i) > array(j)"]
    Node_10 --> Node_11
    Node_10 --> Node_14
    Node_11["11: NodeType.VARIABLE - temp = array(i)"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - array(i) = array(j)"]
    Node_12 --> Node_13
    Node_13["13: NodeType.EXPRESSION - array(j) = temp"]
    Node_13 --> Node_14
    Node_14["14: NodeType.ENDIF - "]
    Node_14 --> Node_15
    Node_15["15: NodeType.EXPRESSION - j ++"]
    Node_15 --> Node_9
    Node_16["16: NodeType.EXPRESSION - i ++"]
    Node_16 --> Node_5
    Node_17["17: NodeType.RETURN - array"]
```

### Source Mapping
Declared in: `contracts/Utils.sol` on lines **288** to **300**

```solidity
    function sortArray(uint[] memory array) external pure returns (uint[] memory) {
        uint l = array.length;
        for(uint i = 0; i < l; i++){
            for(uint j = i+1; j < l; j++){
                if(array[i] > array[j]){
                    uint temp = array[i];
                    array[i] = array[j];
                    array[j] = temp;
                }
            }
        }
        return array;
    }

```
