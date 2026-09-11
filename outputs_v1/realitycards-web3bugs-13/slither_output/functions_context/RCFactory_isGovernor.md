# Context: RCFactory.isGovernor

**Contract:** `RCFactory` (Inherits: IRCFactory, NativeMetaTransaction, Ownable, Context)
**Signature:** `isGovernor(address) returns (bool)`
**Method Selector ID:** `0xe43581b8`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** governors
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
    Node_1["1: NodeType.RETURN - governors(_user)"]
```

### Source Mapping
Declared in: `contracts/RCFactory.sol` on lines **363** to **365**

```solidity
    function isGovernor(address _user) external view override returns (bool) {
        return governors[_user];
    }

```
