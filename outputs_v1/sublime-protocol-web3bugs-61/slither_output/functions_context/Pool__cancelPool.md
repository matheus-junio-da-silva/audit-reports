# Context: Pool._cancelPool

**Contract:** `Pool` (Inherits: ReentrancyGuard, IPool, ERC20PausableUpgradeable, PausableUpgradeable, ERC20Upgradeable, IERC20Upgradeable, ContextUpgradeable, Initializable)
**Signature:** `_cancelPool(uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** poolConstants, poolVariables
- **Writes:** poolVariables

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
    Node_1["1: NodeType.EXPRESSION - poolVariables.loanStatus = LoanStatus.CANCELLED"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - _withdrawAllCollateral(poolConstants.borrower,_penalty)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - _pause()"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - PoolCancelled()"]
```

### Source Mapping
Declared in: `contracts/Pool/Pool.sol` on lines **537** to **542**

```solidity
    function _cancelPool(uint256 _penalty) internal {
        poolVariables.loanStatus = LoanStatus.CANCELLED;
        _withdrawAllCollateral(poolConstants.borrower, _penalty);
        _pause();
        emit PoolCancelled();
    }

```
