# Context: Timelock.MINIMUM_DELAY

**Contract:** `Timelock` (Inherits: ITimelock)
**Signature:** `MINIMUM_DELAY() returns (uint256)`
**Method Selector ID:** `0xb1b43ae5`
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
    Node_1["1: NodeType.RETURN - 172800"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/governance/Timelock.sol` on lines **114** to **116**

```solidity
    function MINIMUM_DELAY() public pure virtual returns (uint256) {
        return 2 days;
    }

```
