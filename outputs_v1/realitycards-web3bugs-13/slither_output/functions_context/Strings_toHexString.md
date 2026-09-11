# Context: Strings.toHexString

**Contract:** `Strings` (Inherits: None)
**Signature:** `toHexString(uint256) returns (string)`
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
    Node_1["1: NodeType.IF - value == 0"]
    Node_1 --> Node_2
    Node_1 --> Node_3
    Node_2["2: NodeType.RETURN - 0x00"]
    Node_3["3: NodeType.ENDIF - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - temp = value"]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - length = 0"]
    Node_5 --> Node_6
    Node_6["6: NodeType.STARTLOOP - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.IFLOOP - temp != 0"]
    Node_7 --> Node_8
    Node_7 --> Node_10
    Node_8["8: NodeType.EXPRESSION - length ++"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - temp >>= 8"]
    Node_9 --> Node_7
    Node_10["10: NodeType.ENDLOOP - "]
    Node_10 --> Node_11
    Node_11["11: NodeType.RETURN - toHexString(value,length)"]
```

### Source Mapping
Declared in: `node_modules/@openzeppelin/contracts/utils/Strings.sol` on lines **39** to **50**

```solidity
    function toHexString(uint256 value) internal pure returns (string memory) {
        if (value == 0) {
            return "0x00";
        }
        uint256 temp = value;
        uint256 length = 0;
        while (temp != 0) {
            length++;
            temp >>= 8;
        }
        return toHexString(value, length);
    }

```
