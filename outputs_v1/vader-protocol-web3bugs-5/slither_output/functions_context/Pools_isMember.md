# Context: Pools.isMember

**Contract:** `Pools` (Inherits: None)
**Signature:** `isMember(address) returns (bool)`
**Method Selector ID:** `0xa230c524`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** _isMember
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
    Node_1["1: NodeType.RETURN - _isMember(member)"]
```

### Source Mapping
Declared in: `contracts/Pools.sol` on lines **215** to **217**

```solidity
    function isMember(address member) public view returns(bool) {
        return _isMember[member];
    }

```
