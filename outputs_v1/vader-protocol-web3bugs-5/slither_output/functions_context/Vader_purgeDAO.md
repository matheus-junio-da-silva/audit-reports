# Context: Vader.purgeDAO

**Contract:** `Vader` (Inherits: iERC20)
**Signature:** `purgeDAO()`
**Method Selector ID:** `0xc91b6b46`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyDAO`
  ```solidity
  modifier onlyDAO() {
          require(msg.sender == DAO, "Not DAO");
          _;
      }
  ```

### State Variables Interaction
- **Reads:** None
- **Writes:** DAO

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
    Node_1["1: NodeType.EXPRESSION - DAO = address(0)"]
    Node_2["2: NodeType.EXPRESSION - onlyDAO()"]
    Node_2 --> Node_1
```

### Source Mapping
Declared in: `contracts/Vader.sol` on lines **198** to **200**

```solidity
    function purgeDAO() external onlyDAO{
        DAO = address(0);
    }

```
