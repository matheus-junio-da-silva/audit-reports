# Context: SavingsAccountUtil.depositFromSavingsAccount

**Contract:** `SavingsAccountUtil` (Inherits: None)
**Signature:** `depositFromSavingsAccount(ISavingsAccount,address,address,uint256,address,address,bool,bool) returns (uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
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
    Node_1["1: NodeType.IF - _toSavingsAccount"]
    Node_1 --> Node_2
    Node_1 --> Node_3
    Node_2["2: NodeType.RETURN - savingsAccountTransfer(_savingsAccount,_from,_to,_amount,_token,_strategy)"]
    Node_3["3: NodeType.RETURN - withdrawFromSavingsAccount(_savingsAccount,_from,_to,_amount,_token,_strategy,_withdrawShares)"]
```

### Source Mapping
Declared in: `contracts/SavingsAccount/SavingsAccountUtil.sol` on lines **11** to **26**

```solidity
    function depositFromSavingsAccount(
        ISavingsAccount _savingsAccount,
        address _from,
        address _to,
        uint256 _amount,
        address _token,
        address _strategy,
        bool _withdrawShares,
        bool _toSavingsAccount
    ) internal returns (uint256) {
        if (_toSavingsAccount) {
            return savingsAccountTransfer(_savingsAccount, _from, _to, _amount, _token, _strategy);
        } else {
            return withdrawFromSavingsAccount(_savingsAccount, _from, _to, _amount, _token, _strategy, _withdrawShares);
        }
    }

```
