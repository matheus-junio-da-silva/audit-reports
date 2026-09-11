# Context: RCMarket.collectRentAllCards

**Contract:** `RCMarket` (Inherits: IRCMarket, NativeMetaTransaction, Initializable)
**Signature:** `collectRentAllCards() returns (bool)`
**Method Selector ID:** `0x605685e8`
**Visibility:** `public`
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
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - _checkState(States.OPEN)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - _success = true"]
    Node_2 --> Node_5
    Node_3["3: NodeType.STARTLOOP - "]
    Node_3 --> Node_6
    Node_4["4: NodeType.ENDLOOP - "]
    Node_4 --> Node_14
    Node_5["5: NodeType.VARIABLE - i = 0"]
    Node_5 --> Node_3
    Node_6["6: NodeType.IFLOOP - i < numberOfCards"]
    Node_6 --> Node_7
    Node_6 --> Node_4
    Node_7["7: NodeType.IF - ownerOf(i) != address(this)"]
    Node_7 --> Node_8
    Node_7 --> Node_9
    Node_8["8: NodeType.EXPRESSION - _success = _collectRent(i)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.ENDIF - "]
    Node_9 --> Node_10
    Node_10["10: NodeType.IF - ! _success"]
    Node_10 --> Node_11
    Node_10 --> Node_12
    Node_11["11: NodeType.RETURN - false"]
    Node_12["12: NodeType.ENDIF - "]
    Node_12 --> Node_13
    Node_13["13: NodeType.EXPRESSION - i ++"]
    Node_13 --> Node_6
    Node_14["14: NodeType.RETURN - true"]
```

### Source Mapping
Declared in: `contracts/RCMarket.sol` on lines **621** to **633**

```solidity
    function collectRentAllCards() public override returns (bool) {
        _checkState(States.OPEN);
        bool _success = true;
        for (uint256 i = 0; i < numberOfCards; i++) {
            if (ownerOf(i) != address(this)) {
                _success = _collectRent(i);
            }
            if (!_success) {
                return false;
            }
        }
        return true;
    }

```
