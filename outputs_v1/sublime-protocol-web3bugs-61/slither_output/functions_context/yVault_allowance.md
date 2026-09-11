# Context: yVault.allowance

**Contract:** `yVault` (Inherits: ERC20Detailed, ERC20, Context)
**Signature:** `allowance(address,address) returns (uint256)`
**Method Selector ID:** `0xdd62ed3e`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** _allowances
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
    Node_1["1: NodeType.RETURN - _allowances(owner)(spender)"]
```

### Source Mapping
Declared in: `contracts/mocks/yVault/yVault.sol` on lines **39** to **41**

```solidity
    function allowance(address owner, address spender) public view returns (uint256) {
        return _allowances[owner][spender];
    }

```
