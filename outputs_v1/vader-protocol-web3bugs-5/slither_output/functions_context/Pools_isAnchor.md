# Context: Pools.isAnchor

**Contract:** `Pools` (Inherits: None)
**Signature:** `isAnchor(address) returns (bool)`
**Method Selector ID:** `0xd8cced2a`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** _isAnchor
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
    Node_1["1: NodeType.RETURN - _isAnchor(token)"]
```

### Source Mapping
Declared in: `contracts/Pools.sol` on lines **221** to **223**

```solidity
    function isAnchor(address token) public view returns(bool) {
        return _isAnchor[token];
    }

```
