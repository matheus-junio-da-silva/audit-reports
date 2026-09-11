# Context: TroveManagerRedemptions._isValidFirstRedemptionHint

**Contract:** `TroveManagerRedemptions` (Inherits: ITroveManagerRedemptions, TroveManagerBase, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `_isValidFirstRedemptionHint(ISortedTroves,address) returns (bool)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** MCR, troveManager
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `ITroveManager.TMP_695(uint256) = HIGH_LEVEL_CALL, dest:troveManager(ITroveManager), function:getCurrentICR, arguments:['_firstRedemptionHint']  `
- `ISortedTroves.TMP_698(address) = HIGH_LEVEL_CALL, dest:_sortedTroves(ISortedTroves), function:getNext, arguments:['_firstRedemptionHint']  `
- `ITroveManager.TMP_701(uint256) = HIGH_LEVEL_CALL, dest:troveManager(ITroveManager), function:getCurrentICR, arguments:['nextTrove']  `
- `ISortedTroves.TMP_692(bool) = HIGH_LEVEL_CALL, dest:_sortedTroves(ISortedTroves), function:contains, arguments:['_firstRedemptionHint']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.IF - _firstRedemptionHint == address(0) || ! _sortedTroves.contains(_firstRedemptionHint) || troveManager.getCurrentICR(_firstRedemptionHint) < MCR"]
    Node_1 --> Node_2
    Node_1 --> Node_3
    Node_2["2: NodeType.RETURN - false"]
    Node_3["3: NodeType.ENDIF - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - nextTrove = _sortedTroves.getNext(_firstRedemptionHint)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.RETURN - nextTrove == address(0) || troveManager.getCurrentICR(nextTrove) < MCR"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TroveManagerRedemptions.sol` on lines **669** to **684**

```solidity
    function _isValidFirstRedemptionHint(ISortedTroves _sortedTroves, address _firstRedemptionHint)
        internal
        view
        returns (bool)
    {
        if (
            _firstRedemptionHint == address(0) ||
            !_sortedTroves.contains(_firstRedemptionHint) ||
            troveManager.getCurrentICR(_firstRedemptionHint) < MCR
        ) {
            return false;
        }

        address nextTrove = _sortedTroves.getNext(_firstRedemptionHint);
        return nextTrove == address(0) || troveManager.getCurrentICR(nextTrove) < MCR;
    }

```
