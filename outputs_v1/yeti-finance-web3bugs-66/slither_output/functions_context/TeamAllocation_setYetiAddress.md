# Context: TeamAllocation.setYetiAddress

**Contract:** `TeamAllocation` (Inherits: None)
**Signature:** `setYetiAddress(IERC20)`
**Method Selector ID:** `0x502f1b63`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyTeam`
  ```solidity
  modifier onlyTeam() {
          require(msg.sender == teamWallet, "Not a team wallet");
          _;
      }
  ```

### State Variables Interaction
- **Reads:** None
- **Writes:** YETI, yetiSet

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
    Node_1["1: NodeType.EXPRESSION - YETI = _YETI"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - yetiSet = true"]
    Node_3["3: NodeType.EXPRESSION - onlyTeam()"]
    Node_3 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TeamAllocation.sol` on lines **63** to **66**

```solidity
    function setYetiAddress(IERC20 _YETI) external onlyTeam {
        YETI = _YETI;
        yetiSet = true;
    }

```
