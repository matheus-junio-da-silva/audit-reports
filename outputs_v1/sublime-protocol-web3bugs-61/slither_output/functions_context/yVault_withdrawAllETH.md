# Context: yVault.withdrawAllETH

**Contract:** `yVault` (Inherits: ERC20Detailed, ERC20, Context)
**Signature:** `withdrawAllETH()`
**Method Selector ID:** `0x90386bbf`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
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
    Node_1["1: NodeType.EXPRESSION - withdrawETH(balanceOf(msg.sender))"]
```

### Source Mapping
Declared in: `contracts/mocks/yVault/yVault.sol` on lines **310** to **312**

```solidity
    function withdrawAllETH() external {
        withdrawETH(balanceOf(msg.sender));
    }

```
