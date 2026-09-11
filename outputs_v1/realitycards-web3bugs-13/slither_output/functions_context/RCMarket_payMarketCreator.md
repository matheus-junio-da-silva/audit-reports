# Context: RCMarket.payMarketCreator

**Contract:** `RCMarket` (Inherits: IRCMarket, NativeMetaTransaction, Initializable)
**Signature:** `payMarketCreator()`
**Method Selector ID:** `0xec80a92c`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** creatorCut, creatorPaid, marketCreatorAddress, totalTimeHeld, winningOutcome
- **Writes:** creatorPaid

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(totalTimeHeld[winningOutcome] > 0,No winner)`
- require/assert: `require(bool,string)(! creatorPaid,Creator already paid)`

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
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(totalTimeHeld(winningOutcome) > 0,No winner)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - require(bool,string)(! creatorPaid,Creator already paid)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - creatorPaid = true"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - _processStakeholderPayment(creatorCut,marketCreatorAddress)"]
```

### Source Mapping
Declared in: `contracts/RCMarket.sol` on lines **568** to **574**

```solidity
    function payMarketCreator() external {
        _checkState(States.WITHDRAW);
        require(totalTimeHeld[winningOutcome] > 0, "No winner");
        require(!creatorPaid, "Creator already paid");
        creatorPaid = true;
        _processStakeholderPayment(creatorCut, marketCreatorAddress);
    }

```
