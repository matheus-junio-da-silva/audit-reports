# Context: RCMarket.setWinner

**Contract:** `RCMarket` (Inherits: IRCMarket, NativeMetaTransaction, Initializable)
**Signature:** `setWinner(uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** state, winningOutcome
- **Writes:** marketLockingTime, winningOutcome

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeCast.TMP_942(uint32) = LIBRARY_CALL, dest:SafeCast, function:SafeCast.toUint32(uint256), arguments:['block.timestamp'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.IF - state == States.OPEN"]
    Node_1 --> Node_2
    Node_1 --> Node_4
    Node_2["2: NodeType.EXPRESSION - marketLockingTime = SafeCast.toUint32(block.timestamp)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - lockMarket()"]
    Node_3 --> Node_4
    Node_4["4: NodeType.ENDIF - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.IF - state == States.LOCKED"]
    Node_5 --> Node_6
    Node_5 --> Node_9
    Node_6["6: NodeType.EXPRESSION - winningOutcome = _winningOutcome"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - _incrementState()"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - LogWinnerKnown(winningOutcome)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.ENDIF - "]
```

### Source Mapping
Declared in: `contracts/RCMarket.sol` on lines **464** to **476**

```solidity
    function setWinner(uint256 _winningOutcome) internal {
        if (state == States.OPEN) {
            // change the locking time to allow lockMarket to lock
            marketLockingTime = SafeCast.toUint32(block.timestamp);
            lockMarket();
        }
        if (state == States.LOCKED) {
            // get the winner. This will revert if answer is not resolved.
            winningOutcome = _winningOutcome;
            _incrementState();
            emit LogWinnerKnown(winningOutcome);
        }
    }

```
