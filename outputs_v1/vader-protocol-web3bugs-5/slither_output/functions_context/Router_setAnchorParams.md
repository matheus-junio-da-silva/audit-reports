# Context: Router.setAnchorParams

**Contract:** `Router` (Inherits: None)
**Signature:** `setAnchorParams(uint256,uint256,uint256)`
**Method Selector ID:** `0x2e2d0856`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyDAO`
  ```solidity
  modifier onlyDAO() {
          require(msg.sender == DAO(), "Not DAO");
          _;
      }
  ```

### State Variables Interaction
- **Reads:** None
- **Writes:** anchorLimit, insidePriceLimit, outsidePriceLimit

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
    Node_1["1: NodeType.EXPRESSION - anchorLimit = newLimit"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - insidePriceLimit = newInside"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - outsidePriceLimit = newOutside"]
    Node_4["4: NodeType.EXPRESSION - onlyDAO()"]
    Node_4 --> Node_1
```

### Source Mapping
Declared in: `contracts/Router.sol` on lines **98** to **102**

```solidity
    function setAnchorParams(uint newLimit, uint newInside, uint newOutside) external onlyDAO {
        anchorLimit = newLimit;
        insidePriceLimit = newInside;
        outsidePriceLimit = newOutside;
    }

```
