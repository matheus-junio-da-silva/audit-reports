# Context: Repayments.getNextInstalmentDeadline

**Contract:** `Repayments` (Inherits: ReentrancyGuard, IRepayment, Initializable)
**Signature:** `getNextInstalmentDeadline(address) returns (uint256)`
**Method Selector ID:** `0xbf3b8e4b`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** repayConstants, repayVariables
- **Writes:** None

### Assertion Checks & Business Requirements
- revert: `revert(string)(Pool completely repaid)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_2198(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['TMP_2197', '_repaymentInterval'] `
- `SafeMath.TMP_2204(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['TMP_2203', '_repaymentInterval'] `
- `SafeMath.TMP_2203(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['_instalmentsCompleted', 'TMP_2202'] `
- `SafeMath.TMP_2200(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_2198', 'TMP_2199'] `
- `SafeMath.TMP_2206(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_2204', 'TMP_2205'] `
- `SafeMath.TMP_2195(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['_instalmentsCompleted', 'TMP_2194'] `
- `SafeMath.TMP_2197(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['TMP_2195', 'TMP_2196'] `
- `SafeMath.TMP_2207(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['TMP_2206', '_loanStartTime'] `
- `SafeMath.TMP_2201(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['TMP_2200', '_loanStartTime'] `
- `SafeMath.TMP_2190(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['REF_962', 'TMP_2189'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - _instalmentsCompleted = getInstalmentsCompleted(_poolID)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.IF - _instalmentsCompleted == repayConstants(_poolID).numberOfTotalRepayments.mul(10 ** 30)"]
    Node_2 --> Node_3
    Node_2 --> Node_4
    Node_3["3: NodeType.EXPRESSION - revert(string)(Pool completely repaid)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.ENDIF - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - _loanExtensionPeriod = repayVariables(_poolID).loanExtensionPeriod"]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - _repaymentInterval = repayConstants(_poolID).repaymentInterval"]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - _loanStartTime = repayConstants(_poolID).loanStartTime"]
    Node_7 --> Node_8
    Node_8["8: NodeType.VARIABLE - "]
    Node_8 --> Node_9
    Node_9["9: NodeType.IF - _loanExtensionPeriod > _instalmentsCompleted"]
    Node_9 --> Node_10
    Node_9 --> Node_11
    Node_10["10: NodeType.EXPRESSION - _nextInstalmentDeadline = ((_instalmentsCompleted.add(10 ** 30).add(10 ** 30)).mul(_repaymentInterval).div(10 ** 30)).add(_loanStartTime)"]
    Node_10 --> Node_12
    Node_11["11: NodeType.EXPRESSION - _nextInstalmentDeadline = ((_instalmentsCompleted.add(10 ** 30)).mul(_repaymentInterval).div(10 ** 30)).add(_loanStartTime)"]
    Node_11 --> Node_12
    Node_12["12: NodeType.ENDIF - "]
    Node_12 --> Node_13
    Node_13["13: NodeType.RETURN - _nextInstalmentDeadline"]
```

### Source Mapping
Declared in: `contracts/Pool/Repayments.sol` on lines **211** to **229**

```solidity
    function getNextInstalmentDeadline(address _poolID) public view override returns (uint256) {
        uint256 _instalmentsCompleted = getInstalmentsCompleted(_poolID);
        if (_instalmentsCompleted == repayConstants[_poolID].numberOfTotalRepayments.mul(10**30)) {
            revert('Pool completely repaid');
        }
        uint256 _loanExtensionPeriod = repayVariables[_poolID].loanExtensionPeriod;
        uint256 _repaymentInterval = repayConstants[_poolID].repaymentInterval;
        uint256 _loanStartTime = repayConstants[_poolID].loanStartTime;
        uint256 _nextInstalmentDeadline;

        if (_loanExtensionPeriod > _instalmentsCompleted) {
            _nextInstalmentDeadline = ((_instalmentsCompleted.add(10**30).add(10**30)).mul(_repaymentInterval).div(10**30)).add(
                _loanStartTime
            );
        } else {
            _nextInstalmentDeadline = ((_instalmentsCompleted.add(10**30)).mul(_repaymentInterval).div(10**30)).add(_loanStartTime);
        }
        return _nextInstalmentDeadline;
    }

```
