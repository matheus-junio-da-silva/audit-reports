# Context: Controller.setGovernance

**Contract:** `Controller` (Inherits: None)
**Signature:** `setGovernance(address)`
**Method Selector ID:** `0xab033ea9`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** governance
- **Writes:** governance

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
    Node_2["2: NodeType.EXPRESSION - governance = _governance"]
```

### Source Mapping
Declared in: `contracts/mocks/yVault/Controller.sol` on lines **95** to **98**

```solidity
    function setGovernance(address _governance) public {
        require(msg.sender == governance, '!governance');
        governance = _governance;
    }

```
