# Context: Controller.setSplit

**Contract:** `Controller` (Inherits: None)
**Signature:** `setSplit(uint256)`
**Method Selector ID:** `0x674e694f`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** governance
- **Writes:** split

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(msg.sender == governance,!governance)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(msg.sender == governance,!governance)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - split = _split"]
```

### Source Mapping
Declared in: `contracts/mocks/yVault/Controller.sol` on lines **85** to **88**

```solidity
    function setSplit(uint256 _split) public {
        require(msg.sender == governance, '!governance');
        split = _split;
    }

```
