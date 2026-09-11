# Context: Controller.revokeStrategy

**Contract:** `Controller` (Inherits: None)
**Signature:** `revokeStrategy(address,address)`
**Method Selector ID:** `0x590bbb60`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** governance
- **Writes:** approvedStrategies

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
    Node_2["2: NodeType.EXPRESSION - approvedStrategies(_token)(_strategy) = false"]
```

### Source Mapping
Declared in: `contracts/mocks/yVault/Controller.sol` on lines **111** to **114**

```solidity
    function revokeStrategy(address _token, address _strategy) public {
        require(msg.sender == governance, '!governance');
        approvedStrategies[_token][_strategy] = false;
    }

```
