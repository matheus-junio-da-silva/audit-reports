# Context: RCMarket._collectRent

**Contract:** `RCMarket` (Inherits: IRCMarket, NativeMetaTransaction, Initializable)
**Signature:** `_collectRent(uint256) returns (bool)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** maxRentIterations
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
    Node_1["1: NodeType.VARIABLE - counter = 0"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - shouldContinue = true"]
    Node_2 --> Node_3
    Node_3["3: NodeType.STARTLOOP - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.IFLOOP - counter < maxRentIterations && shouldContinue"]
    Node_4 --> Node_5
    Node_4 --> Node_7
    Node_5["5: NodeType.EXPRESSION - shouldContinue = _collectRentAction(_card)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - counter ++"]
    Node_6 --> Node_4
    Node_7["7: NodeType.ENDLOOP - "]
    Node_7 --> Node_8
    Node_8["8: NodeType.RETURN - ! shouldContinue"]
    Node_9["9: NodeType.RETURN - didUpdateEverything"]
```

### Source Mapping
Declared in: `contracts/RCMarket.sol` on lines **1038** to **1049**

```solidity
    function _collectRent(uint256 _card)
        internal
        returns (bool didUpdateEverything)
    {
        uint32 counter = 0;
        bool shouldContinue = true;
        while (counter < maxRentIterations && shouldContinue) {
            shouldContinue = _collectRentAction(_card);
            counter++;
        }
        return !shouldContinue;
    }

```
