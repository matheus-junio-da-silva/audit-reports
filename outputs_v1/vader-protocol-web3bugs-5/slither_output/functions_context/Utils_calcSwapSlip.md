# Context: Utils.calcSwapSlip

**Contract:** `Utils` (Inherits: None)
**Signature:** `calcSwapSlip(uint256,uint256) returns (uint256)`
**Method Selector ID:** `0x2db6e488`
**Visibility:** `external`
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
    Node_1["1: NodeType.RETURN - (x * 10000) / (x + X)"]
```

### Source Mapping
Declared in: `contracts/Utils.sol` on lines **224** to **227**

```solidity
    function calcSwapSlip(uint x, uint X) external pure returns (uint){
        // slip = (x) / (x + X)
        return (x*10000) / (x + X);
    }

```
