# Context: SortedTrovesTester._findInsertPosition

**Contract:** `SortedTrovesTester` (Inherits: SortedTroves, ISortedTroves, CheckContract, Ownable)
**Signature:** `_findInsertPosition(uint256,address,address) returns (address, address)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** data
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- None

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - prevId = _prevId"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - nextId = _nextId"]
    Node_2 --> Node_3
    Node_3["3: NodeType.IF - prevId != address(0)"]
    Node_3 --> Node_4
    Node_3 --> Node_7
    Node_4["4: NodeType.IF - ! contains(prevId) || _ICR > data.nodes(prevId).oldICR"]
    Node_4 --> Node_5
    Node_4 --> Node_6
    Node_5["5: NodeType.EXPRESSION - prevId = address(0)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.ENDIF - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.ENDIF - "]
    Node_7 --> Node_8
    Node_8["8: NodeType.IF - nextId != address(0)"]
    Node_8 --> Node_9
    Node_8 --> Node_12
    Node_9["9: NodeType.IF - ! contains(nextId) || _ICR < data.nodes(nextId).oldICR"]
    Node_9 --> Node_10
    Node_9 --> Node_11
    Node_10["10: NodeType.EXPRESSION - nextId = address(0)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.ENDIF - "]
    Node_11 --> Node_12
    Node_12["12: NodeType.ENDIF - "]
    Node_12 --> Node_13
    Node_13["13: NodeType.IF - prevId == address(0) && nextId == address(0)"]
    Node_13 --> Node_14
    Node_13 --> Node_15
    Node_14["14: NodeType.RETURN - _descendList(_ICR,data.head)"]
    Node_15["15: NodeType.IF - prevId == address(0)"]
    Node_15 --> Node_16
    Node_15 --> Node_17
    Node_16["16: NodeType.RETURN - _ascendList(_ICR,nextId)"]
    Node_17["17: NodeType.IF - nextId == address(0)"]
    Node_17 --> Node_18
    Node_17 --> Node_19
    Node_18["18: NodeType.RETURN - _descendList(_ICR,prevId)"]
    Node_19["19: NodeType.RETURN - _descendList(_ICR,prevId)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/SortedTroves.sol` on lines **398** to **429**

```solidity
    function _findInsertPosition(uint256 _ICR, address _prevId, address _nextId) internal view returns (address, address) {
        address prevId = _prevId;
        address nextId = _nextId;

        if (prevId != address(0)) {
            if (!contains(prevId) || _ICR > data.nodes[prevId].oldICR) {
                // `prevId` does not exist anymore or now has a smaller ICR than the given ICR
                prevId = address(0);
            }
        }

        if (nextId != address(0)) {
            if (!contains(nextId) || _ICR < data.nodes[nextId].oldICR) {
                // `nextId` does not exist anymore or now has a larger ICR than the given ICR
                nextId = address(0);
            }
        }

        if (prevId == address(0) && nextId == address(0)) {
            // No hint - descend list starting from head
            return _descendList(_ICR, data.head);
        } else if (prevId == address(0)) {
            // No `prevId` for hint - ascend list starting from `nextId`
            return _ascendList(_ICR, nextId);
        } else if (nextId == address(0)) {
            // No `nextId` for hint - descend list starting from `prevId`
            return _descendList(_ICR, prevId);
        } else {
            // Descend list starting from `prevId`
            return _descendList(_ICR, prevId);
        }
    }

```
