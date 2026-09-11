# Context: USDV.balanceOf

**Contract:** `USDV` (Inherits: iERC20)
**Signature:** `balanceOf(address) returns (uint256)`
**Method Selector ID:** `0x70a08231`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** _balances
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
    Node_1["1: NodeType.RETURN - _balances(account)"]
```

### Source Mapping
Declared in: `contracts/USDV.sol` on lines **64** to **66**

```solidity
    function balanceOf(address account) public view override returns (uint) {
        return _balances[account];
    }

```
