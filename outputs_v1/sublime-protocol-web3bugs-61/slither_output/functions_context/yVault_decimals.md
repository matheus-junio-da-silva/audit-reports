# Context: yVault.decimals

**Contract:** `yVault` (Inherits: ERC20Detailed, ERC20, Context)
**Signature:** `decimals() returns (uint8)`
**Method Selector ID:** `0x313ce567`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** _decimals
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
    Node_1["1: NodeType.RETURN - _decimals"]
```

### Source Mapping
Declared in: `contracts/mocks/yVault/yVault.sol` on lines **138** to **140**

```solidity
    function decimals() public view returns (uint8) {
        return _decimals;
    }

```
