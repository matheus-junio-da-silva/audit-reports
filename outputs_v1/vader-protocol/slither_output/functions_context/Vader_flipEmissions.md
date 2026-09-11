# Context: Vader.flipEmissions

**Contract:** `Vader` (Inherits: iERC20)
**Signature:** `flipEmissions()`
**Method Selector ID:** `0xfe1fa8fa`
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
- **Reads:** emitting
- **Writes:** emitting

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
    Node_0 --> Node_5
    Node_1["1: NodeType.IF - emitting"]
    Node_1 --> Node_2
    Node_1 --> Node_3
    Node_2["2: NodeType.EXPRESSION - emitting = false"]
    Node_2 --> Node_4
    Node_3["3: NodeType.EXPRESSION - emitting = true"]
    Node_3 --> Node_4
    Node_4["4: NodeType.ENDIF - "]
    Node_5["5: NodeType.EXPRESSION - onlyDAO()"]
    Node_5 --> Node_1
```

### Source Mapping
Declared in: `contracts/Vader.sol` on lines **163** to **169**

```solidity
    function flipEmissions() external onlyDAO {
        if(emitting){
            emitting = false;
        } else {
            emitting = true;
        }
    }

```
