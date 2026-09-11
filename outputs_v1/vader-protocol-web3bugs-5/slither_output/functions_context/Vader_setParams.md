# Context: Vader.setParams

**Contract:** `Vader` (Inherits: iERC20)
**Signature:** `setParams(uint256,uint256)`
**Method Selector ID:** `0xc0324c77`
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
- **Writes:** emissionCurve, secondsPerEra

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
    Node_1["1: NodeType.EXPRESSION - secondsPerEra = newEra"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - emissionCurve = newCurve"]
    Node_3["3: NodeType.EXPRESSION - onlyDAO()"]
    Node_3 --> Node_1
```

### Source Mapping
Declared in: `contracts/Vader.sol` on lines **179** to **182**

```solidity
    function setParams(uint newEra, uint newCurve) external onlyDAO {
        secondsPerEra = newEra;
        emissionCurve = newCurve;
    }

```
