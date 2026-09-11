# Context: Vault.setParams

**Contract:** `Vault` (Inherits: None)
**Signature:** `setParams(uint256,uint256,uint256)`
**Method Selector ID:** `0x5a0ce676`
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
- **Writes:** erasToEarn, minGrantTime, minimumDepositTime

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
    Node_1["1: NodeType.EXPRESSION - erasToEarn = newEra"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - minimumDepositTime = newDepositTime"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - minGrantTime = newGrantTime"]
    Node_4["4: NodeType.EXPRESSION - onlyDAO()"]
    Node_4 --> Node_1
```

### Source Mapping
Declared in: `contracts/Vault.sol` on lines **61** to **65**

```solidity
    function setParams(uint newEra, uint newDepositTime, uint newGrantTime) external onlyDAO {
        erasToEarn = newEra;
        minimumDepositTime = newDepositTime;
        minGrantTime = newGrantTime;
    }

```
