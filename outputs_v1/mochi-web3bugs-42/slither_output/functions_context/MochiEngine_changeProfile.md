# Context: MochiEngine.changeProfile

**Contract:** `MochiEngine` (Inherits: IMochiEngine)
**Signature:** `changeProfile(address)`
**Method Selector ID:** `0x23d1ac69`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyGov`
  ```solidity
  modifier onlyGov() {
          require(msg.sender == governance, "!gov");
          _;
      }
  ```

### State Variables Interaction
- **Reads:** None
- **Writes:** mochiProfile

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
    Node_1["1: NodeType.EXPRESSION - mochiProfile = IMochiProfile(_profile)"]
    Node_2["2: NodeType.EXPRESSION - onlyGov()"]
    Node_2 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-core/contracts/MochiEngine.sol` on lines **71** to **73**

```solidity
    function changeProfile(address _profile) external onlyGov {
        mochiProfile = IMochiProfile(_profile);
    }

```
