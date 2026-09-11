# Context: MockAggregator.setPrevPrice

**Contract:** `MockAggregator` (Inherits: AggregatorV3Interface)
**Signature:** `setPrevPrice(int256)`
**Method Selector ID:** `0x13886538`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** prevPrice

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
    Node_1["1: NodeType.EXPRESSION - prevPrice = _prevPrice"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TestContracts/MockAggregator.sol` on lines **34** to **36**

```solidity
    function setPrevPrice(int _prevPrice) external {
        prevPrice = _prevPrice;
    }

```
