# Context: RCMarket.exit

**Contract:** `RCMarket` (Inherits: IRCMarket, NativeMetaTransaction, Initializable)
**Signature:** `exit(uint256)`
**Method Selector ID:** `0x7f8661a1`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** orderbook
- **Writes:** exitedTimestamp

### Assertion Checks & Business Requirements
- require/assert: `assert(bool)(! orderbook.bidExists(_msgSender,address(this),_card))`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IRCOrderbook.HIGH_LEVEL_CALL, dest:orderbook(IRCOrderbook), function:removeBidFromOrderbook, arguments:['_msgSender', '_card']  `
- `IRCOrderbook.TMP_1131(bool) = HIGH_LEVEL_CALL, dest:orderbook(IRCOrderbook), function:bidExists, arguments:['_msgSender', 'TMP_1130', '_card']  `
- `IRCOrderbook.TMP_1125(address) = HIGH_LEVEL_CALL, dest:orderbook(IRCOrderbook), function:findNewOwner, arguments:['_card', 'block.timestamp']  `
- `IRCOrderbook.TMP_1127(bool) = HIGH_LEVEL_CALL, dest:orderbook(IRCOrderbook), function:bidExists, arguments:['_msgSender', 'TMP_1126', '_card']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - _checkState(States.OPEN)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - _msgSender = msgSender()"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - exitedTimestamp(_msgSender) = block.timestamp"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - _collectRent(_card)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.IF - ownerOf(_card) == _msgSender"]
    Node_5 --> Node_6
    Node_5 --> Node_8
    Node_6["6: NodeType.EXPRESSION - orderbook.findNewOwner(_card,block.timestamp)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - assert(bool)(! orderbook.bidExists(_msgSender,address(this),_card))"]
    Node_7 --> Node_11
    Node_8["8: NodeType.IF - orderbook.bidExists(_msgSender,address(this),_card)"]
    Node_8 --> Node_9
    Node_8 --> Node_10
    Node_9["9: NodeType.EXPRESSION - orderbook.removeBidFromOrderbook(_msgSender,_card)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.ENDIF - "]
    Node_10 --> Node_11
    Node_11["11: NodeType.ENDIF - "]
```

### Source Mapping
Declared in: `contracts/RCMarket.sol` on lines **784** to **804**

```solidity
    function exit(uint256 _card) public override {
        _checkState(States.OPEN);
        address _msgSender = msgSender();

        // block frontrunning attack
        exitedTimestamp[_msgSender] = block.timestamp;

        // collectRent first
        _collectRent(_card);

        if (ownerOf(_card) == _msgSender) {
            // if current owner, find a new one
            orderbook.findNewOwner(_card, block.timestamp);
            assert(!orderbook.bidExists(_msgSender, address(this), _card));
        } else {
            // if not owner, just delete from orderbook
            if (orderbook.bidExists(_msgSender, address(this), _card)) {
                orderbook.removeBidFromOrderbook(_msgSender, _card);
            }
        }
    }

```
