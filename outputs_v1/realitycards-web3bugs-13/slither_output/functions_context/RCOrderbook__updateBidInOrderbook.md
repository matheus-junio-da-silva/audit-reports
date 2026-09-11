# Context: RCOrderbook._updateBidInOrderbook

**Contract:** `RCOrderbook` (Inherits: IRCOrderbook, NativeMetaTransaction, Ownable, Context)
**Signature:** `_updateBidInOrderbook(address,address,uint256,uint256,uint256,RCOrderbook.Bid)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** index, nonce, treasury, user
- **Writes:** nonce, user

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IRCTreasury.HIGH_LEVEL_CALL, dest:treasury(IRCTreasury), function:updateRentalRate, arguments:['_oldOwner', '_user', '_oldPrice', 'REF_549', 'block.timestamp']  `
- `IRCTreasury.HIGH_LEVEL_CALL, dest:treasury(IRCTreasury), function:updateRentalRate, arguments:['_user', '_newOwner', '_price', '_newPrice', 'block.timestamp']  `
- `IRCTreasury.HIGH_LEVEL_CALL, dest:treasury(IRCTreasury), function:decreaseBidRate, arguments:['_user', '_price']  `
- `IRCTreasury.HIGH_LEVEL_CALL, dest:treasury(IRCTreasury), function:updateRentalRate, arguments:['_user', '_user', '_price', 'REF_525', 'block.timestamp']  `
- `SafeCast.TMP_1355(uint128) = LIBRARY_CALL, dest:SafeCast, function:SafeCast.toUint128(uint256), arguments:['_price'] `
- `SafeCast.TMP_1357(uint64) = LIBRARY_CALL, dest:SafeCast, function:SafeCast.toUint64(uint256), arguments:['_timeHeldLimit'] `
- `IRCTreasury.HIGH_LEVEL_CALL, dest:treasury(IRCTreasury), function:increaseBidRate, arguments:['_user', 'REF_520']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - _currUser = user(_user)(index(_user)(_market)(_card))"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - user(_currUser.next)(index(_currUser.next)(_market)(_card)).prev = _currUser.prev"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - user(_currUser.prev)(index(_currUser.prev)(_market)(_card)).next = _currUser.next"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - _owner = _currUser.prev == _market"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - (_prevUser,_price) = _searchOrderbook(_prevUser,_market,_card,_price)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - _nextUser = user(_prevUser.next)(index(_prevUser.next)(_market)(_card))"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - (_currUser.price,_price) = (SafeCast.toUint128(_price),uint256(_currUser.price))"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - _currUser.timeHeldLimit = SafeCast.toUint64(_timeHeldLimit)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - _currUser.next = _prevUser.next"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - _currUser.prev = _nextUser.prev"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - _nextUser.prev = _user"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - _prevUser.next = _user"]
    Node_12 --> Node_13
    Node_13["13: NodeType.EXPRESSION - LogAddToOrderbook(_user,_currUser.price,_timeHeldLimit,nonce,_card,_market)"]
    Node_13 --> Node_14
    Node_14["14: NodeType.EXPRESSION - nonce ++"]
    Node_14 --> Node_15
    Node_15["15: NodeType.EXPRESSION - treasury.increaseBidRate(_user,_currUser.price)"]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - treasury.decreaseBidRate(_user,_price)"]
    Node_16 --> Node_17
    Node_17["17: NodeType.IF - _owner && _currUser.prev == _market"]
    Node_17 --> Node_18
    Node_17 --> Node_20
    Node_18["18: NodeType.EXPRESSION - transferCard(_market,_card,_user,_user,_currUser.price)"]
    Node_18 --> Node_19
    Node_19["19: NodeType.EXPRESSION - treasury.updateRentalRate(_user,_user,_price,_currUser.price,block.timestamp)"]
    Node_19 --> Node_32
    Node_20["20: NodeType.IF - _owner && _currUser.prev != _market"]
    Node_20 --> Node_21
    Node_20 --> Node_25
    Node_21["21: NodeType.VARIABLE - _newOwner = user(_market)(index(_market)(_market)(_card)).next"]
    Node_21 --> Node_22
    Node_22["22: NodeType.VARIABLE - _newPrice = user(_newOwner)(index(_newOwner)(_market)(_card)).price"]
    Node_22 --> Node_23
    Node_23["23: NodeType.EXPRESSION - treasury.updateRentalRate(_user,_newOwner,_price,_newPrice,block.timestamp)"]
    Node_23 --> Node_24
    Node_24["24: NodeType.EXPRESSION - transferCard(_market,_card,_user,_newOwner,_newPrice)"]
    Node_24 --> Node_31
    Node_25["25: NodeType.IF - ! _owner && _currUser.prev == _market"]
    Node_25 --> Node_26
    Node_25 --> Node_30
    Node_26["26: NodeType.VARIABLE - _oldOwner = _currUser.next"]
    Node_26 --> Node_27
    Node_27["27: NodeType.VARIABLE - _oldPrice = user(_oldOwner)(index(_oldOwner)(_market)(_card)).price"]
    Node_27 --> Node_28
    Node_28["28: NodeType.EXPRESSION - treasury.updateRentalRate(_oldOwner,_user,_oldPrice,_currUser.price,block.timestamp)"]
    Node_28 --> Node_29
    Node_29["29: NodeType.EXPRESSION - transferCard(_market,_card,_oldOwner,_user,_currUser.price)"]
    Node_29 --> Node_30
    Node_30["30: NodeType.ENDIF - "]
    Node_30 --> Node_31
    Node_31["31: NodeType.ENDIF - "]
    Node_31 --> Node_32
    Node_32["32: NodeType.ENDIF - "]
```

