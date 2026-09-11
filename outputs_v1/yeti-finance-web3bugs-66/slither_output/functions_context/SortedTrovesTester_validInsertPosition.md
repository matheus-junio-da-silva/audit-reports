# Context: SortedTrovesTester.validInsertPosition

**Contract:** `SortedTrovesTester` (Inherits: SortedTroves, ISortedTroves, CheckContract, Ownable)
**Signature:** `validInsertPosition(uint256,address,address) returns (bool)`
**Method Selector ID:** `0x3fce12d5`
**Visibility:** `external`
**Environment-Free:** `Yes`
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
    Node_1["1: NodeType.RETURN - _validInsertPosition(_ICR,_prevId,_nextId)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/SortedTroves.sol` on lines **316** to **318**

```solidity
    function validInsertPosition(uint256 _ICR, address _prevId, address _nextId) external view override returns (bool) {
        return _validInsertPosition(_ICR, _prevId, _nextId);
    }

```
