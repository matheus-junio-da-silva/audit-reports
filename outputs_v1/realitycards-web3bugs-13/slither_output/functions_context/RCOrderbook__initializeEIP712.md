# Context: RCOrderbook._initializeEIP712

**Contract:** `RCOrderbook` (Inherits: IRCOrderbook, NativeMetaTransaction, Ownable, Context)
**Signature:** `_initializeEIP712(string,string)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** _initializedEIP712

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
    Node_1["1: NodeType.EXPRESSION - _initializedEIP712 = true"]
```

### Source Mapping
Declared in: `contracts/lib/NativeMetaTransaction.sol` on lines **8** to **10**

```solidity
    function _initializeEIP712(string memory /*name*/, string memory /*version*/) internal virtual {
        _initializedEIP712 = true;
    }

```
