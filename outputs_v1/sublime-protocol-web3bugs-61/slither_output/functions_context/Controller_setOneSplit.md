# Context: Controller.setOneSplit

**Contract:** `Controller` (Inherits: None)
**Signature:** `setOneSplit(address)`
**Method Selector ID:** `0x8da1df4d`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** governance
- **Writes:** onesplit

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
    Node_2["2: NodeType.EXPRESSION - onesplit = _onesplit"]
```

### Source Mapping
Declared in: `contracts/mocks/yVault/Controller.sol` on lines **90** to **93**

```solidity
    function setOneSplit(address _onesplit) public {
        require(msg.sender == governance, '!governance');
        onesplit = _onesplit;
    }

```
