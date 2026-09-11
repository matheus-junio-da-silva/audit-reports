# Context: RealitioMockup.resultFor

**Contract:** `RealitioMockup` (Inherits: None)
**Signature:** `resultFor(bytes32) returns (bytes32)`
**Method Selector ID:** `0xd09cc57e`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** result
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool)(result != 420)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool)(result != 420)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - question_id"]
    Node_2 --> Node_3
    Node_3["3: NodeType.RETURN - bytes32(result)"]
```

### Source Mapping
Declared in: `contracts/mockups/RealitioMockup.sol` on lines **48** to **53**

```solidity
    function resultFor(bytes32 question_id) external view returns (bytes32) {
        require(result != 420);
        question_id;
        // require(question_id == actualQuestionId);
        return bytes32(result);
    }

```
