# Context: Pool.interestToPay

**Contract:** `Pool` (Inherits: ReentrancyGuard, IPool, ERC20PausableUpgradeable, PausableUpgradeable, ERC20Upgradeable, IERC20Upgradeable, ContextUpgradeable, Initializable)
**Signature:** `interestToPay() returns (uint256)`
**Method Selector ID:** `0x5695d52d`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** poolConstants, poolFactory
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMathUpgradeable.TMP_1797(uint256) = LIBRARY_CALL, dest:SafeMathUpgradeable, function:SafeMathUpgradeable.mul(uint256,uint256), arguments:['REF_777', 'TMP_1796'] `
- `IRepayment.TUPLE_17(uint256,uint256) = HIGH_LEVEL_CALL, dest:TMP_1792(IRepayment), function:getInterestCalculationVars, arguments:['TMP_1793']  `
- `SafeMathUpgradeable.TMP_1801(uint256) = LIBRARY_CALL, dest:SafeMathUpgradeable, function:SafeMathUpgradeable.mul(uint256,uint256), arguments:['_interestPerSecond', 'TMP_1800'] `
- `IPoolFactory.TMP_1791(address) = HIGH_LEVEL_CALL, dest:_poolFactory(IPoolFactory), function:repaymentImpl, arguments:[]  `
- `SafeMathUpgradeable.TMP_1803(uint256) = LIBRARY_CALL, dest:SafeMathUpgradeable, function:SafeMathUpgradeable.div(uint256,uint256), arguments:['TMP_1801', 'TMP_1802'] `
- `SafeMathUpgradeable.TMP_1800(uint256) = LIBRARY_CALL, dest:SafeMathUpgradeable, function:SafeMathUpgradeable.sub(uint256,uint256), arguments:['_loanDurationTillNow', '_loanDurationCovered'] `
- `SafeMathUpgradeable.TMP_1795(uint256) = LIBRARY_CALL, dest:SafeMathUpgradeable, function:SafeMathUpgradeable.mul(uint256,uint256), arguments:['block.timestamp', 'TMP_1794'] `
- `SafeMathUpgradeable.TMP_1798(uint256) = LIBRARY_CALL, dest:SafeMathUpgradeable, function:SafeMathUpgradeable.sub(uint256,uint256), arguments:['_currentBlockTime', 'TMP_1797'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - _poolFactory = IPoolFactory(poolFactory)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - (_loanDurationCovered,_interestPerSecond) = IRepayment(_poolFactory.repaymentImpl()).getInterestCalculationVars(address(this))"]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - _currentBlockTime = block.timestamp.mul(10 ** 30)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - _loanDurationTillNow = _currentBlockTime.sub(poolConstants.loanStartTime.mul(10 ** 30))"]
    Node_6 --> Node_7
    Node_7["7: NodeType.IF - _loanDurationTillNow <= _loanDurationCovered"]
    Node_7 --> Node_8
    Node_7 --> Node_9
    Node_8["8: NodeType.RETURN - 0"]
    Node_9["9: NodeType.ENDIF - "]
    Node_9 --> Node_10
    Node_10["10: NodeType.VARIABLE - _interestAccrued = _interestPerSecond.mul(_loanDurationTillNow.sub(_loanDurationCovered)).div(10 ** 60)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.RETURN - _interestAccrued"]
```

### Source Mapping
Declared in: `contracts/Pool/Pool.sol` on lines **672** to **685**

```solidity
    function interestToPay() public view returns (uint256) {
        IPoolFactory _poolFactory = IPoolFactory(poolFactory);
        (uint256 _loanDurationCovered, uint256 _interestPerSecond) = IRepayment(_poolFactory.repaymentImpl()).getInterestCalculationVars(
            address(this)
        );
        uint256 _currentBlockTime = block.timestamp.mul(10**30);
        uint256 _loanDurationTillNow = _currentBlockTime.sub(poolConstants.loanStartTime.mul(10**30));
        if (_loanDurationTillNow <= _loanDurationCovered) {
            return 0;
        }
        uint256 _interestAccrued = _interestPerSecond.mul(_loanDurationTillNow.sub(_loanDurationCovered)).div(10**60);

        return _interestAccrued;
    }

```
