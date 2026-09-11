# Context: PoolFactory._updateLoanWithdrawalDuration

**Contract:** `PoolFactory` (Inherits: IPoolFactory, OwnableUpgradeable, ContextUpgradeable, Initializable)
**Signature:** `_updateLoanWithdrawalDuration(uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** loanWithdrawalDuration

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
    Node_1["1: NodeType.EXPRESSION - loanWithdrawalDuration = _loanWithdrawalDuration"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - LoanWithdrawalDurationUpdated(_loanWithdrawalDuration)"]
```

### Source Mapping
Declared in: `contracts/Pool/PoolFactory.sol` on lines **605** to **608**

```solidity
    function _updateLoanWithdrawalDuration(uint256 _loanWithdrawalDuration) internal {
        loanWithdrawalDuration = _loanWithdrawalDuration;
        emit LoanWithdrawalDurationUpdated(_loanWithdrawalDuration);
    }

```
