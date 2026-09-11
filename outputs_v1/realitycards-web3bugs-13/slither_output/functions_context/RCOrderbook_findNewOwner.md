# Context: RCOrderbook.findNewOwner

**Contract:** `RCOrderbook` (Inherits: IRCOrderbook, NativeMetaTransaction, Ownable, Context)
**Signature:** `findNewOwner(uint256,uint256) returns (address)`
**Method Selector ID:** `0xfefa6119`
**Visibility:** `external`
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
- **Reads:** index, market, treasury, user
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IRCTreasury.TMP_1401(uint256) = HIGH_LEVEL_CALL, dest:treasury(IRCTreasury), function:foreclosureTimeUser, arguments:['REF_683', '_newPrice', '_timeOwnershipChanged']  `
- `IRCTreasury.HIGH_LEVEL_CALL, dest:treasury(IRCTreasury), function:updateRentalRate, arguments:['_oldOwner', '_newOwner', '_oldPrice', '_newPrice', '_timeOwnershipChanged']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_14
    Node_1["1: NodeType.VARIABLE - _market = msgSender()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - _head = user(_market)(index(_market)(_market)(_card))"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - _oldOwner = _head.next"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - _oldPrice = user(_oldOwner)(index(_oldOwner)(_market)(_card)).price"]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - minimumTimeToOwnTo = _timeOwnershipChanged + market(_market).minimumRentalDuration"]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.STARTLOOP - "]
    Node_7 --> Node_9
    Node_8["8: NodeType.IFLOOP - treasury.foreclosureTimeUser(_head.next,_newPrice,_timeOwnershipChanged) < minimumTimeToOwnTo"]
    Node_8 --> Node_9
    Node_8 --> Node_10
    Node_9["9: NodeType.EXPRESSION - _newPrice = _removeBidFromOrderbookIgnoreOwner(_head.next,_card)"]
    Node_9 --> Node_8
    Node_10["10: NodeType.ENDLOOP - "]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - _newOwner = user(_market)(index(_market)(_market)(_card)).next"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - treasury.updateRentalRate(_oldOwner,_newOwner,_oldPrice,_newPrice,_timeOwnershipChanged)"]
    Node_12 --> Node_13
    Node_13["13: NodeType.EXPRESSION - transferCard(_market,_card,_oldOwner,_newOwner,_newPrice)"]
    Node_13 --> Node_15
    Node_14["14: NodeType.EXPRESSION - onlyMarkets()"]
    Node_14 --> Node_1
    Node_15["15: NodeType.RETURN - _newOwner"]
```

### Source Mapping
Declared in: `contracts/RCOrderbook.sol` on lines **532** to **570**

```solidity
    function findNewOwner(uint256 _card, uint256 _timeOwnershipChanged)
        external
        override
        onlyMarkets
        returns (address _newOwner)
    {
        address _market = msgSender();
        // the market is the head of the list, the next bid is therefore the owner
        Bid storage _head = user[_market][index[_market][_market][_card]];
        address _oldOwner = _head.next;
        uint256 _oldPrice =
            user[_oldOwner][index[_oldOwner][_market][_card]].price;
        uint256 minimumTimeToOwnTo =
            _timeOwnershipChanged + market[_market].minimumRentalDuration;
        uint256 _newPrice;

        // delete current owner
        do {
            _newPrice = _removeBidFromOrderbookIgnoreOwner(_head.next, _card);
            // delete next bid if foreclosed
        } while (
            treasury.foreclosureTimeUser(
                _head.next,
                _newPrice,
                _timeOwnershipChanged
            ) < minimumTimeToOwnTo
        );

        // the old owner is dead, long live the new owner
        _newOwner = user[_market][index[_market][_market][_card]].next;
        treasury.updateRentalRate(
            _oldOwner,
            _newOwner,
            _oldPrice,
            _newPrice,
            _timeOwnershipChanged
        );
        transferCard(_market, _card, _oldOwner, _newOwner, _newPrice);
    }

```
