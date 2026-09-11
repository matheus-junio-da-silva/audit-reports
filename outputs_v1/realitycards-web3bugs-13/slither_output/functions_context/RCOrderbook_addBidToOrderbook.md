# Context: RCOrderbook.addBidToOrderbook

**Contract:** `RCOrderbook` (Inherits: IRCOrderbook, NativeMetaTransaction, Ownable, Context)
**Signature:** `addBidToOrderbook(address,uint256,uint256,uint256,address)`
**Method Selector ID:** `0xf94fe989`
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
- **Reads:** closedMarkets, index, user
- **Writes:** userClosedMarketIndex

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(user[_prevUserAddress][index[_prevUserAddress][_market][_card]].price >= _price,Location too low)`

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
    Node_0 --> Node_15
    Node_1["1: NodeType.EXPRESSION - cleanWastePile()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.IF - user(_user).length == 0 && closedMarkets.length > 0"]
    Node_2 --> Node_3
    Node_2 --> Node_4
    Node_3["3: NodeType.EXPRESSION - userClosedMarketIndex(_user) = closedMarkets.length - 1"]
    Node_3 --> Node_4
    Node_4["4: NodeType.ENDIF - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - _market = msgSender()"]
    Node_5 --> Node_6
    Node_6["6: NodeType.IF - _prevUserAddress == address(0)"]
    Node_6 --> Node_7
    Node_6 --> Node_8
    Node_7["7: NodeType.EXPRESSION - _prevUserAddress = _market"]
    Node_7 --> Node_9
    Node_8["8: NodeType.EXPRESSION - require(bool,string)(user(_prevUserAddress)(index(_prevUserAddress)(_market)(_card)).price >= _price,Location too low)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.ENDIF - "]
    Node_9 --> Node_10
    Node_10["10: NodeType.VARIABLE - _prevUser = user(_prevUserAddress)(index(_prevUserAddress)(_market)(_card))"]
    Node_10 --> Node_11
    Node_11["11: NodeType.IF - bidExists(_user,_market,_card)"]
    Node_11 --> Node_12
    Node_11 --> Node_13
    Node_12["12: NodeType.EXPRESSION - _updateBidInOrderbook(_user,_market,_card,_price,_timeHeldLimit,_prevUser)"]
    Node_12 --> Node_14
    Node_13["13: NodeType.EXPRESSION - _newBidInOrderbook(_user,_market,_card,_price,_timeHeldLimit,_prevUser)"]
    Node_13 --> Node_14
    Node_14["14: NodeType.ENDIF - "]
    Node_15["15: NodeType.EXPRESSION - onlyMarkets()"]
    Node_15 --> Node_1
```

### Source Mapping
Declared in: `contracts/RCOrderbook.sol` on lines **186** to **235**

```solidity
    function addBidToOrderbook(
        address _user,
        uint256 _card,
        uint256 _price,
        uint256 _timeHeldLimit,
        address _prevUserAddress
    ) external override onlyMarkets {
        // each new bid can help clean up some junk
        cleanWastePile();

        if (user[_user].length == 0 && closedMarkets.length > 0) {
            //users first bid, skip already closed markets
            userClosedMarketIndex[_user] = closedMarkets.length - 1;
        }

        address _market = msgSender();
        if (_prevUserAddress == address(0)) {
            _prevUserAddress = _market;
        } else {
            require(
                user[_prevUserAddress][index[_prevUserAddress][_market][_card]]
                    .price >= _price,
                "Location too low"
            );
        }
        Bid storage _prevUser =
            user[_prevUserAddress][index[_prevUserAddress][_market][_card]];

        if (bidExists(_user, _market, _card)) {
            // old bid exists, update it
            _updateBidInOrderbook(
                _user,
                _market,
                _card,
                _price,
                _timeHeldLimit,
                _prevUser
            );
        } else {
            // new bid, add it
            _newBidInOrderbook(
                _user,
                _market,
                _card,
                _price,
                _timeHeldLimit,
                _prevUser
            );
        }
    }

```
