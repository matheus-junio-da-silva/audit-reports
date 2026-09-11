# Context: MockAggregator.setDecimals

**Contract:** `MockAggregator` (Inherits: AggregatorV3Interface)
**Signature:** `setDecimals(uint8)`
**Method Selector ID:** `0x7a1395aa`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** decimalsVal

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
    Node_1["1: NodeType.EXPRESSION - decimalsVal = _decimals"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TestContracts/MockAggregator.sol` on lines **26** to **28**

```solidity
    function setDecimals(uint8 _decimals) external {
        decimalsVal = _decimals;
    }

```
