# Context: SortedTroves._insert

**Contract:** `SortedTroves` (Inherits: ISortedTroves, CheckContract, Ownable)
**Signature:** `_insert(address,uint256,address,address)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** data
- **Writes:** data

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(! isFull(),SortedTroves: List is full)`
- require/assert: `require(bool,string)(! contains(_id),SortedTroves: duplicate node)`
- require/assert: `require(bool,string)(_id != address(0),SortedTroves: Id cannot be zero)`
- require/assert: `require(bool,string)(_ICR != 0,SortedTroves: ICR must be (+))`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_78(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['REF_42', '1'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(! isFull(),SortedTroves: List is full)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(! contains(_id),SortedTroves: duplicate node)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - require(bool,string)(_id != address(0),SortedTroves: Id cannot be zero)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - require(bool,string)(_ICR != 0,SortedTroves: ICR must be (+))"]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - prevId = _prevId"]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - nextId = _nextId"]
    Node_6 --> Node_7
    Node_7["7: NodeType.IF - ! _validInsertPosition(_ICR,prevId,nextId)"]
    Node_7 --> Node_8
    Node_7 --> Node_9
    Node_8["8: NodeType.EXPRESSION - (prevId,nextId) = _findInsertPosition(_ICR,prevId,nextId)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.ENDIF - "]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - data.nodes(_id).exists = true"]
    Node_10 --> Node_11
    Node_11["11: NodeType.IF - prevId == address(0) && nextId == address(0)"]
    Node_11 --> Node_12
    Node_11 --> Node_14
    Node_12["12: NodeType.EXPRESSION - data.head = _id"]
    Node_12 --> Node_13
    Node_13["13: NodeType.EXPRESSION - data.tail = _id"]
    Node_13 --> Node_28
    Node_14["14: NodeType.IF - prevId == address(0)"]
    Node_14 --> Node_15
    Node_14 --> Node_18
    Node_15["15: NodeType.EXPRESSION - data.nodes(_id).nextId = data.head"]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - data.nodes(data.head).prevId = _id"]
    Node_16 --> Node_17
    Node_17["17: NodeType.EXPRESSION - data.head = _id"]
    Node_17 --> Node_27
    Node_18["18: NodeType.IF - nextId == address(0)"]
    Node_18 --> Node_19
    Node_18 --> Node_22
    Node_19["19: NodeType.EXPRESSION - data.nodes(_id).prevId = data.tail"]
    Node_19 --> Node_20
    Node_20["20: NodeType.EXPRESSION - data.nodes(data.tail).nextId = _id"]
    Node_20 --> Node_21
    Node_21["21: NodeType.EXPRESSION - data.tail = _id"]
    Node_21 --> Node_26
    Node_22["22: NodeType.EXPRESSION - data.nodes(_id).nextId = nextId"]
    Node_22 --> Node_23
    Node_23["23: NodeType.EXPRESSION - data.nodes(_id).prevId = prevId"]
    Node_23 --> Node_24
    Node_24["24: NodeType.EXPRESSION - data.nodes(prevId).nextId = _id"]
    Node_24 --> Node_25
    Node_25["25: NodeType.EXPRESSION - data.nodes(nextId).prevId = _id"]
    Node_25 --> Node_26
    Node_26["26: NodeType.ENDIF - "]
    Node_26 --> Node_27
    Node_27["27: NodeType.ENDIF - "]
    Node_27 --> Node_28
    Node_28["28: NodeType.ENDIF - "]
    Node_28 --> Node_29
    Node_29["29: NodeType.EXPRESSION - data.nodes(_id).oldICR = _ICR"]
    Node_29 --> Node_30
    Node_30["30: NodeType.EXPRESSION - data.size = data.size.add(1)"]
    Node_30 --> Node_31
    Node_31["31: NodeType.EXPRESSION - NodeAdded(_id,_ICR)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/SortedTroves.sol` on lines **123** to **168**

```solidity
    function _insert(address _id, uint256 _ICR, address _prevId, address _nextId) internal {
        // List must not be full
        require(!isFull(), "SortedTroves: List is full");
        // List must not already contain node
        require(!contains(_id), "SortedTroves: duplicate node");
        // Node id must not be null
        require(_id != address(0), "SortedTroves: Id cannot be zero");
        // ICR must be non-zero
        require(_ICR != 0, "SortedTroves: ICR must be (+)");
        address prevId = _prevId;
        address nextId = _nextId;
        if (!_validInsertPosition(_ICR, prevId, nextId)) {
            // Sender's hint was not a valid insert position
            // Use sender's hint to find a valid insert position
            (prevId, nextId) = _findInsertPosition(_ICR, prevId, nextId);
        }

         data.nodes[_id].exists = true;
        if (prevId == address(0) && nextId == address(0)) {
            // Insert as head and tail
            data.head = _id;
            data.tail = _id;
        } else if (prevId == address(0)) {
            // Insert before `prevId` as the head
            data.nodes[_id].nextId = data.head;
            data.nodes[data.head].prevId = _id;
            data.head = _id;
        } else if (nextId == address(0)) {
            // Insert after `nextId` as the tail
            data.nodes[_id].prevId = data.tail;
            data.nodes[data.tail].nextId = _id;
            data.tail = _id;
        } else {
            // Insert at insert position between `prevId` and `nextId`
            data.nodes[_id].nextId = nextId;
            data.nodes[_id].prevId = prevId;
            data.nodes[prevId].nextId = _id;
            data.nodes[nextId].prevId = _id;
        }

        // Update node's ICR
        data.nodes[_id].oldICR = _ICR;

        data.size = data.size.add(1);
        emit NodeAdded(_id, _ICR);
    }

```
