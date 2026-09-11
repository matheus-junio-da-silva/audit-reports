# Context: SortedTroves._ascendList

**Contract:** `SortedTroves` (Inherits: ISortedTroves, CheckContract, Ownable)
**Signature:** `_ascendList(uint256,address) returns (address, address)`
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
    Node_1["1: NodeType.IF - data.tail == _startId && _ICR <= data.nodes(_startId).oldICR"]
    Node_1 --> Node_2
    Node_1 --> Node_3
    Node_2["2: NodeType.RETURN - (_startId,address(0))"]
    Node_3["3: NodeType.ENDIF - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - nextId = _startId"]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - prevId = data.nodes(nextId).prevId"]
    Node_5 --> Node_6
    Node_6["6: NodeType.STARTLOOP - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.IFLOOP - nextId != address(0) && ! _validInsertPosition(_ICR,prevId,nextId)"]
    Node_7 --> Node_8
    Node_7 --> Node_10
    Node_8["8: NodeType.EXPRESSION - nextId = data.nodes(nextId).prevId"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - prevId = data.nodes(nextId).prevId"]
    Node_9 --> Node_7
    Node_10["10: NodeType.ENDLOOP - "]
    Node_10 --> Node_11
    Node_11["11: NodeType.RETURN - (prevId,nextId)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/SortedTroves.sol` on lines **367** to **383**

```solidity
    function _ascendList(uint256 _ICR, address _startId) internal view returns (address, address) {
        // If `_startId` is the tail, check if the insert position is after the tail
        if (data.tail == _startId && _ICR <= data.nodes[_startId].oldICR) {
            return (_startId, address(0));
        }

        address nextId = _startId;
        address prevId = data.nodes[nextId].prevId;

        // Ascend the list until we reach the end or until we find a valid insertion point
        while (nextId != address(0) && !_validInsertPosition(_ICR, prevId, nextId)) {
            nextId = data.nodes[nextId].prevId;
            prevId = data.nodes[nextId].prevId;
        }

        return (prevId, nextId);
    }

```
