# Context: GovernorAlpha.votingDelay

**Contract:** `GovernorAlpha` (Inherits: None)
**Signature:** `votingDelay() returns (uint256)`
**Method Selector ID:** `0x3932abb1`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
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
    Node_1["1: NodeType.RETURN - 1"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/governance/GovernorAlpha.sol` on lines **235** to **237**

```solidity
    function votingDelay() public pure returns (uint256) {
        return 1; // 1 block
    }

```
