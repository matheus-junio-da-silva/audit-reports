# Context: Rlp.toList

**Contract:** `Rlp` (Inherits: None)
**Signature:** `toList(Rlp.Item) returns (Rlp.Item[])`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(isList(self),Rlp.sol:Rlp:toList:1)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(isList(self),Rlp.sol:Rlp:toList:1)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - numItems = items(self)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - list = new Rlp.Item()(numItems)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - it = iterator(self)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.STARTLOOP - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.IFLOOP - hasNext(it)"]
    Node_7 --> Node_8
    Node_7 --> Node_10
    Node_8["8: NodeType.EXPRESSION - list(idx) = next(it)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - idx ++"]
    Node_9 --> Node_7
    Node_10["10: NodeType.ENDLOOP - "]
    Node_10 --> Node_11
    Node_11["11: NodeType.RETURN - list"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-library/contracts/Rlp.sol` on lines **189** to **200**

```solidity
    function toList(Item memory self) internal pure returns (Item[] memory) {
        require(isList(self), "Rlp.sol:Rlp:toList:1");
        uint256 numItems = items(self);
        Item[] memory list = new Item[](numItems);
        Rlp.Iterator memory it = iterator(self);
        uint idx;
        while(hasNext(it)) {
            list[idx] = next(it);
            idx++;
        }
        return list;
    }

```
