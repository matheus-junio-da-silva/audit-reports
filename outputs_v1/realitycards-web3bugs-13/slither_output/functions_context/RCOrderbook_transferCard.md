# Context: RCOrderbook.transferCard

**Contract:** `RCOrderbook` (Inherits: IRCOrderbook, NativeMetaTransaction, Ownable, Context)
**Signature:** `transferCard(address,uint256,address,address,uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** index, user
- **Writes:** ownerOf

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IRCMarket.HIGH_LEVEL_CALL, dest:_rcmarket(IRCMarket), function:transferCard, arguments:['_oldOwner', '_newOwner', '_card', '_price', '_timeLimit']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - ownerOf(_market)(_card) = _newOwner"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - _timeLimit = user(_newOwner)(index(_newOwner)(_market)(_card)).timeHeldLimit"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - _rcmarket = IRCMarket(_market)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - _rcmarket.transferCard(_oldOwner,_newOwner,_card,_price,_timeLimit)"]
```

### Source Mapping
Declared in: `contracts/RCOrderbook.sol` on lines **859** to **871**

```solidity
    function transferCard(
        address _market,
        uint256 _card,
        address _oldOwner,
        address _newOwner,
        uint256 _price
    ) internal {
        ownerOf[_market][_card] = _newOwner;
        uint256 _timeLimit =
            user[_newOwner][index[_newOwner][_market][_card]].timeHeldLimit;
        IRCMarket _rcmarket = IRCMarket(_market);
        _rcmarket.transferCard(_oldOwner, _newOwner, _card, _price, _timeLimit);
    }

```
