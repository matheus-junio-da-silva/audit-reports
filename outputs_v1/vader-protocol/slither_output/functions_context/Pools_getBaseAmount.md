# Context: Pools.getBaseAmount

**Contract:** `Pools` (Inherits: None)
**Signature:** `getBaseAmount(address) returns (uint256)`
**Method Selector ID:** `0xb34c8afb`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** mapToken_baseAmount
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
    Node_1["1: NodeType.RETURN - mapToken_baseAmount(token)"]
```

### Source Mapping
Declared in: `contracts/Pools.sol` on lines **227** to **229**

```solidity
    function getBaseAmount(address token) public view returns(uint) {
        return mapToken_baseAmount[token];
    }

```
