# Context: TroveManagerTester._updateTrove

**Contract:** `TroveManagerTester` (Inherits: TroveManager, ReentrancyGuard, ITroveManager, TroveManagerBase, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `_updateTrove(address,address,address)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** sortedTroves
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `ISortedTroves.HIGH_LEVEL_CALL, dest:sortedTroves(ISortedTroves), function:reInsert, arguments:['_borrower', 'ICR', '_lowerHint', '_upperHint']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - "]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - (debt,tokens,amounts,None,None,None) = getEntireDebtAndColls(_borrower)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - troveColl.tokens = tokens"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - troveColl.amounts = amounts"]
    Node_7 --> Node_8
    Node_8["8: NodeType.VARIABLE - ICR = _getICRColls(troveColl,debt)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - sortedTroves.reInsert(_borrower,ICR,_lowerHint,_upperHint)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TroveManager.sol` on lines **242** to **251**

```solidity
    function _updateTrove(address _borrower, address _lowerHint, address _upperHint) internal {
        (uint debt, address[] memory tokens, uint[] memory amounts, , , ) = getEntireDebtAndColls(_borrower);

        newColls memory troveColl;
        troveColl.tokens = tokens;
        troveColl.amounts = amounts;

        uint ICR = _getICRColls(troveColl, debt);
        sortedTroves.reInsert(_borrower, ICR, _lowerHint, _upperHint);
    }

```
