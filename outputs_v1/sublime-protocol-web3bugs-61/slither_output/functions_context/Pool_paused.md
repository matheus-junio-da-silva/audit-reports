# Context: Pool.paused

**Contract:** `Pool` (Inherits: ReentrancyGuard, IPool, ERC20PausableUpgradeable, PausableUpgradeable, ERC20Upgradeable, IERC20Upgradeable, ContextUpgradeable, Initializable)
**Signature:** `paused() returns (bool)`
**Method Selector ID:** `0x5c975abb`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** _paused
- **Writes:** None

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
    Node_1["1: NodeType.RETURN - _paused"]
```

### Source Mapping
Declared in: `node_modules/@openzeppelin/contracts-upgradeable/utils/PausableUpgradeable.sol` on lines **45** to **47**

```solidity
    function paused() public view virtual returns (bool) {
        return _paused;
    }

```
