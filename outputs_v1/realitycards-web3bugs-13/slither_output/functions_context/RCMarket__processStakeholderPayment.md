# Context: RCMarket._processStakeholderPayment

**Contract:** `RCMarket` (Inherits: IRCMarket, NativeMetaTransaction, Initializable)
**Signature:** `_processStakeholderPayment(uint256,address)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** totalRentCollected
- **Writes:** None

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
    Node_1["1: NodeType.IF - _cut > 0"]
    Node_1 --> Node_2
    Node_1 --> Node_5
    Node_2["2: NodeType.VARIABLE - _payment = (totalRentCollected * _cut) / (1000)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - _payout(_recipient,_payment)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - LogStakeholderPaid(_recipient,_payment)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.ENDIF - "]
```

### Source Mapping
Declared in: `contracts/RCMarket.sol` on lines **601** to **609**

```solidity
    function _processStakeholderPayment(uint256 _cut, address _recipient)
        internal
    {
        if (_cut > 0) {
            uint256 _payment = (totalRentCollected * _cut) / (1000);
            _payout(_recipient, _payment);
            emit LogStakeholderPaid(_recipient, _payment);
        }
    }

```
