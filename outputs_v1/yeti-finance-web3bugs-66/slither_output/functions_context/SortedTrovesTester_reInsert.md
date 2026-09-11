# Context: SortedTrovesTester.reInsert

**Contract:** `SortedTrovesTester` (Inherits: SortedTroves, ISortedTroves, CheckContract, Ownable)
**Signature:** `reInsert(address,uint256,address,address)`
**Method Selector ID:** `0x2be21260`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(contains(_id),SortedTroves: Id not found)`
- require/assert: `require(bool,string)(_newICR != 0,SortedTroves: ICR must be (+))`

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
    Node_1["1: NodeType.EXPRESSION - _requireCallerIsBOorTroveM()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(contains(_id),SortedTroves: Id not found)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - require(bool,string)(_newICR != 0,SortedTroves: ICR must be (+))"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - _remove(_id)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - _insert(_id,_newICR,_prevId,_nextId)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/SortedTroves.sol` on lines **225** to **236**

```solidity
    function reInsert(address _id, uint256 _newICR, address _prevId, address _nextId) external override {
        _requireCallerIsBOorTroveM();
        // List must contain the node
        require(contains(_id), "SortedTroves: Id not found");
        // ICR must be non-zero
        require(_newICR != 0, "SortedTroves: ICR must be (+)");

        // Remove node from the list
        _remove(_id);

        _insert(_id, _newICR, _prevId, _nextId);
    }

```
