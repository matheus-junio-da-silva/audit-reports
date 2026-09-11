# Context: RCOrderbook._searchOrderbook

**Contract:** `RCOrderbook` (Inherits: IRCOrderbook, NativeMetaTransaction, Ownable, Context)
**Signature:** `_searchOrderbook(RCOrderbook.Bid,address,uint256,uint256) returns (RCOrderbook.Bid, uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** index, market, maxSearchIterations, user
- **Writes:** user

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(i < maxSearchIterations,Position in orderbook not found)`

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
    Node_1["1: NodeType.VARIABLE - _minIncrease = market(_market).minimumPriceIncreasePercent"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - _nextUser = user(_prevUser.next)(index(_prevUser.next)(_market)(_card))"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - _requiredPrice = (_nextUser.price * (_minIncrease + (100))) / (100)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - i = 0"]
    Node_4 --> Node_5
    Node_5["5: NodeType.STARTLOOP - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.IFLOOP - (_price != _prevUser.price || _price <= _nextUser.price) && _price < _requiredPrice && i < maxSearchIterations"]
    Node_6 --> Node_7
    Node_6 --> Node_11
    Node_7["7: NodeType.EXPRESSION - _prevUser = _nextUser"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - _nextUser = user(_prevUser.next)(index(_prevUser.next)(_market)(_card))"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - _requiredPrice = (_nextUser.price * (_minIncrease + (100))) / (100)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - i ++"]
    Node_10 --> Node_6
    Node_11["11: NodeType.ENDLOOP - "]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - require(bool,string)(i < maxSearchIterations,Position in orderbook not found)"]
    Node_12 --> Node_13
    Node_13["13: NodeType.IF - _prevUser.price != 0 && _prevUser.price < _price"]
    Node_13 --> Node_14
    Node_13 --> Node_15
    Node_14["14: NodeType.EXPRESSION - _price = _prevUser.price"]
    Node_14 --> Node_15
    Node_15["15: NodeType.ENDIF - "]
    Node_15 --> Node_16
    Node_16["16: NodeType.RETURN - (_prevUser,_price)"]
```

### Source Mapping
Declared in: `contracts/RCOrderbook.sol` on lines **239** to **277**

```solidity
    function _searchOrderbook(
        Bid storage _prevUser,
        address _market,
        uint256 _card,
        uint256 _price
    ) internal view returns (Bid storage, uint256) {
        uint256 _minIncrease = market[_market].minimumPriceIncreasePercent;
        Bid storage _nextUser =
            user[_prevUser.next][index[_prevUser.next][_market][_card]];
        uint256 _requiredPrice =
            (_nextUser.price * (_minIncrease + (100))) / (100);

        uint256 i = 0;
        while (
            // break loop if match price above AND above price below (so if either is false, continue, hence OR )
            // if match previous then must be greater than next to continue
            (_price != _prevUser.price || _price <= _nextUser.price) &&
            // break loop if price x% above below
            _price < _requiredPrice &&
            // break loop if hits max iterations
            i < maxSearchIterations
        ) {
            _prevUser = _nextUser;
            _nextUser = user[_prevUser.next][
                index[_prevUser.next][_market][_card]
            ];
            _requiredPrice = (_nextUser.price * (_minIncrease + (100))) / (100);
            i++;
        }
        require(i < maxSearchIterations, "Position in orderbook not found");

        // if previous price is zero it must be the market and this is a new owner
        // .. then don't reduce their price, we already checked they are 10% higher
        // .. than the previous owner.
        if (_prevUser.price != 0 && _prevUser.price < _price) {
            _price = _prevUser.price;
        }
        return (_prevUser, _price);
    }

```
