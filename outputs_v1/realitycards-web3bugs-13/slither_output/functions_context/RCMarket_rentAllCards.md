# Context: RCMarket.rentAllCards

**Contract:** `RCMarket` (Inherits: IRCMarket, NativeMetaTransaction, Initializable)
**Signature:** `rentAllCards(uint256)`
**Method Selector ID:** `0xfd7b7711`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** MIN_RENTAL_VALUE, cardPrice, minimumPriceIncreasePercent, numberOfCards
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_actualSumOfPrices <= _maxSumOfPrices,Prices too high)`

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
    Node_1["1: NodeType.VARIABLE - "]
    Node_1 --> Node_4
    Node_2["2: NodeType.STARTLOOP - "]
    Node_2 --> Node_5
    Node_3["3: NodeType.ENDLOOP - "]
    Node_3 --> Node_8
    Node_4["4: NodeType.VARIABLE - i = 0"]
    Node_4 --> Node_2
    Node_5["5: NodeType.IFLOOP - i < numberOfCards"]
    Node_5 --> Node_6
    Node_5 --> Node_3
    Node_6["6: NodeType.EXPRESSION - _actualSumOfPrices = _actualSumOfPrices + (cardPrice(i))"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - i ++"]
    Node_7 --> Node_5
    Node_8["8: NodeType.EXPRESSION - require(bool,string)(_actualSumOfPrices <= _maxSumOfPrices,Prices too high)"]
    Node_8 --> Node_11
    Node_9["9: NodeType.STARTLOOP - "]
    Node_9 --> Node_12
    Node_10["10: NodeType.ENDLOOP - "]
    Node_11["11: NodeType.VARIABLE - i_scope_0 = 0"]
    Node_11 --> Node_9
    Node_12["12: NodeType.IFLOOP - i_scope_0 < numberOfCards"]
    Node_12 --> Node_13
    Node_12 --> Node_10
    Node_13["13: NodeType.IF - ownerOf(i_scope_0) != msgSender()"]
    Node_13 --> Node_14
    Node_13 --> Node_20
    Node_14["14: NodeType.VARIABLE - "]
    Node_14 --> Node_15
    Node_15["15: NodeType.IF - cardPrice(i_scope_0) > 0"]
    Node_15 --> Node_16
    Node_15 --> Node_17
    Node_16["16: NodeType.EXPRESSION - _newPrice = (cardPrice(i_scope_0) * (minimumPriceIncreasePercent + 100)) / 100"]
    Node_16 --> Node_18
    Node_17["17: NodeType.EXPRESSION - _newPrice = MIN_RENTAL_VALUE"]
    Node_17 --> Node_18
    Node_18["18: NodeType.ENDIF - "]
    Node_18 --> Node_19
    Node_19["19: NodeType.EXPRESSION - newRental(_newPrice,0,address(0),i_scope_0)"]
    Node_19 --> Node_20
    Node_20["20: NodeType.ENDIF - "]
    Node_20 --> Node_21
    Node_21["21: NodeType.EXPRESSION - i_scope_0 ++"]
    Node_21 --> Node_12
```

### Source Mapping
Declared in: `contracts/RCMarket.sol` on lines **637** to **658**

```solidity
    function rentAllCards(uint256 _maxSumOfPrices) external {
        // check that not being front run
        uint256 _actualSumOfPrices;
        for (uint256 i = 0; i < numberOfCards; i++) {
            _actualSumOfPrices = _actualSumOfPrices + (cardPrice[i]);
        }
        require(_actualSumOfPrices <= _maxSumOfPrices, "Prices too high");

        for (uint256 i = 0; i < numberOfCards; i++) {
            if (ownerOf(i) != msgSender()) {
                uint256 _newPrice;
                if (cardPrice[i] > 0) {
                    _newPrice =
                        (cardPrice[i] * (minimumPriceIncreasePercent + 100)) /
                        100;
                } else {
                    _newPrice = MIN_RENTAL_VALUE;
                }
                newRental(_newPrice, 0, address(0), i);
            }
        }
    }

```
