# Context: PoolFactory._updatePoolCancelPenaltyMultiple

**Contract:** `PoolFactory` (Inherits: IPoolFactory, OwnableUpgradeable, ContextUpgradeable, Initializable)
**Signature:** `_updatePoolCancelPenaltyMultiple(uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** poolCancelPenaltyMultiple

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
    Node_1["1: NodeType.EXPRESSION - poolCancelPenaltyMultiple = _poolCancelPenaltyMultiple"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - PoolCancelPenaltyMultipleUpdated(_poolCancelPenaltyMultiple)"]
```

### Source Mapping
Declared in: `contracts/Pool/PoolFactory.sol` on lines **657** to **660**

```solidity
    function _updatePoolCancelPenaltyMultiple(uint256 _poolCancelPenaltyMultiple) internal {
        poolCancelPenaltyMultiple = _poolCancelPenaltyMultiple;
        emit PoolCancelPenaltyMultipleUpdated(_poolCancelPenaltyMultiple);
    }

```
