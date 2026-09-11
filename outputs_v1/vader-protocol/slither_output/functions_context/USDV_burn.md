# Context: USDV.burn

**Contract:** `USDV` (Inherits: iERC20)
**Signature:** `burn(uint256)`
**Method Selector ID:** `0x42966c68`
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
    Node_1["1: NodeType.EXPRESSION - _burn(msg.sender,amount)"]
```

### Source Mapping
Declared in: `contracts/USDV.sol` on lines **121** to **123**

```solidity
    function burn(uint amount) external virtual override {
        _burn(msg.sender, amount);
    }

```
