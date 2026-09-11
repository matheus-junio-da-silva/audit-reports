# Context: MultiTroveGetter._getMultipleSortedTrovesFromTail

**Contract:** `MultiTroveGetter` (Inherits: None)
**Signature:** `_getMultipleSortedTrovesFromTail(uint256,uint256) returns (MultiTroveGetter.CombinedTroveData[])`
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
- `ISortedTroves.TMP_467(address) = HIGH_LEVEL_CALL, dest:sortedTroves(ISortedTroves), function:getPrev, arguments:['currentTroveowner']  `
- `ISortedTroves.TMP_460(address) = HIGH_LEVEL_CALL, dest:sortedTroves(ISortedTroves), function:getLast, arguments:[]  `
- `ISortedTroves.TMP_462(address) = HIGH_LEVEL_CALL, dest:sortedTroves(ISortedTroves), function:getPrev, arguments:['currentTroveowner']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - currentTroveowner = sortedTroves.getLast()"]
    Node_1 --> Node_4
    Node_2["2: NodeType.STARTLOOP - "]
    Node_2 --> Node_5
    Node_3["3: NodeType.ENDLOOP - "]
    Node_3 --> Node_8
    Node_4["4: NodeType.VARIABLE - idx = 0"]
    Node_4 --> Node_2
    Node_5["5: NodeType.IFLOOP - idx < _startIdx"]
    Node_5 --> Node_6
    Node_5 --> Node_3
    Node_6["6: NodeType.EXPRESSION - currentTroveowner = sortedTroves.getPrev(currentTroveowner)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - ++ idx"]
    Node_7 --> Node_5
    Node_8["8: NodeType.EXPRESSION - _troves = new MultiTroveGetter.CombinedTroveData()(_count)"]
    Node_8 --> Node_11
    Node_9["9: NodeType.STARTLOOP - "]
    Node_9 --> Node_12
    Node_10["10: NodeType.ENDLOOP - "]
    Node_10 --> Node_16
    Node_11["11: NodeType.VARIABLE - idx_scope_0 = 0"]
    Node_11 --> Node_9
    Node_12["12: NodeType.IFLOOP - idx_scope_0 < _count"]
    Node_12 --> Node_13
    Node_12 --> Node_10
    Node_13["13: NodeType.EXPRESSION - _troves(idx_scope_0) = _getCombinedTroveData(currentTroveowner)"]
    Node_13 --> Node_14
    Node_14["14: NodeType.EXPRESSION - currentTroveowner = sortedTroves.getPrev(currentTroveowner)"]
    Node_14 --> Node_15
    Node_15["15: NodeType.EXPRESSION - ++ idx_scope_0"]
    Node_15 --> Node_12
    Node_16["16: NodeType.RETURN - _troves"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/MultiTroveGetter.sol` on lines **85** to **100**

```solidity
    function _getMultipleSortedTrovesFromTail(uint _startIdx, uint _count)
        internal view returns (CombinedTroveData[] memory _troves)
    {
        address currentTroveowner = sortedTroves.getLast();

        for (uint idx = 0; idx < _startIdx; ++idx) {
            currentTroveowner = sortedTroves.getPrev(currentTroveowner);
        }

        _troves = new CombinedTroveData[](_count);

        for (uint idx = 0; idx < _count; ++idx) {
            _troves[idx] = _getCombinedTroveData(currentTroveowner);
            currentTroveowner = sortedTroves.getPrev(currentTroveowner);
        }
    }

```
