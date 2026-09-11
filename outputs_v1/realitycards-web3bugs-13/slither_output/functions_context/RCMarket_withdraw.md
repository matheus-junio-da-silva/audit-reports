# Context: RCMarket.withdraw

**Contract:** `RCMarket` (Inherits: IRCMarket, NativeMetaTransaction, Initializable)
**Signature:** `withdraw()`
**Method Selector ID:** `0x3ccfd60b`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** totalTimeHeld, userAlreadyWithdrawn, winningOutcome
- **Writes:** userAlreadyWithdrawn

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(! userAlreadyWithdrawn[msgSender()],Already withdrawn)`

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
    Node_1["1: NodeType.EXPRESSION - _checkState(States.WITHDRAW)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(! userAlreadyWithdrawn(msgSender()),Already withdrawn)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - userAlreadyWithdrawn(msgSender()) = true"]
    Node_3 --> Node_4
    Node_4["4: NodeType.IF - totalTimeHeld(winningOutcome) > 0"]
    Node_4 --> Node_5
    Node_4 --> Node_6
    Node_5["5: NodeType.EXPRESSION - _payoutWinnings()"]
    Node_5 --> Node_7
    Node_6["6: NodeType.EXPRESSION - _returnRent()"]
    Node_6 --> Node_7
    Node_7["7: NodeType.ENDIF - "]
```

### Source Mapping
Declared in: `contracts/RCMarket.sol` on lines **479** to **488**

```solidity
    function withdraw() external {
        _checkState(States.WITHDRAW);
        require(!userAlreadyWithdrawn[msgSender()], "Already withdrawn");
        userAlreadyWithdrawn[msgSender()] = true;
        if (totalTimeHeld[winningOutcome] > 0) {
            _payoutWinnings();
        } else {
            _returnRent();
        }
    }

```
