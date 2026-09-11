# Context: RCMarket.updateTimeHeldLimit

**Contract:** `RCMarket` (Inherits: IRCMarket, NativeMetaTransaction, Initializable)
**Signature:** `updateTimeHeldLimit(uint256,uint256)`
**Method Selector ID:** `0x86620850`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** orderbook
- **Writes:** cardTimeLimit

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IRCOrderbook.HIGH_LEVEL_CALL, dest:orderbook(IRCOrderbook), function:setTimeHeldlimit, arguments:['_user', '_card', '_timeHeldLimit']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - _checkState(States.OPEN)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - _user = msgSender()"]
    Node_2 --> Node_3
    Node_3["3: NodeType.IF - _collectRent(_card)"]
    Node_3 --> Node_4
    Node_3 --> Node_10
    Node_4["4: NodeType.EXPRESSION - _timeHeldLimit = _checkTimeHeldLimit(_timeHeldLimit)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - orderbook.setTimeHeldlimit(_user,_card,_timeHeldLimit)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.IF - ownerOf(_card) == _user"]
    Node_6 --> Node_7
    Node_6 --> Node_8
    Node_7["7: NodeType.EXPRESSION - cardTimeLimit(_card) = _timeHeldLimit"]
    Node_7 --> Node_8
    Node_8["8: NodeType.ENDIF - "]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - LogUpdateTimeHeldLimit(_user,_timeHeldLimit,_card)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.ENDIF - "]
```

### Source Mapping
Declared in: `contracts/RCMarket.sol` on lines **753** to **770**

```solidity
    function updateTimeHeldLimit(uint256 _timeHeldLimit, uint256 _card)
        external
    {
        _checkState(States.OPEN);
        address _user = msgSender();

        if (_collectRent(_card)) {
            _timeHeldLimit = _checkTimeHeldLimit(_timeHeldLimit);

            orderbook.setTimeHeldlimit(_user, _card, _timeHeldLimit);

            if (ownerOf(_card) == _user) {
                cardTimeLimit[_card] = _timeHeldLimit;
            }

            emit LogUpdateTimeHeldLimit(_user, _timeHeldLimit, _card);
        }
    }

```
