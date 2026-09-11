# Context: Router.setParams

**Contract:** `Router` (Inherits: None)
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
- **Writes:** curatedPoolLimit, rewardReductionFactor, timeForFullProtection

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
    Node_1["1: NodeType.EXPRESSION - rewardReductionFactor = newFactor"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - timeForFullProtection = newTime"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - curatedPoolLimit = newLimit"]
    Node_4["4: NodeType.EXPRESSION - onlyDAO()"]
    Node_4 --> Node_1
```

### Source Mapping
Declared in: `contracts/Router.sol` on lines **93** to **97**

```solidity
    function setParams(uint newFactor, uint newTime, uint newLimit) external onlyDAO {
        rewardReductionFactor = newFactor;
        timeForFullProtection = newTime;
        curatedPoolLimit = newLimit;
    }

```
