# Context: BQIOracle.setParam

**Contract:** `BQIOracle` (Inherits: Ownable)
**Signature:** `setParam(IBaseOracle,address,address)`
**Method Selector ID:** `0x06287db4`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyOwner`
  ```solidity
  modifier onlyOwner() {
          require(isOwner(), "CallerNotOwner");
          _;
      }
  ```

### State Variables Interaction
- **Reads:** None
- **Writes:** BQI, base, underlying

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
    Node_0 --> Node_4
    Node_1["1: NodeType.EXPRESSION - base = _base"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - underlying = _underlying"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - BQI = IQIToken(_BQI)"]
    Node_4["4: NodeType.EXPRESSION - onlyOwner()"]
    Node_4 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/Oracles/BQITokenOracle.sol` on lines **23** to **27**

```solidity
  function setParam(IBaseOracle _base, address _BQI, address _underlying) external onlyOwner {
    base = _base;
    underlying = _underlying;
    BQI=IQIToken(_BQI);
  }

```
