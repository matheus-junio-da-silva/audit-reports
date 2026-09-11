# Context: RCOrderbook.removeBidFromOrderbook

**Contract:** `RCOrderbook` (Inherits: IRCOrderbook, NativeMetaTransaction, Ownable, Context)
**Signature:** `removeBidFromOrderbook(address,uint256)`
**Method Selector ID:** `0xc568b024`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyMarkets`
  ```solidity
  modifier onlyMarkets {
          require(isMarket[msgSender()], "Not authorised");
          _;
      }
  ```

### State Variables Interaction
- **Reads:** index, treasury, user
- **Writes:** index, user

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IRCTreasury.HIGH_LEVEL_CALL, dest:treasury(IRCTreasury), function:decreaseBidRate, arguments:['_user', 'REF_557']  `
- `IRCTreasury.HIGH_LEVEL_CALL, dest:treasury(IRCTreasury), function:updateRentalRate, arguments:['_user', 'REF_569', 'REF_570', '_price', 'block.timestamp']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_24
    Node_1["1: NodeType.VARIABLE - _market = msgSender()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - _currUser = user(_user)(index(_user)(_market)(_card))"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - treasury.decreaseBidRate(_user,_currUser.price)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.IF - _currUser.prev == _market"]
    Node_4 --> Node_5
    Node_4 --> Node_8
    Node_5["5: NodeType.VARIABLE - _price = user(_currUser.next)(index(_currUser.next)(_market)(_card)).price"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - transferCard(_market,_card,_user,_currUser.next,_price)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - treasury.updateRentalRate(_user,_currUser.next,_currUser.price,_price,block.timestamp)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.ENDIF - "]
    Node_8 --> Node_9
    Node_9["9: NodeType.VARIABLE - _tempNext = _currUser.next"]
    Node_9 --> Node_10
    Node_10["10: NodeType.VARIABLE - _tempPrev = _currUser.prev"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - user(_tempNext)(index(_tempNext)(_market)(_card)).prev = _tempPrev"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - user(_tempPrev)(index(_tempPrev)(_market)(_card)).next = _tempNext"]
    Node_12 --> Node_13
    Node_13["13: NodeType.VARIABLE - _index = index(_user)(_market)(_card)"]
    Node_13 --> Node_14
    Node_14["14: NodeType.VARIABLE - _lastRecord = user(_user).length - (1)"]
    Node_14 --> Node_15
    Node_15["15: NodeType.IF - _index != _lastRecord"]
    Node_15 --> Node_16
    Node_15 --> Node_17
    Node_16["16: NodeType.EXPRESSION - user(_user)(_index) = user(_user)(_lastRecord)"]
    Node_16 --> Node_17
    Node_17["17: NodeType.ENDIF - "]
    Node_17 --> Node_18
    Node_18["18: NodeType.EXPRESSION - user(_user).pop()"]
    Node_18 --> Node_19
    Node_19["19: NodeType.EXPRESSION - index(_user)(_market)(_card) = 0"]
    Node_19 --> Node_20
    Node_20["20: NodeType.IF - user(_user).length != 0 && _index != _lastRecord"]
    Node_20 --> Node_21
    Node_20 --> Node_22
    Node_21["21: NodeType.EXPRESSION - index(_user)(user(_user)(_index).market)(user(_user)(_index).token) = _index"]
    Node_21 --> Node_22
    Node_22["22: NodeType.ENDIF - "]
    Node_22 --> Node_23
    Node_23["23: NodeType.EXPRESSION - LogRemoveFromOrderbook(_user,_market,_card)"]
    Node_24["24: NodeType.EXPRESSION - onlyMarkets()"]
    Node_24 --> Node_1
```

### Source Mapping
Declared in: `contracts/RCOrderbook.sol` on lines **442** to **489**

```solidity
    function removeBidFromOrderbook(address _user, uint256 _card)
        public
        override
        onlyMarkets
    {
        address _market = msgSender();
        // update rates
        Bid storage _currUser = user[_user][index[_user][_market][_card]];
        treasury.decreaseBidRate(_user, _currUser.price);
        if (_currUser.prev == _market) {
            // user is owner, deal with it
            uint256 _price =
                user[_currUser.next][index[_currUser.next][_market][_card]]
                    .price;
            transferCard(_market, _card, _user, _currUser.next, _price);
            treasury.updateRentalRate(
                _user,
                _currUser.next,
                _currUser.price,
                _price,
                block.timestamp
            );
        }
        // extract from linked list
        address _tempNext = _currUser.next;
        address _tempPrev = _currUser.prev;
        user[_tempNext][index[_tempNext][_market][_card]].prev = _tempPrev;
        user[_tempPrev][index[_tempPrev][_market][_card]].next = _tempNext;

        // overwrite array element
        uint256 _index = index[_user][_market][_card];
        uint256 _lastRecord = user[_user].length - (1);

        // no point overwriting itself
        if (_index != _lastRecord) {
            user[_user][_index] = user[_user][_lastRecord];
        }
        user[_user].pop();

        // update the index to help find the record later
        index[_user][_market][_card] = 0;
        if (user[_user].length != 0 && _index != _lastRecord) {
            index[_user][user[_user][_index].market][
                user[_user][_index].token
            ] = _index;
        }
        emit LogRemoveFromOrderbook(_user, _market, _card);
    }

```
