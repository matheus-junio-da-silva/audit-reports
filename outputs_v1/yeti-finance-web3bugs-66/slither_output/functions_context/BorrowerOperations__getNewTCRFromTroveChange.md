# Context: BorrowerOperations._getNewTCRFromTroveChange

**Contract:** `BorrowerOperations` (Inherits: ReentrancyGuard, IBorrowerOperations, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `_getNewTCRFromTroveChange(uint256,bool,uint256,bool) returns (uint256)`
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
- `SafeMath.TMP_498(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['totalDebt', '_debtChange'] `
- `LiquityMath.TMP_495(uint256) = LIBRARY_CALL, dest:LiquityMath, function:LiquityMath._computeCR(uint256,uint256), arguments:['totalColl', 'totalDebt'] `
- `SafeMath.TMP_499(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['totalDebt', '_debtChange'] `
- `SafeMath.TMP_496(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['totalColl', '_collChange'] `
- `SafeMath.TMP_497(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['totalColl', '_collChange'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - totalColl = getEntireSystemColl()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - totalDebt = getEntireSystemDebt()"]
    Node_2 --> Node_7
    Node_5["5: NodeType.VARIABLE - newTCR = LiquityMath._computeCR(totalColl,totalDebt)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.RETURN - newTCR"]
    Node_7["7: NodeType.IF - _isCollIncrease"]
    Node_7 --> Node_8
    Node_7 --> Node_9
    Node_8["8: NodeType.EXPRESSION - totalColl = totalColl.add(_collChange)"]
    Node_8 --> Node_10
    Node_9["9: NodeType.EXPRESSION - totalColl = totalColl.sub(_collChange)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.ENDIF - "]
    Node_10 --> Node_11
    Node_11["11: NodeType.IF - _isDebtIncrease"]
    Node_11 --> Node_12
    Node_11 --> Node_13
    Node_12["12: NodeType.EXPRESSION - totalDebt = totalDebt.add(_debtChange)"]
    Node_12 --> Node_14
    Node_13["13: NodeType.EXPRESSION - totalDebt = totalDebt.sub(_debtChange)"]
    Node_13 --> Node_14
    Node_14["14: NodeType.ENDIF - "]
    Node_14 --> Node_5
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/BorrowerOperations.sol` on lines **1398** to **1412**

```solidity
    function _getNewTCRFromTroveChange(
        uint256 _collChange,
        bool _isCollIncrease,
        uint256 _debtChange,
        bool _isDebtIncrease
    ) internal view returns (uint256) {
        uint256 totalColl = getEntireSystemColl();
        uint256 totalDebt = getEntireSystemDebt();

        totalColl = _isCollIncrease ? totalColl.add(_collChange) : totalColl.sub(_collChange);
        totalDebt = _isDebtIncrease ? totalDebt.add(_debtChange) : totalDebt.sub(_debtChange);

        uint256 newTCR = LiquityMath._computeCR(totalColl, totalDebt);
        return newTCR;
    }

```
