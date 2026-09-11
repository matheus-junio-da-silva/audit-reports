# Context: Vether.addExcluded

**Contract:** `Vether` (Inherits: iVETHER)
**Signature:** `addExcluded(address)`
**Method Selector ID:** `0xa9321573`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** mapAddress_Excluded

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
    Node_1["1: NodeType.EXPRESSION - mapAddress_Excluded(excluded) = true"]
```

### Source Mapping
Declared in: `contracts/Vether.sol` on lines **93** to **95**

```solidity
    function addExcluded(address excluded) public {
        mapAddress_Excluded[excluded] = true;
    }

```