### Source Mapping
Declared in: `contracts/RCOrderbook.sol` on lines **343** to **434**

```solidity
    function _updateBidInOrderbook(
        address _user,
        address _market,
        uint256 _card,
        uint256 _price,
        uint256 _timeHeldLimit,
        Bid storage _prevUser
    ) internal {
        // TODO no need to unlink and relink if bid doesn't change position in orderbook
        // unlink current bid
        Bid storage _currUser = user[_user][index[_user][_market][_card]];
        user[_currUser.next][index[_currUser.next][_market][_card]]
            .prev = _currUser.prev;
        user[_currUser.prev][index[_currUser.prev][_market][_card]]
            .next = _currUser.next;
        bool _owner = _currUser.prev == _market;

        // find new position
        (_prevUser, _price) = _searchOrderbook(
            _prevUser,
            _market,
            _card,
            _price
        );
        Bid storage _nextUser =
            user[_prevUser.next][index[_prevUser.next][_market][_card]];

        // update price, save old price for rental rate adjustment later
        (_currUser.price, _price) = (
            SafeCast.toUint128(_price),
            uint256(_currUser.price)
        );
        _currUser.timeHeldLimit = SafeCast.toUint64(_timeHeldLimit);

        // relink bid
        _currUser.next = _prevUser.next;
        _currUser.prev = _nextUser.prev;
        _nextUser.prev = _user; // next record update prev link
        _prevUser.next = _user; // prev record update next link

        emit LogAddToOrderbook(
            _user,
            _currUser.price,
            _timeHeldLimit,
            nonce,
            _card,
            _market
        );
        nonce++;

        // update treasury values and transfer ownership if required
        treasury.increaseBidRate(_user, _currUser.price);
        treasury.decreaseBidRate(_user, _price);
        if (_owner && _currUser.prev == _market) {
            // if owner before and after, update the price difference
            transferCard(_market, _card, _user, _user, _currUser.price);
            treasury.updateRentalRate(
                _user,
                _user,
                _price,
                _currUser.price,
                block.timestamp
            );
        } else if (_owner && _currUser.prev != _market) {
            // if owner before and not after, remove the old price
            address _newOwner =
                user[_market][index[_market][_market][_card]].next;
            uint256 _newPrice =
                user[_newOwner][index[_newOwner][_market][_card]].price;
            treasury.updateRentalRate(
                _user,
                _newOwner,
                _price,
                _newPrice,
                block.timestamp
            );
            transferCard(_market, _card, _user, _newOwner, _newPrice);
        } else if (!_owner && _currUser.prev == _market) {
            // if not owner before but is owner after, add new price
            address _oldOwner = _currUser.next;
            uint256 _oldPrice =
                user[_oldOwner][index[_oldOwner][_market][_card]].price;
            treasury.updateRentalRate(
                _oldOwner,
                _user,
                _oldPrice,
                _currUser.price,
                block.timestamp
            );
            transferCard(_market, _card, _oldOwner, _user, _currUser.price);
        }
    }

```
