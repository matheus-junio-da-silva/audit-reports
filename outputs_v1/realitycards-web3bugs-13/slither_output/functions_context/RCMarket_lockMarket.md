# Context: RCMarket.lockMarket

**Contract:** `RCMarket` (Inherits: IRCMarket, NativeMetaTransaction, Initializable)
**Signature:** `lockMarket()`
**Method Selector ID:** `0x9925279a`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** longestOwner, marketLockingTime, numberOfCards, orderbook
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(marketLockingTime <= block.timestamp,Market has not finished)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IRCOrderbook.HIGH_LEVEL_CALL, dest:orderbook(IRCOrderbook), function:closeMarket, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - _checkState(States.OPEN)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(marketLockingTime <= block.timestamp,Market has not finished)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.IF - collectRentAllCards()"]
    Node_3 --> Node_4
    Node_3 --> Node_14
    Node_4["4: NodeType.EXPRESSION - orderbook.closeMarket()"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - _incrementState()"]
    Node_5 --> Node_8
    Node_6["6: NodeType.STARTLOOP - "]
    Node_6 --> Node_9
    Node_7["7: NodeType.ENDLOOP - "]
    Node_7 --> Node_13
    Node_8["8: NodeType.VARIABLE - "]
    Node_8 --> Node_6
    Node_9["9: NodeType.IFLOOP - i < numberOfCards"]
    Node_9 --> Node_10
    Node_9 --> Node_7
    Node_10["10: NodeType.EXPRESSION - _transferCard(ownerOf(i),address(this),i)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - LogLongestOwner(i,longestOwner(i))"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - i ++"]
    Node_12 --> Node_9
    Node_13["13: NodeType.EXPRESSION - LogContractLocked(true)"]
    Node_13 --> Node_14
    Node_14["14: NodeType.ENDIF - "]
```

### Source Mapping
Declared in: `contracts/RCMarket.sol` on lines **441** to **460**

```solidity
    function lockMarket() public {
        _checkState(States.OPEN);
        require(
            marketLockingTime <= block.timestamp,
            "Market has not finished"
        );
        // do a final rent collection before the contract is locked down

        if (collectRentAllCards()) {
            orderbook.closeMarket();
            _incrementState();

            for (uint256 i; i < numberOfCards; i++) {
                // bring the cards back to the market so the winners get the satisfcation of claiming them
                _transferCard(ownerOf(i), address(this), i);
                emit LogLongestOwner(i, longestOwner[i]);
            }
            emit LogContractLocked(true);
        }
    }

```
