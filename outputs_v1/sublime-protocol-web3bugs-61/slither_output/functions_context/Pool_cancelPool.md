# Context: Pool.cancelPool

**Contract:** `Pool` (Inherits: ReentrancyGuard, IPool, ERC20PausableUpgradeable, PausableUpgradeable, ERC20Upgradeable, IERC20Upgradeable, ContextUpgradeable, Initializable)
**Signature:** `cancelPool()`
**Method Selector ID:** `0x1b55b2a8`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** poolConstants, poolFactory, poolVariables
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_poolStatus == LoanStatus.COLLECTION,CP1)`
- require/assert: `require(bool,string)(msg.sender == poolConstants.borrower,CP2)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMathUpgradeable.TMP_1704(uint256) = LIBRARY_CALL, dest:SafeMathUpgradeable, function:SafeMathUpgradeable.div(uint256,uint256), arguments:['TMP_1703', '31536000'] `
- `IPoolFactory.TMP_1696(uint256) = HIGH_LEVEL_CALL, dest:_poolFactory(IPoolFactory), function:poolCancelPenaltyMultiple, arguments:[]  `
- `IPoolFactory.TMP_1685(uint256) = HIGH_LEVEL_CALL, dest:_poolFactory(IPoolFactory), function:minBorrowFraction, arguments:[]  `
- `SafeMathUpgradeable.TMP_1688(uint256) = LIBRARY_CALL, dest:SafeMathUpgradeable, function:SafeMathUpgradeable.div(uint256,uint256), arguments:['TMP_1686', 'TMP_1687'] `
- `SafeMathUpgradeable.TMP_1697(uint256) = LIBRARY_CALL, dest:SafeMathUpgradeable, function:SafeMathUpgradeable.mul(uint256,uint256), arguments:['_cancelPenaltyMultiple', 'REF_712'] `
- `SafeMathUpgradeable.TMP_1686(uint256) = LIBRARY_CALL, dest:SafeMathUpgradeable, function:SafeMathUpgradeable.mul(uint256,uint256), arguments:['TMP_1685', 'REF_705'] `
- `SafeMathUpgradeable.TMP_1699(uint256) = LIBRARY_CALL, dest:SafeMathUpgradeable, function:SafeMathUpgradeable.div(uint256,uint256), arguments:['TMP_1697', 'TMP_1698'] `
- `SafeMathUpgradeable.TMP_1702(uint256) = LIBRARY_CALL, dest:SafeMathUpgradeable, function:SafeMathUpgradeable.div(uint256,uint256), arguments:['TMP_1700', 'TMP_1701'] `
- `SafeMathUpgradeable.TMP_1700(uint256) = LIBRARY_CALL, dest:SafeMathUpgradeable, function:SafeMathUpgradeable.mul(uint256,uint256), arguments:['TMP_1699', '_collateralLiquidityShare'] `
- `SafeMathUpgradeable.TMP_1703(uint256) = LIBRARY_CALL, dest:SafeMathUpgradeable, function:SafeMathUpgradeable.mul(uint256,uint256), arguments:['TMP_1702', '_penaltyTime'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - _poolStatus = poolVariables.loanStatus"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(_poolStatus == LoanStatus.COLLECTION,CP1)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - _loanStartTime = poolConstants.loanStartTime"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - _poolFactory = IPoolFactory(poolFactory)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.IF - _loanStartTime < block.timestamp && totalSupply() < _poolFactory.minBorrowFraction().mul(poolConstants.borrowAmountRequested).div(10 ** 30)"]
    Node_5 --> Node_6
    Node_5 --> Node_7
    Node_6["6: NodeType.RETURN - _cancelPool(0)"]
    Node_7["7: NodeType.ENDIF - "]
    Node_7 --> Node_8
    Node_8["8: NodeType.VARIABLE - _loanWithdrawalDeadline = poolConstants.loanWithdrawalDeadline"]
    Node_8 --> Node_9
    Node_9["9: NodeType.IF - _loanWithdrawalDeadline > block.timestamp"]
    Node_9 --> Node_10
    Node_9 --> Node_11
    Node_10["10: NodeType.EXPRESSION - require(bool,string)(msg.sender == poolConstants.borrower,CP2)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.ENDIF - "]
    Node_11 --> Node_12
    Node_12["12: NodeType.VARIABLE - _collateralLiquidityShare = poolVariables.baseLiquidityShares"]
    Node_12 --> Node_13
    Node_13["13: NodeType.VARIABLE - _penaltyTime = _calculatePenaltyTime(_loanStartTime,_loanWithdrawalDeadline)"]
    Node_13 --> Node_14
    Node_14["14: NodeType.VARIABLE - _cancelPenaltyMultiple = _poolFactory.poolCancelPenaltyMultiple()"]
    Node_14 --> Node_15
    Node_15["15: NodeType.VARIABLE - penalty = _cancelPenaltyMultiple.mul(poolConstants.borrowRate).div(10 ** 30).mul(_collateralLiquidityShare).div(10 ** 30).mul(_penaltyTime).div(31536000)"]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - _cancelPool(penalty)"]
```

### Source Mapping
Declared in: `contracts/Pool/Pool.sol` on lines **501** to **531**

```solidity
    function cancelPool() external {
        LoanStatus _poolStatus = poolVariables.loanStatus;
        require(_poolStatus == LoanStatus.COLLECTION, 'CP1');
        uint256 _loanStartTime = poolConstants.loanStartTime;
        IPoolFactory _poolFactory = IPoolFactory(poolFactory);

        if (
            _loanStartTime < block.timestamp &&
            totalSupply() < _poolFactory.minBorrowFraction().mul(poolConstants.borrowAmountRequested).div(10**30)
        ) {
            return _cancelPool(0);
        }

        uint256 _loanWithdrawalDeadline = poolConstants.loanWithdrawalDeadline;

        if (_loanWithdrawalDeadline > block.timestamp) {
            require(msg.sender == poolConstants.borrower, 'CP2');
        }
        // note: extra liquidity shares are not applicable as the loan never reaches active state
        uint256 _collateralLiquidityShare = poolVariables.baseLiquidityShares;
        uint256 _penaltyTime = _calculatePenaltyTime(_loanStartTime, _loanWithdrawalDeadline);
        uint256 _cancelPenaltyMultiple = _poolFactory.poolCancelPenaltyMultiple();
        uint256 penalty = _cancelPenaltyMultiple
            .mul(poolConstants.borrowRate)
            .div(10**30)
            .mul(_collateralLiquidityShare)
            .div(10**30)
            .mul(_penaltyTime)
            .div(365 days);
        _cancelPool(penalty);
    }

```
