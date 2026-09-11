# Context: Pools.isAsset

**Contract:** `Pools` (Inherits: None)
**Signature:** `isAsset(address) returns (bool)`
**Method Selector ID:** `0xc87fa42a`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** _isAsset
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
    Node_1["1: NodeType.RETURN - _isAsset(token)"]
```

### Source Mapping
Declared in: `contracts/Pools.sol` on lines **218** to **220**

```solidity
    function isAsset(address token) public view returns(bool) {
        return _isAsset[token];
    }

```
