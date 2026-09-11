# Context: SavingsAccountUtil.withdrawFromSavingsAccount

**Contract:** `SavingsAccountUtil` (Inherits: None)
**Signature:** `withdrawFromSavingsAccount(ISavingsAccount,address,address,uint256,address,address,bool) returns (uint256)`
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
- `ISavingsAccount.TMP_2722(uint256) = HIGH_LEVEL_CALL, dest:_savingsAccount(ISavingsAccount), function:withdrawFrom, arguments:['_amount', '_token', '_strategy', '_from', 'TMP_2721', '_withdrawShares']  `
- `ISavingsAccount.TMP_2720(uint256) = HIGH_LEVEL_CALL, dest:_savingsAccount(ISavingsAccount), function:withdraw, arguments:['_amount', '_token', '_strategy', 'TMP_2719', '_withdrawShares']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.IF - _from == address(this)"]
    Node_1 --> Node_2
    Node_1 --> Node_3
    Node_2["2: NodeType.EXPRESSION - _amountReceived = _savingsAccount.withdraw(_amount,_token,_strategy,address(_to),_withdrawShares)"]
    Node_2 --> Node_4
    Node_3["3: NodeType.EXPRESSION - _amountReceived = _savingsAccount.withdrawFrom(_amount,_token,_strategy,_from,address(_to),_withdrawShares)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.ENDIF - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.RETURN - _amountReceived"]
```

### Source Mapping
Declared in: `contracts/SavingsAccount/SavingsAccountUtil.sol` on lines **82** to **96**

```solidity
    function withdrawFromSavingsAccount(
        ISavingsAccount _savingsAccount,
        address _from,
        address _to,
        uint256 _amount,
        address _token,
        address _strategy,
        bool _withdrawShares
    ) internal returns (uint256 _amountReceived) {
        if (_from == address(this)) {
            _amountReceived = _savingsAccount.withdraw(_amount, _token, _strategy, payable(_to), _withdrawShares);
        } else {
            _amountReceived = _savingsAccount.withdrawFrom(_amount, _token, _strategy, _from, payable(_to), _withdrawShares);
        }
    }

```
