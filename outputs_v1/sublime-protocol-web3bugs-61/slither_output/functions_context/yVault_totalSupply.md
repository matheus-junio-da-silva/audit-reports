# Context: yVault.totalSupply

**Contract:** `yVault` (Inherits: ERC20Detailed, ERC20, Context)
**Signature:** `totalSupply() returns (uint256)`
**Method Selector ID:** `0x18160ddd`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** _totalSupply
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
    Node_1["1: NodeType.RETURN - _totalSupply"]
```

### Source Mapping
Declared in: `contracts/mocks/yVault/yVault.sol` on lines **26** to **28**

```solidity
    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

```
