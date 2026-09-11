# Context: RCTreasury.batchAddToWhitelist

**Contract:** `RCTreasury` (Inherits: IRCTreasury, NativeMetaTransaction, Ownable, Context)
**Signature:** `batchAddToWhitelist(address[])`
**Method Selector ID:** `0x2db6fa36`
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
    Node_0 --> Node_3
    Node_1["1: NodeType.STARTLOOP - "]
    Node_1 --> Node_4
    Node_2["2: NodeType.ENDLOOP - "]
    Node_3["3: NodeType.VARIABLE - index = 0"]
    Node_3 --> Node_1
    Node_4["4: NodeType.IFLOOP - index < _users.length"]
    Node_4 --> Node_5
    Node_4 --> Node_2
    Node_5["5: NodeType.EXPRESSION - addToWhitelist(_users(index))"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - index ++"]
    Node_6 --> Node_4
```

### Source Mapping
Declared in: `contracts/RCTreasury.sol` on lines **217** to **221**

```solidity
    function batchAddToWhitelist(address[] calldata _users) public override {
        for (uint256 index = 0; index < _users.length; index++) {
            addToWhitelist(_users[index]);
        }
    }

```
