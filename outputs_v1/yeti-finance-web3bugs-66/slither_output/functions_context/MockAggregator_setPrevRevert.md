# Context: MockAggregator.setPrevRevert

**Contract:** `MockAggregator` (Inherits: AggregatorV3Interface)
**Signature:** `setPrevRevert()`
**Method Selector ID:** `0xa68e5945`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** prevRevert
- **Writes:** prevRevert

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
    Node_1["1: NodeType.EXPRESSION - prevRevert = ! prevRevert"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TestContracts/MockAggregator.sol` on lines **50** to **52**

```solidity
    function setPrevRevert() external  {
        prevRevert = !prevRevert;
    }

```
