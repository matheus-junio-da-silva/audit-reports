# Context: AAVEOracle.setParam

**Contract:** `AAVEOracle` (Inherits: Ownable)
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
- **Writes:** WAAVE, base, underlying

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
    Node_3["3: NodeType.EXPRESSION - WAAVE = IWAAVE(_WAAVE)"]
    Node_4["4: NodeType.EXPRESSION - onlyOwner()"]
    Node_4 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/Oracles/AAVETokenOracle.sol` on lines **22** to **26**

```solidity
  function setParam(IBaseOracle _base, address _WAAVE, address _underlying) external onlyOwner {
    base = _base;
    underlying = _underlying;
    WAAVE=IWAAVE(_WAAVE);
  }

```
