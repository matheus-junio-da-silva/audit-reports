# Context: Repayments.didBorrowerDefault

**Contract:** `Repayments` (Inherits: ReentrancyGuard, IRepayment, Initializable)
**Signature:** `didBorrowerDefault(address) returns (bool)`
**Method Selector ID:** `0xeeb69a24`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** repayConstants
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_2232(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['_gracePeriodFraction', '_repaymentInterval'] `
- `SafeMath.TMP_2235(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['_nextInstalmentDeadline', 'TMP_2234'] `
- `SafeMath.TMP_2234(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_2232', 'TMP_2233'] `
- `SafeMath.TMP_2230(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['block.timestamp', 'TMP_2229'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - _repaymentInterval = repayConstants(_poolID).repaymentInterval"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - _currentTime = block.timestamp.mul(10 ** 30)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - _gracePeriodFraction = repayConstants(_poolID).gracePeriodFraction"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - _nextInstalmentDeadline = getNextInstalmentDeadline(_poolID)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - _gracePeriodDeadline = _nextInstalmentDeadline.add(_gracePeriodFraction.mul(_repaymentInterval).div(10 ** 30))"]
    Node_5 --> Node_6
    Node_6["6: NodeType.IF - _currentTime > _gracePeriodDeadline"]
    Node_6 --> Node_7
    Node_6 --> Node_8
    Node_7["7: NodeType.RETURN - true"]
    Node_8["8: NodeType.RETURN - false"]
```

### Source Mapping
Declared in: `contracts/Pool/Repayments.sol` on lines **273** to **281**

```solidity
    function didBorrowerDefault(address _poolID) external view override returns (bool) {
        uint256 _repaymentInterval = repayConstants[_poolID].repaymentInterval;
        uint256 _currentTime = block.timestamp.mul(10**30);
        uint256 _gracePeriodFraction = repayConstants[_poolID].gracePeriodFraction;
        uint256 _nextInstalmentDeadline = getNextInstalmentDeadline(_poolID);
        uint256 _gracePeriodDeadline = _nextInstalmentDeadline.add(_gracePeriodFraction.mul(_repaymentInterval).div(10**30));
        if (_currentTime > _gracePeriodDeadline) return true;
        else return false;
    }

```
