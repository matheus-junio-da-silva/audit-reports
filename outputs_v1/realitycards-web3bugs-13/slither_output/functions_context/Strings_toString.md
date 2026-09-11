# Context: Strings.toString

**Contract:** `Strings` (Inherits: None)
**Signature:** `toString(uint256) returns (string)`
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
    Node_2["2: NodeType.RETURN - 0"]
    Node_3["3: NodeType.ENDIF - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - temp = value"]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.STARTLOOP - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.IFLOOP - temp != 0"]
    Node_7 --> Node_8
    Node_7 --> Node_10
    Node_8["8: NodeType.EXPRESSION - digits ++"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - temp /= 10"]
    Node_9 --> Node_7
    Node_10["10: NodeType.ENDLOOP - "]
    Node_10 --> Node_11
    Node_11["11: NodeType.VARIABLE - buffer = new bytes(digits)"]
    Node_11 --> Node_12
    Node_12["12: NodeType.STARTLOOP - "]
    Node_12 --> Node_13
    Node_13["13: NodeType.IFLOOP - value != 0"]
    Node_13 --> Node_14
    Node_13 --> Node_17
    Node_14["14: NodeType.EXPRESSION - digits -= 1"]
    Node_14 --> Node_15
    Node_15["15: NodeType.EXPRESSION - buffer(digits) = bytes1(uint8(48 + uint256(value % 10)))"]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - value /= 10"]
    Node_16 --> Node_13
    Node_17["17: NodeType.ENDLOOP - "]
    Node_17 --> Node_18
    Node_18["18: NodeType.RETURN - string(buffer)"]
```

### Source Mapping
Declared in: `node_modules/@openzeppelin/contracts/utils/Strings.sol` on lines **14** to **34**

```solidity
    function toString(uint256 value) internal pure returns (string memory) {
        // Inspired by OraclizeAPI's implementation - MIT licence
        // https://github.com/oraclize/ethereum-api/blob/b42146b063c7d6ee1358846c198246239e9360e8/oraclizeAPI_0.4.25.sol

        if (value == 0) {
            return "0";
        }
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        return string(buffer);
    }

```
