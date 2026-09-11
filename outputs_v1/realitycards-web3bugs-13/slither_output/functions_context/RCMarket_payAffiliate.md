# Context: RCMarket.payAffiliate

**Contract:** `RCMarket` (Inherits: IRCMarket, NativeMetaTransaction, Initializable)
**Signature:** `payAffiliate()`
**Method Selector ID:** `0x91cef6a8`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** affiliateAddress, affiliateCut, affiliatePaid
- **Writes:** affiliatePaid

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(! affiliatePaid,Affiliate already paid)`

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
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(! affiliatePaid,Affiliate already paid)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - affiliatePaid = true"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - _processStakeholderPayment(affiliateCut,affiliateAddress)"]
```

### Source Mapping
Declared in: `contracts/RCMarket.sol` on lines **577** to **582**

```solidity
    function payAffiliate() external {
        _checkState(States.WITHDRAW);
        require(!affiliatePaid, "Affiliate already paid");
        affiliatePaid = true;
        _processStakeholderPayment(affiliateCut, affiliateAddress);
    }

```
