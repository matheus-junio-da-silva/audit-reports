# Context: RealitioMockup.setResult

**Contract:** `RealitioMockup` (Inherits: None)
**Signature:** `setResult(uint256)`
**Method Selector ID:** `0x812448a5`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** result

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
    Node_1["1: NodeType.IF - _result == 69"]
    Node_1 --> Node_2
    Node_1 --> Node_3
    Node_2["2: NodeType.EXPRESSION - result = type()(uint256).max"]
    Node_2 --> Node_4
    Node_3["3: NodeType.EXPRESSION - result = _result"]
    Node_3 --> Node_4
    Node_4["4: NodeType.ENDIF - "]
```

### Source Mapping
Declared in: `contracts/mockups/RealitioMockup.sol` on lines **13** to **19**

```solidity
    function setResult(uint256 _result) public {
        if (_result == 69) {
            result = type(uint256).max;
        } else {
            result = _result;
        }
    }

```
