# Context: SortedTroves._remove

**Contract:** `SortedTroves` (Inherits: ISortedTroves, CheckContract, Ownable)
**Signature:** `_remove(address)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** data
- **Writes:** data

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(contains(_id),SortedTroves: Id not found)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_91(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['REF_89', '1'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(contains(_id),SortedTroves: Id not found)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.IF - data.size > 1"]
    Node_2 --> Node_3
    Node_2 --> Node_13
    Node_3["3: NodeType.IF - _id == data.head"]
    Node_3 --> Node_4
    Node_3 --> Node_6
    Node_4["4: NodeType.EXPRESSION - data.head = data.nodes(_id).nextId"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - data.nodes(data.head).prevId = address(0)"]
    Node_5 --> Node_12
    Node_6["6: NodeType.IF - _id == data.tail"]
    Node_6 --> Node_7
    Node_6 --> Node_9
    Node_7["7: NodeType.EXPRESSION - data.tail = data.nodes(_id).prevId"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - data.nodes(data.tail).nextId = address(0)"]
    Node_8 --> Node_11
    Node_9["9: NodeType.EXPRESSION - data.nodes(data.nodes(_id).prevId).nextId = data.nodes(_id).nextId"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - data.nodes(data.nodes(_id).nextId).prevId = data.nodes(_id).prevId"]
    Node_10 --> Node_11
    Node_11["11: NodeType.ENDIF - "]
    Node_11 --> Node_12
    Node_12["12: NodeType.ENDIF - "]
    Node_12 --> Node_15
    Node_13["13: NodeType.EXPRESSION - data.head = address(0)"]
    Node_13 --> Node_14
    Node_14["14: NodeType.EXPRESSION - data.tail = address(0)"]
    Node_14 --> Node_15
    Node_15["15: NodeType.ENDIF - "]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - data.nodes(_id).oldICR = 0"]
    Node_16 --> Node_17
    Node_17["17: NodeType.EXPRESSION - delete data.nodes(_id)"]
    Node_17 --> Node_18
    Node_18["18: NodeType.EXPRESSION - data.size = data.size.sub(1)"]
    Node_18 --> Node_19
    Node_19["19: NodeType.EXPRESSION - NodeRemoved(_id)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/SortedTroves.sol` on lines **179** to **216**

```solidity
    function _remove(address _id) internal {
        // List must contain the node
        require(contains(_id), "SortedTroves: Id not found");

        if (data.size > 1) {
            // List contains more than a single node
            if (_id == data.head) {
                // The removed node is the head
                // Set head to next node
                data.head = data.nodes[_id].nextId;
                // Set prev pointer of new head to null
                data.nodes[data.head].prevId = address(0);
            } else if (_id == data.tail) {
                // The removed node is the tail
                // Set tail to previous node
                data.tail = data.nodes[_id].prevId;
                // Set next pointer of new tail to null
                data.nodes[data.tail].nextId = address(0);
            } else {
                // The removed node is neither the head nor the tail
                // Set next pointer of previous node to the next node
                data.nodes[data.nodes[_id].prevId].nextId = data.nodes[_id].nextId;
                // Set prev pointer of next node to the previous node
                data.nodes[data.nodes[_id].nextId].prevId = data.nodes[_id].prevId;
            }
        } else {
            // List contains a single node
            // Set the head and tail to null
            data.head = address(0);
            data.tail = address(0);
        }

        data.nodes[_id].oldICR = 0;

        delete data.nodes[_id];
        data.size = data.size.sub(1);
        emit NodeRemoved(_id);
    }

```
