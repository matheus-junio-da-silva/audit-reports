# Context: MochiEngine.changeFeePool

**Contract:** `MochiEngine` (Inherits: IMochiEngine)
**Signature:** `changeFeePool(address)`
**Method Selector ID:** `0xd367e2aa`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyGov`
  ```solidity
  modifier onlyGov() {
          require(msg.sender == governance, "!gov");
          _;
      }
  ```

### State Variables Interaction
- **Reads:** None
- **Writes:** feePool

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
    Node_0 --> Node_2
    Node_1["1: NodeType.EXPRESSION - feePool = IFeePool(_feePool)"]
    Node_2["2: NodeType.EXPRESSION - onlyGov()"]
    Node_2 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-core/contracts/MochiEngine.sol` on lines **83** to **85**

```solidity
    function changeFeePool(address _feePool) external onlyGov {
        feePool = IFeePool(_feePool);
    }

```
