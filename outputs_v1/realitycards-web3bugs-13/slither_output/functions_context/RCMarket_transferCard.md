# Context: RCMarket.transferCard

**Contract:** `RCMarket` (Inherits: IRCMarket, NativeMetaTransaction, Initializable)
**Signature:** `transferCard(address,address,uint256,uint256,uint256)`
**Method Selector ID:** `0x060982d4`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** orderbook
- **Writes:** cardPrice, cardTimeLimit

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(msgSender() == address(orderbook),Not orderbook)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(msgSender() == address(orderbook),Not orderbook)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - _checkState(States.OPEN)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.IF - _to != _from"]
    Node_3 --> Node_4
    Node_3 --> Node_5
    Node_4["4: NodeType.EXPRESSION - _transferCard(_from,_to,_cardId)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.ENDIF - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - cardTimeLimit(_cardId) = _timeLimit"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - cardPrice(_cardId) = _price"]
```

### Source Mapping
Declared in: `contracts/RCMarket.sol` on lines **373** to **387**

```solidity
    function transferCard(
        address _from,
        address _to,
        uint256 _cardId,
        uint256 _price,
        uint256 _timeLimit
    ) external override {
        require(msgSender() == address(orderbook), "Not orderbook");
        _checkState(States.OPEN);
        if (_to != _from) {
            _transferCard(_from, _to, _cardId);
        }
        cardTimeLimit[_cardId] = _timeLimit;
        cardPrice[_cardId] = _price;
    }

```
