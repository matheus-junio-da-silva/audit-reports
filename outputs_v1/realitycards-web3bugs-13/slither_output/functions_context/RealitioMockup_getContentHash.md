# Context: RealitioMockup.getContentHash

**Contract:** `RealitioMockup` (Inherits: None)
**Signature:** `getContentHash(bytes32) returns (bytes32)`
**Method Selector ID:** `0x51577ea9`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** actualContentHash, actualQuestionId
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
    Node_2["2: NodeType.IF - question_id == actualQuestionId"]
    Node_2 --> Node_3
    Node_2 --> Node_4
    Node_3["3: NodeType.RETURN - actualContentHash"]
    Node_4["4: NodeType.RETURN - 0"]
```

### Source Mapping
Declared in: `contracts/mockups/RealitioMockup.sol` on lines **65** to **77**

```solidity
    function getContentHash(bytes32 question_id)
        external
        view
        returns (bytes32)
    {
        // console.logBytes32(bytes32 b);
        question_id;
        if (question_id == actualQuestionId) {
            return actualContentHash;
        } else {
            return 0;
        }
    }

```
