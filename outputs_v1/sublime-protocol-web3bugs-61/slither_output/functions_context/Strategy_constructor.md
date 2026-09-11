# Context: Strategy.constructor

**Contract:** `Strategy` (Inherits: None)
**Signature:** `constructor(address,address)`
**Method Selector ID:** `0x4525f804`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** controller, governance, want

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
    Node_1["1: NodeType.EXPRESSION - governance = msg.sender"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - controller = _controller"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - want = _want"]
```

### Source Mapping
Declared in: `contracts/mocks/yVault/Strategy.sol` on lines **35** to **39**

```solidity
    constructor(address _controller, address _want) {
        governance = msg.sender;
        controller = _controller;
        want = _want;
    }

```
