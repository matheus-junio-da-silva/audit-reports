# Context: MultiTroveGetter.getMultipleSortedTroves

**Contract:** `MultiTroveGetter` (Inherits: None)
**Signature:** `getMultipleSortedTroves(int256,uint256) returns (MultiTroveGetter.CombinedTroveData[])`
**Method Selector ID:** `0xb90bce45`
**Visibility:** `external`
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
- `ISortedTroves.TMP_444(uint256) = HIGH_LEVEL_CALL, dest:sortedTroves(ISortedTroves), function:getSize, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - "]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.IF - _startIdx >= 0"]
    Node_3 --> Node_4
    Node_3 --> Node_6
    Node_4["4: NodeType.EXPRESSION - startIdx = uint256(_startIdx)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - descend = true"]
    Node_5 --> Node_8
    Node_6["6: NodeType.EXPRESSION - startIdx = uint256(- (_startIdx + 1))"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - descend = false"]
    Node_7 --> Node_8
    Node_8["8: NodeType.ENDIF - "]
    Node_8 --> Node_9
    Node_9["9: NodeType.VARIABLE - sortedTrovesSize = sortedTroves.getSize()"]
    Node_9 --> Node_10
    Node_10["10: NodeType.IF - startIdx >= sortedTrovesSize"]
    Node_10 --> Node_11
    Node_10 --> Node_12
    Node_11["11: NodeType.EXPRESSION - _troves = new MultiTroveGetter.CombinedTroveData()(0)"]
    Node_11 --> Node_20
    Node_12["12: NodeType.VARIABLE - maxCount = sortedTrovesSize - startIdx"]
    Node_12 --> Node_13
    Node_13["13: NodeType.IF - _count > maxCount"]
    Node_13 --> Node_14
    Node_13 --> Node_15
    Node_14["14: NodeType.EXPRESSION - _count = maxCount"]
    Node_14 --> Node_15
    Node_15["15: NodeType.ENDIF - "]
    Node_15 --> Node_16
    Node_16["16: NodeType.IF - descend"]
    Node_16 --> Node_17
    Node_16 --> Node_18
    Node_17["17: NodeType.EXPRESSION - _troves = _getMultipleSortedTrovesFromHead(startIdx,_count)"]
    Node_17 --> Node_19
    Node_18["18: NodeType.EXPRESSION - _troves = _getMultipleSortedTrovesFromTail(startIdx,_count)"]
    Node_18 --> Node_19
    Node_19["19: NodeType.ENDIF - "]
    Node_19 --> Node_20
    Node_20["20: NodeType.ENDIF - "]
    Node_20 --> Node_21
    Node_21["21: NodeType.RETURN - _troves"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/MultiTroveGetter.sol` on lines **35** to **66**

```solidity
    function getMultipleSortedTroves(int _startIdx, uint _count)
        external view returns (CombinedTroveData[] memory _troves)
    {
        uint startIdx;
        bool descend;

        if (_startIdx >= 0) {
            startIdx = uint(_startIdx);
            descend = true;
        } else {
            startIdx = uint(-(_startIdx + 1));
            descend = false;
        }

        uint sortedTrovesSize = sortedTroves.getSize();

        if (startIdx >= sortedTrovesSize) {
            _troves = new CombinedTroveData[](0);
        } else {
            uint maxCount = sortedTrovesSize - startIdx;

            if (_count > maxCount) {
                _count = maxCount;
            }

            if (descend) {
                _troves = _getMultipleSortedTrovesFromHead(startIdx, _count);
            } else {
                _troves = _getMultipleSortedTrovesFromTail(startIdx, _count);
            }
        }
    }

```
