# Context: Factory.init

**Contract:** `Factory` (Inherits: None)
**Signature:** `init(address)`
**Method Selector ID:** `0x19ab453c`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** inited
- **Writes:** POOLS, inited

### Assertion Checks & Business Requirements
- require/assert: `require(bool)(inited == false)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool)(inited == false)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - inited = true"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - POOLS = _pool"]
```

### Source Mapping
Declared in: `contracts/Factory.sol` on lines **27** to **31**

```solidity
    function init(address _pool) public {
        require(inited == false);
        inited = true;
        POOLS = _pool;
    }

```
