# Context: Vader.burn

**Contract:** `Vader` (Inherits: iERC20)
**Signature:** `burn(uint256)`
**Method Selector ID:** `0x42966c68`
**Visibility:** `public`
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
Declared in: `contracts/Vader.sol` on lines **146** to **148**

```solidity
    function burn(uint amount) public virtual override {
        _burn(msg.sender, amount);
    }

```
