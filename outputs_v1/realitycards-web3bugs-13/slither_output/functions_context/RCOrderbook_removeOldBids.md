# Context: RCOrderbook.removeOldBids

**Contract:** `RCOrderbook` (Inherits: IRCOrderbook, NativeMetaTransaction, Ownable, Context)
**Signature:** `removeOldBids(address)`
**Method Selector ID:** `0xbeb724c9`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** closedMarkets, index, market, maxDeletions, treasury, user, userClosedMarketIndex
- **Writes:** index, user, userClosedMarketIndex

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IRCTreasury.HIGH_LEVEL_CALL, dest:treasury(IRCTreasury), function:decreaseBidRate, arguments:['_user', '_price']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - "]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.STARTLOOP - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.IFLOOP - userClosedMarketIndex(_user) < closedMarkets.length && _loopCounter + _cardCount < maxDeletions"]
    Node_5 --> Node_6
    Node_5 --> Node_25
    Node_6["6: NodeType.EXPRESSION - _market = closedMarkets(userClosedMarketIndex(_user))"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - _cardCount = market(_market).tokenCount"]
    Node_7 --> Node_10
    Node_8["8: NodeType.STARTLOOP - "]
    Node_8 --> Node_11
    Node_9["9: NodeType.ENDLOOP - "]
    Node_9 --> Node_24
    Node_10["10: NodeType.VARIABLE - i = market(_market).tokenCount"]
    Node_10 --> Node_8
    Node_11["11: NodeType.IFLOOP - i != 0"]
    Node_11 --> Node_12
    Node_11 --> Node_9
    Node_12["12: NodeType.EXPRESSION - i --"]
    Node_12 --> Node_13
    Node_13["13: NodeType.IF - bidExists(_user,_market,i)"]
    Node_13 --> Node_14
    Node_13 --> Node_23
    Node_14["14: NodeType.VARIABLE - _price = user(_user)(index(_user)(_market)(i)).price"]
    Node_14 --> Node_15
    Node_15["15: NodeType.EXPRESSION - treasury.decreaseBidRate(_user,_price)"]
    Node_15 --> Node_16
    Node_16["16: NodeType.VARIABLE - _tempPrev = user(_user)(index(_user)(_market)(i)).prev"]
    Node_16 --> Node_17
    Node_17["17: NodeType.VARIABLE - _tempNext = user(_user)(index(_user)(_market)(i)).next"]
    Node_17 --> Node_18
    Node_18["18: NodeType.EXPRESSION - user(_tempNext)(index(_tempNext)(_market)(i)).prev = _tempPrev"]
    Node_18 --> Node_19
    Node_19["19: NodeType.EXPRESSION - user(_tempPrev)(index(_tempPrev)(_market)(i)).next = _tempNext"]
    Node_19 --> Node_20
    Node_20["20: NodeType.EXPRESSION - user(_user).pop()"]
    Node_20 --> Node_21
    Node_21["21: NodeType.EXPRESSION - index(_user)(_market)(i) = 0"]
    Node_21 --> Node_22
    Node_22["22: NodeType.EXPRESSION - _loopCounter ++"]
    Node_22 --> Node_23
    Node_23["23: NodeType.ENDIF - "]
    Node_23 --> Node_11
    Node_24["24: NodeType.EXPRESSION - userClosedMarketIndex(_user) ++"]
    Node_24 --> Node_5
    Node_25["25: NodeType.ENDLOOP - "]
```

### Source Mapping
Declared in: `contracts/RCOrderbook.sol` on lines **674** to **713**

```solidity
    function removeOldBids(address _user) external override {
        address _market;
        uint256 _cardCount;
        uint256 _loopCounter;
        while (
            userClosedMarketIndex[_user] < closedMarkets.length &&
            _loopCounter + _cardCount < maxDeletions
        ) {
            _market = closedMarkets[userClosedMarketIndex[_user]];
            _cardCount = market[_market].tokenCount;
            for (uint256 i = market[_market].tokenCount; i != 0; ) {
                i--;
                if (bidExists(_user, _market, i)) {
                    // reduce bidRate
                    uint256 _price =
                        user[_user][index[_user][_market][i]].price;
                    treasury.decreaseBidRate(_user, _price);

                    // preserve linked list
                    address _tempPrev =
                        user[_user][index[_user][_market][i]].prev;
                    address _tempNext =
                        user[_user][index[_user][_market][i]].next;

                    user[_tempNext][index[_tempNext][_market][i]]
                        .prev = _tempPrev;
                    user[_tempPrev][index[_tempPrev][_market][i]]
                        .next = _tempNext;

                    // delete bid
                    user[_user].pop();
                    index[_user][_market][i] = 0;

                    // count deletions
                    _loopCounter++;
                }
            }
            userClosedMarketIndex[_user]++;
        }
    }

```
