# Context: RCMarket.payArtist

**Contract:** `RCMarket` (Inherits: IRCMarket, NativeMetaTransaction, Initializable)
**Signature:** `payArtist()`
**Method Selector ID:** `0x734c8f80`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** artistAddress, artistCut, artistPaid
- **Writes:** artistPaid

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(! artistPaid,Artist already paid)`

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
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(! artistPaid,Artist already paid)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - artistPaid = true"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - _processStakeholderPayment(artistCut,artistAddress)"]
```

### Source Mapping
Declared in: `contracts/RCMarket.sol` on lines **560** to **565**

```solidity
    function payArtist() external {
        _checkState(States.WITHDRAW);
        require(!artistPaid, "Artist already paid");
        artistPaid = true;
        _processStakeholderPayment(artistCut, artistAddress);
    }

```
