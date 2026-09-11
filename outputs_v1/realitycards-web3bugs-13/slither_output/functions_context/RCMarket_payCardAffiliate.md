# Context: RCMarket.payCardAffiliate

**Contract:** `RCMarket` (Inherits: IRCMarket, NativeMetaTransaction, Initializable)
**Signature:** `payCardAffiliate(uint256)`
**Method Selector ID:** `0x0da400cf`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** cardAffiliateAddresses, cardAffiliateCut, cardAffiliatePaid, rentCollectedPerCard
- **Writes:** cardAffiliatePaid

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(! cardAffiliatePaid[_card],Card affiliate already paid)`

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
    Node_1["1: NodeType.EXPRESSION - _checkState(States.WITHDRAW)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(! cardAffiliatePaid(_card),Card affiliate already paid)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - cardAffiliatePaid(_card) = true"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - _cardAffiliatePayment = (rentCollectedPerCard(_card) * cardAffiliateCut) / (1000)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.IF - _cardAffiliatePayment > 0"]
    Node_5 --> Node_6
    Node_5 --> Node_8
    Node_6["6: NodeType.EXPRESSION - _payout(cardAffiliateAddresses(_card),_cardAffiliatePayment)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - LogStakeholderPaid(cardAffiliateAddresses(_card),_cardAffiliatePayment)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.ENDIF - "]
```

### Source Mapping
Declared in: `contracts/RCMarket.sol` on lines **586** to **599**

```solidity
    function payCardAffiliate(uint256 _card) external {
        _checkState(States.WITHDRAW);
        require(!cardAffiliatePaid[_card], "Card affiliate already paid");
        cardAffiliatePaid[_card] = true;
        uint256 _cardAffiliatePayment =
            (rentCollectedPerCard[_card] * cardAffiliateCut) / (1000);
        if (_cardAffiliatePayment > 0) {
            _payout(cardAffiliateAddresses[_card], _cardAffiliatePayment);
            emit LogStakeholderPaid(
                cardAffiliateAddresses[_card],
                _cardAffiliatePayment
            );
        }
    }

```
