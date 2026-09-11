# Context: FunctionCaller.setSortedTrovesAddress

**Contract:** `FunctionCaller` (Inherits: None)
**Signature:** `setSortedTrovesAddress(address)`
**Method Selector ID:** `0xa06dec71`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** sortedTroves, troveManagerAddress

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
    Node_1["1: NodeType.EXPRESSION - troveManagerAddress = _sortedTrovesAddress"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - sortedTroves = ISortedTroves(_sortedTrovesAddress)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TestContracts/FunctionCaller.sol` on lines **30** to **33**

```solidity
    function setSortedTrovesAddress(address _sortedTrovesAddress) external {
        troveManagerAddress = _sortedTrovesAddress;
        sortedTroves = ISortedTroves(_sortedTrovesAddress);
    }

```
