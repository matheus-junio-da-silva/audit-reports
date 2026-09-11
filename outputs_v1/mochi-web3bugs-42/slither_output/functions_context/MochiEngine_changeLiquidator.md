# Context: MochiEngine.changeLiquidator

**Contract:** `MochiEngine` (Inherits: IMochiEngine)
**Signature:** `changeLiquidator(address)`
**Method Selector ID:** `0x9fbc5d3d`
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
- **Writes:** liquidator

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
    Node_1["1: NodeType.EXPRESSION - liquidator = ILiquidator(_liquidator)"]
    Node_2["2: NodeType.EXPRESSION - onlyGov()"]
    Node_2 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-core/contracts/MochiEngine.sol` on lines **79** to **81**

```solidity
    function changeLiquidator(address _liquidator) external onlyGov {
        liquidator = ILiquidator(_liquidator);
    }

```
