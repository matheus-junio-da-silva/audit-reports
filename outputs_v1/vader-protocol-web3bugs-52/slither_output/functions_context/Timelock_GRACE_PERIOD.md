# Context: Timelock.GRACE_PERIOD

**Contract:** `Timelock` (Inherits: ITimelock)
**Signature:** `GRACE_PERIOD() returns (uint256)`
**Method Selector ID:** `0xc1a287e2`
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
    Node_1["1: NodeType.RETURN - 1209600"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/governance/Timelock.sol` on lines **107** to **109**

```solidity
    function GRACE_PERIOD() public pure virtual override returns (uint256) {
        return 14 days;
    }

```
