# Context: RCOrderbook.addMarket

**Contract:** `RCOrderbook` (Inherits: IRCOrderbook, NativeMetaTransaction, Ownable, Context)
**Signature:** `addMarket(address,uint256,uint256)`
**Method Selector ID:** `0xc0ffb809`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** factoryAddress, market, treasury, user
- **Writes:** index, isMarket, market, user

### Assertion Checks & Business Requirements
- require/assert: `require(bool)(msgSender() == factoryAddress)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeCast.TMP_1295(uint64) = LIBRARY_CALL, dest:SafeCast, function:SafeCast.toUint64(uint256), arguments:['_cardCount'] `
- `SafeCast.TMP_1299(uint64) = LIBRARY_CALL, dest:SafeCast, function:SafeCast.toUint64(uint256), arguments:['TMP_1298'] `
- `SafeCast.TMP_1296(uint64) = LIBRARY_CALL, dest:SafeCast, function:SafeCast.toUint64(uint256), arguments:['_minIncrease'] `
- `IRCTreasury.TMP_1297(uint256) = HIGH_LEVEL_CALL, dest:treasury(IRCTreasury), function:minRentalDayDivisor, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool)(msgSender() == factoryAddress)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - isMarket(_market) = true"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - market(_market).tokenCount = SafeCast.toUint64(_cardCount)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - market(_market).minimumPriceIncreasePercent = SafeCast.toUint64(_minIncrease)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - market(_market).minimumRentalDuration = SafeCast.toUint64(86400 / treasury.minRentalDayDivisor())"]
    Node_5 --> Node_8
    Node_6["6: NodeType.STARTLOOP - "]
    Node_6 --> Node_9
    Node_7["7: NodeType.ENDLOOP - "]
    Node_8["8: NodeType.VARIABLE - "]
    Node_8 --> Node_6
    Node_9["9: NodeType.IFLOOP - i < _cardCount"]
    Node_9 --> Node_10
    Node_9 --> Node_7
    Node_10["10: NodeType.VARIABLE - "]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - _newBid.market = _market"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - _newBid.token = i"]
    Node_12 --> Node_13
    Node_13["13: NodeType.EXPRESSION - _newBid.prev = _market"]
    Node_13 --> Node_14
    Node_14["14: NodeType.EXPRESSION - _newBid.next = _market"]
    Node_14 --> Node_15
    Node_15["15: NodeType.EXPRESSION - _newBid.price = 0"]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - _newBid.timeHeldLimit = type()(uint64).max"]
    Node_16 --> Node_17
    Node_17["17: NodeType.EXPRESSION - index(_market)(_market)(i) = user(_market).length"]
    Node_17 --> Node_18
    Node_18["18: NodeType.EXPRESSION - user(_market).push(_newBid)"]
    Node_18 --> Node_19
    Node_19["19: NodeType.EXPRESSION - i ++"]
    Node_19 --> Node_9
```

### Source Mapping
Declared in: `contracts/RCOrderbook.sol` on lines **152** to **178**

```solidity
    function addMarket(
        address _market,
        uint256 _cardCount,
        uint256 _minIncrease
    ) external override {
        require(msgSender() == factoryAddress);
        isMarket[_market] = true;
        market[_market].tokenCount = SafeCast.toUint64(_cardCount);
        market[_market].minimumPriceIncreasePercent = SafeCast.toUint64(
            _minIncrease
        );
        market[_market].minimumRentalDuration = SafeCast.toUint64(
            1 days / treasury.minRentalDayDivisor()
        );
        for (uint64 i; i < _cardCount; i++) {
            // create new record for each card that becomes the head&tail of the linked list
            Bid memory _newBid;
            _newBid.market = _market;
            _newBid.token = i;
            _newBid.prev = _market;
            _newBid.next = _market;
            _newBid.price = 0;
            _newBid.timeHeldLimit = type(uint64).max;
            index[_market][_market][i] = user[_market].length;
            user[_market].push(_newBid);
        }
    }

```
