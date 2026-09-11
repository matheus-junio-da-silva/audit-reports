# Context: RealitioMockup.isFinalized

**Contract:** `RealitioMockup` (Inherits: None)
**Signature:** `isFinalized(bytes32) returns (bool)`
**Method Selector ID:** `0x7f8d429e`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** result
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
    Node_1["1: NodeType.EXPRESSION - question_id"]
    Node_1 --> Node_2
    Node_2["2: NodeType.IF - result == 420"]
    Node_2 --> Node_3
    Node_2 --> Node_4
    Node_3["3: NodeType.RETURN - false"]
    Node_4["4: NodeType.RETURN - true"]
```

### Source Mapping
Declared in: `contracts/mockups/RealitioMockup.sol` on lines **55** to **63**

```solidity
    function isFinalized(bytes32 question_id) external view returns (bool) {
        // require(question_id == actualQuestionId, "questionId incorrect");
        question_id;
        if (result == 420) {
            return false;
        } else {
            return true;
        }
    }

```
