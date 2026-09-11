# Context: SortedTrovesTester.insert

**Contract:** `SortedTrovesTester` (Inherits: SortedTroves, ISortedTroves, CheckContract, Ownable)
**Signature:** `insert(address,uint256,address,address)`
**Method Selector ID:** `0x46f7cf87`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
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
    Node_1["1: NodeType.EXPRESSION - _requireCallerIsBOorTroveM()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - _insert(_id,_ICR,_prevId,_nextId)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/SortedTroves.sol` on lines **118** to **121**

```solidity
    function insert(address _id, uint256 _ICR, address _prevId, address _nextId) external override {
        _requireCallerIsBOorTroveM();
        _insert(_id, _ICR, _prevId, _nextId);
    }

```
