# Context: Repayments._updateGracePeriodFraction

**Contract:** `Repayments` (Inherits: ReentrancyGuard, IRepayment, Initializable)
**Signature:** `_updateGracePeriodFraction(uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** gracePeriodFraction

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
    Node_1["1: NodeType.EXPRESSION - gracePeriodFraction = _gracePeriodFraction"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - GracePeriodFractionUpdated(_gracePeriodFraction)"]
```

### Source Mapping
Declared in: `contracts/Pool/Repayments.sol` on lines **129** to **132**

```solidity
    function _updateGracePeriodFraction(uint256 _gracePeriodFraction) internal {
        gracePeriodFraction = _gracePeriodFraction;
        emit GracePeriodFractionUpdated(_gracePeriodFraction);
    }

```
