# Context: Repayments._repay

**Contract:** `Repayments` (Inherits: ReentrancyGuard, IRepayment, Initializable)
**Signature:** `_repay(address,uint256,bool) returns (uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_loanStatus == uint256(LoanStatus.ACTIVE),Repayments:repayInterest Pool should be active.)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_2295(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256,string), arguments:['_amount', '_gracePenaltyDue', 'doesnt cover grace penality'] `
- `SafeMath.TMP_2297(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256,string), arguments:['_amount', '_interestOverdue', 'doesnt cover overdue interest'] `
- `SafeMath.TMP_2299(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['_amount', '_interestRepaid'] `
- `SafeMath.TMP_2300(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['_initialAmount', '_amount'] `
- `IPool.TMP_2290(uint256) = HIGH_LEVEL_CALL, dest:_pool(IPool), function:getLoanStatus, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - _pool = IPool(_poolID)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - _amount = _amount * 10 ** 30"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - _loanStatus = _pool.getLoanStatus()"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - require(bool,string)(_loanStatus == uint256(LoanStatus.ACTIVE),Repayments:repayInterest Pool should be active.)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - _initialAmount = _amount"]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - _gracePenaltyDue = _repayGracePenalty(_poolID)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - _amount = _amount.sub(_gracePenaltyDue,doesnt cover grace penality)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.VARIABLE - _interestOverdue = _repayExtension(_poolID)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - _amount = _amount.sub(_interestOverdue,doesnt cover overdue interest)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.VARIABLE - _interestRepaid = _repayInterest(_poolID,_amount,_isLastRepayment)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - _amount = _amount.sub(_interestRepaid)"]
    Node_11 --> Node_12
    Node_12["12: NodeType.RETURN - _updateRepaidAmount(_poolID,_initialAmount.sub(_amount))"]
```

### Source Mapping
Declared in: `contracts/Pool/Repayments.sol` on lines **377** to **402**

```solidity
    function _repay(
        address _poolID,
        uint256 _amount,
        bool _isLastRepayment
    ) internal returns (uint256) {
        IPool _pool = IPool(_poolID);
        _amount = _amount * 10**30;
        uint256 _loanStatus = _pool.getLoanStatus();
        require(_loanStatus == uint(LoanStatus.ACTIVE) , 'Repayments:repayInterest Pool should be active.');

        uint256 _initialAmount = _amount;

        // pay off grace penality
        uint256 _gracePenaltyDue = _repayGracePenalty(_poolID);
        _amount = _amount.sub(_gracePenaltyDue, 'doesnt cover grace penality');

        // pay off the overdue
        uint256 _interestOverdue = _repayExtension(_poolID);
        _amount = _amount.sub(_interestOverdue, 'doesnt cover overdue interest');

        // pay interest
        uint256 _interestRepaid = _repayInterest(_poolID, _amount, _isLastRepayment);
        _amount = _amount.sub(_interestRepaid);

        return _updateRepaidAmount(_poolID, _initialAmount.sub(_amount));
    }

```
