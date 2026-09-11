# Context: GovernorAlpha.__abdicate

**Contract:** `GovernorAlpha` (Inherits: None)
**Signature:** `__abdicate()`
**Method Selector ID:** `0x760fbc13`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyGuardian`
  ```solidity
  modifier onlyGuardian() {
          _onlyGuardian();
          _;
      }
  ```

### State Variables Interaction
- **Reads:** None
- **Writes:** guardian

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
    Node_1["1: NodeType.EXPRESSION - guardian = address(0)"]
    Node_2["2: NodeType.EXPRESSION - onlyGuardian()"]
    Node_2 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/governance/GovernorAlpha.sol` on lines **650** to **652**

```solidity
    function __abdicate() public onlyGuardian {
        guardian = address(0);
    }

```
