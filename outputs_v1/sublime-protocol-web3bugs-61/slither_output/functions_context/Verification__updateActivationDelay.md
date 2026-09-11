# Context: Verification._updateActivationDelay

**Contract:** `Verification` (Inherits: OwnableUpgradeable, ContextUpgradeable, IVerification, Initializable)
**Signature:** `_updateActivationDelay(uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** activationDelay

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
    Node_1["1: NodeType.EXPRESSION - activationDelay = _activationDelay"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - ActivationDelayUpdated(_activationDelay)"]
```

### Source Mapping
Declared in: `contracts/Verification/Verification.sol` on lines **60** to **63**

```solidity
    function _updateActivationDelay(uint256 _activationDelay) internal {
        activationDelay = _activationDelay;
        emit ActivationDelayUpdated(_activationDelay);
    }

```
