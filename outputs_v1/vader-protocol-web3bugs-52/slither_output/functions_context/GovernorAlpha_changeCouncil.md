# Context: GovernorAlpha.changeCouncil

**Contract:** `GovernorAlpha` (Inherits: None)
**Signature:** `changeCouncil(address)`
**Method Selector ID:** `0x02c3b436`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyTimelock`
  ```solidity
  modifier onlyTimelock() {
          _onlyTimelock();
          _;
      }
  ```

### State Variables Interaction
- **Reads:** council
- **Writes:** council

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
    Node_1["1: NodeType.EXPRESSION - CouncilChanged(council,council_)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - council = council_"]
    Node_3["3: NodeType.EXPRESSION - onlyTimelock()"]
    Node_3 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/governance/GovernorAlpha.sol` on lines **596** to **599**

```solidity
    function changeCouncil(address council_) external onlyTimelock {
        emit CouncilChanged(council, council_);
        council = council_;
    }

```
