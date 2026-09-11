# Context: ShortStrings.toStringWithFallback

**Contract:** `ShortStrings` (Inherits: None)
**Signature:** `toStringWithFallback(ShortString,string) returns (string)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** _FALLBACK_SENTINEL
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
    Node_1["1: NodeType.IF - ShortString.unwrap(value) != _FALLBACK_SENTINEL"]
    Node_1 --> Node_2
    Node_1 --> Node_3
    Node_2["2: NodeType.RETURN - toString(value)"]
    Node_3["3: NodeType.RETURN - store"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/node_modules/@openzeppelin/contracts/utils/ShortStrings.sol` on lines **101** to **107**

```solidity
    function toStringWithFallback(ShortString value, string storage store) internal pure returns (string memory) {
        if (ShortString.unwrap(value) != _FALLBACK_SENTINEL) {
            return toString(value);
        } else {
            return store;
        }
    }

```
