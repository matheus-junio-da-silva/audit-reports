# Context: SublimeProxy._fallback

**Contract:** `SublimeProxy` (Inherits: TransparentUpgradeableProxy, UpgradeableProxy, Proxy)
**Signature:** `_fallback()`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
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
    Node_1["1: NodeType.EXPRESSION - _beforeFallback()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - _delegate(_implementation())"]
```

### Source Mapping
Declared in: `node_modules/@openzeppelin/contracts/proxy/Proxy.sol` on lines **54** to **57**

```solidity
    function _fallback() internal virtual {
        _beforeFallback();
        _delegate(_implementation());
    }

```
