# Context: Pools.removeLiquidity

**Contract:** `Pools` (Inherits: None)
**Signature:** `removeLiquidity(address,address,uint256) returns (uint256, uint256)`
**Method Selector ID:** `0xd752fab2`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
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
    Node_1["1: NodeType.RETURN - _removeLiquidity(base,token,basisPoints,tx.origin)"]
    Node_2["2: NodeType.RETURN - (outputBase,outputToken)"]
```

### Source Mapping
Declared in: `contracts/Pools.sol` on lines **77** to **79**

```solidity
    function removeLiquidity(address base, address token, uint basisPoints) external returns (uint outputBase, uint outputToken) {
        return _removeLiquidity(base, token, basisPoints, tx.origin); // Because this contract is wrapped by a router
    }

```
