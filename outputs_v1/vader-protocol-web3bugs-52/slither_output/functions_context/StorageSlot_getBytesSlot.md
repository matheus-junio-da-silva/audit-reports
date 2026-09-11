# Context: StorageSlot.getBytesSlot

**Contract:** `StorageSlot` (Inherits: None)
**Signature:** `getBytesSlot(bytes32) returns (StorageSlot.BytesSlot)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
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
    Node_1["1: NodeType.ASSEMBLY - "]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - r = slot"]
    Node_2 --> Node_3
    Node_3["3: NodeType.ENDASSEMBLY - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.RETURN - r"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/node_modules/@openzeppelin/contracts/utils/StorageSlot.sol` on lines **122** to **127**

```solidity
    function getBytesSlot(bytes32 slot) internal pure returns (BytesSlot storage r) {
        /// @solidity memory-safe-assembly
        assembly {
            r.slot := slot
        }
    }

```
