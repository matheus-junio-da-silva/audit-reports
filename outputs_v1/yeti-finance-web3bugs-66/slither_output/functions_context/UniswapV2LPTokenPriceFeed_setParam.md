# Context: UniswapV2LPTokenPriceFeed.setParam

**Contract:** `UniswapV2LPTokenPriceFeed` (Inherits: Ownable, IPriceFeed)
**Signature:** `setParam(IBaseOracle,address)`
**Method Selector ID:** `0xeb6e11fc`
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
- **Writes:** base, pair

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
    Node_1["1: NodeType.EXPRESSION - base = _base"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - pair = _pair"]
    Node_3["3: NodeType.EXPRESSION - onlyOwner()"]
    Node_3 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/Oracles/LPTokenPriceFeed.sol` on lines **20** to **23**

```solidity
  function setParam(IBaseOracle _base, address _pair) external onlyOwner {
    base = _base;
    pair = _pair;
  }

```
