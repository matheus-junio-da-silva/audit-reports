# Context: YearnYield.constructor

**Contract:** `YearnYield` (Inherits: ReentrancyGuard, OwnableUpgradeable, ContextUpgradeable, Initializable, IYield)
**Signature:** `constructor()`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** _NOT_ENTERED
- **Writes:** _status

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
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - _status = _NOT_ENTERED"]
```

### Source Mapping
Declared in: `node_modules/@openzeppelin/contracts/utils/ReentrancyGuard.sol` on lines **38** to **40**

```solidity
    constructor () internal {
        _status = _NOT_ENTERED;
    }

```
