# Context: PoolFactory._updatepoolInitFuncSelector

**Contract:** `PoolFactory` (Inherits: IPoolFactory, OwnableUpgradeable, ContextUpgradeable, Initializable)
**Signature:** `_updatepoolInitFuncSelector(bytes4)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** poolInitFuncSelector

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
    Node_1["1: NodeType.EXPRESSION - poolInitFuncSelector = _functionId"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - PoolInitSelectorUpdated(_functionId)"]
```

### Source Mapping
Declared in: `contracts/Pool/PoolFactory.sol` on lines **475** to **478**

```solidity
    function _updatepoolInitFuncSelector(bytes4 _functionId) internal {
        poolInitFuncSelector = _functionId;
        emit PoolInitSelectorUpdated(_functionId);
    }

```
