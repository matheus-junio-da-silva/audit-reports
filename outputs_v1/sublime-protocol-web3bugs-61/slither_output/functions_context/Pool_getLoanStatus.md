# Context: Pool.getLoanStatus

**Contract:** `Pool` (Inherits: ReentrancyGuard, IPool, ERC20PausableUpgradeable, PausableUpgradeable, ERC20Upgradeable, IERC20Upgradeable, ContextUpgradeable, Initializable)
**Signature:** `getLoanStatus() returns (uint256)`
**Method Selector ID:** `0xacc1ab13`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** poolVariables
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
    Node_1["1: NodeType.RETURN - uint256(poolVariables.loanStatus)"]
```

### Source Mapping
Declared in: `contracts/Pool/Pool.sol` on lines **1005** to **1007**

```solidity
    function getLoanStatus() external view override returns (uint256) {
        return uint256(poolVariables.loanStatus);
    }

```
