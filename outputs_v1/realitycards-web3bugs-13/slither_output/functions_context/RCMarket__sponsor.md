# Context: RCMarket._sponsor

**Contract:** `RCMarket` (Inherits: IRCMarket, NativeMetaTransaction, Initializable)
**Signature:** `_sponsor(address,uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** numberOfCards, rentCollectedPerCard, rentCollectedPerUser, totalRentCollected, treasury
- **Writes:** rentCollectedPerCard, rentCollectedPerUser, totalRentCollected

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_amount > 0,Must send something)`
- require/assert: `require(bool)(treasury.sponsor(_sponsorAddress,_amount))`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `TMP_1140(None) = SOLIDITY_CALL require(bool,string)(TMP_1139,Must send something)`
- `IRCTreasury.TMP_1141(bool) = HIGH_LEVEL_CALL, dest:treasury(IRCTreasury), function:sponsor, arguments:['_sponsorAddress', '_amount']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - _checkNotState(States.LOCKED)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - _checkNotState(States.WITHDRAW)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - require(bool,string)(_amount > 0,Must send something)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - require(bool)(treasury.sponsor(_sponsorAddress,_amount))"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - totalRentCollected = totalRentCollected + _amount"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - rentCollectedPerUser(_sponsorAddress) = rentCollectedPerUser(_sponsorAddress) + _amount"]
    Node_6 --> Node_9
    Node_7["7: NodeType.STARTLOOP - "]
    Node_7 --> Node_10
    Node_8["8: NodeType.ENDLOOP - "]
    Node_8 --> Node_13
    Node_9["9: NodeType.VARIABLE - i = 0"]
    Node_9 --> Node_7
    Node_10["10: NodeType.IFLOOP - i < numberOfCards"]
    Node_10 --> Node_11
    Node_10 --> Node_8
    Node_11["11: NodeType.EXPRESSION - rentCollectedPerCard(i) = rentCollectedPerCard(i) + (_amount / numberOfCards)"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - i ++"]
    Node_12 --> Node_10
    Node_13["13: NodeType.EXPRESSION - LogSponsor(_sponsorAddress,_amount)"]
```

### Source Mapping
Declared in: `contracts/RCMarket.sol` on lines **825** to **843**

```solidity
    function _sponsor(address _sponsorAddress, uint256 _amount) internal {
        _checkNotState(States.LOCKED);
        _checkNotState(States.WITHDRAW);
        require(_amount > 0, "Must send something");
        // send tokens to the Treasury
        require(treasury.sponsor(_sponsorAddress, _amount));
        totalRentCollected = totalRentCollected + _amount;
        // just so user can get it back if invalid outcome
        rentCollectedPerUser[_sponsorAddress] =
            rentCollectedPerUser[_sponsorAddress] +
            _amount;
        // allocate equally to each card, in case card specific affiliates
        for (uint256 i = 0; i < numberOfCards; i++) {
            rentCollectedPerCard[i] =
                rentCollectedPerCard[i] +
                (_amount / numberOfCards);
        }
        emit LogSponsor(_sponsorAddress, _amount);
    }

```
