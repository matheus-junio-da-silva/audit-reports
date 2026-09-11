# Context: Router.getMemberTokenDeposit

**Contract:** `Router` (Inherits: None)
**Signature:** `getMemberTokenDeposit(address,address) returns (uint256)`
**Method Selector ID:** `0xcfa701c5`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** mapMemberToken_depositToken
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
    Node_1["1: NodeType.RETURN - mapMemberToken_depositToken(member)(token)"]
```

### Source Mapping
Declared in: `contracts/Router.sol` on lines **487** to **489**

```solidity
    function getMemberTokenDeposit(address member, address token) external view returns(uint) {
        return mapMemberToken_depositToken[member][token];
    }

```
