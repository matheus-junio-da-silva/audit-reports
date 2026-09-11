# Context: MochiCSSRv0.setDefaultLiquiditySource

**Contract:** `MochiCSSRv0` (Inherits: ICSSRRouter)
**Signature:** `setDefaultLiquiditySource(address)`
**Method Selector ID:** `0x461610e5`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyGov`
  ```solidity
  modifier onlyGov() {
          require(msg.sender == owned.governance(), "!gov");
          _;
      }
  ```

### State Variables Interaction
- **Reads:** adapter
- **Writes:** defaultLiquiditySource

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(adapter[_adapter],!listed)`

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
    Node_0 --> Node_3
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(adapter(_adapter),!listed)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - defaultLiquiditySource = _adapter"]
    Node_3["3: NodeType.EXPRESSION - onlyGov()"]
    Node_3 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-cssr/contracts/MochiCSSRv0.sol` on lines **88** to **91**

```solidity
    function setDefaultLiquiditySource(address _adapter) external onlyGov {
        require(adapter[_adapter], "!listed");
        defaultLiquiditySource = _adapter;
    }

```
