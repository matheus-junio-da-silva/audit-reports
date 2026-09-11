# Context: PoolFactory._updateSupportedBorrowTokens

**Contract:** `PoolFactory` (Inherits: IPoolFactory, OwnableUpgradeable, ContextUpgradeable, Initializable)
**Signature:** `_updateSupportedBorrowTokens(address,bool)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** isBorrowToken

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
    Node_1["1: NodeType.EXPRESSION - isBorrowToken(_borrowToken) = _isSupported"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - BorrowTokenUpdated(_borrowToken,_isSupported)"]
```

### Source Mapping
Declared in: `contracts/Pool/PoolFactory.sol` on lines **448** to **451**

```solidity
    function _updateSupportedBorrowTokens(address _borrowToken, bool _isSupported) internal {
        isBorrowToken[_borrowToken] = _isSupported;
        emit BorrowTokenUpdated(_borrowToken, _isSupported);
    }

```
