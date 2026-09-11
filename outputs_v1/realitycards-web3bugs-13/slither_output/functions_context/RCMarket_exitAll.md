# Context: RCMarket.exitAll

**Contract:** `RCMarket` (Inherits: IRCMarket, NativeMetaTransaction, Initializable)
**Signature:** `exitAll()`
**Method Selector ID:** `0x5b6c508c`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** numberOfCards
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
    Node_0 --> Node_3
    Node_1["1: NodeType.STARTLOOP - "]
    Node_1 --> Node_4
    Node_2["2: NodeType.ENDLOOP - "]
    Node_3["3: NodeType.VARIABLE - i = 0"]
    Node_3 --> Node_1
    Node_4["4: NodeType.IFLOOP - i < numberOfCards"]
    Node_4 --> Node_5
    Node_4 --> Node_2
    Node_5["5: NodeType.EXPRESSION - exit(i)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - i ++"]
    Node_6 --> Node_4
```

### Source Mapping
Declared in: `contracts/RCMarket.sol` on lines **773** to **777**

```solidity
    function exitAll() external override {
        for (uint256 i = 0; i < numberOfCards; i++) {
            exit(i);
        }
    }

```
