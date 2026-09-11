# Context: Verification._linkAddress

**Contract:** `Verification` (Inherits: OwnableUpgradeable, ContextUpgradeable, IVerification, Initializable)
**Signature:** `_linkAddress(address,address)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** activationDelay
- **Writes:** linkedAddresses

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
    Node_1["1: NodeType.VARIABLE - _linkedAddressActivatesAt = block.timestamp + activationDelay"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - linkedAddresses(_linked) = LinkedAddress(_master,_linkedAddressActivatesAt)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - AddressLinked(_linked,_master,_linkedAddressActivatesAt)"]
```

### Source Mapping
Declared in: `contracts/Verification/Verification.sol` on lines **112** to **116**

```solidity
    function _linkAddress(address _linked, address _master) internal {
        uint256 _linkedAddressActivatesAt = block.timestamp + activationDelay;
        linkedAddresses[_linked] = LinkedAddress(_master, _linkedAddressActivatesAt);
        emit AddressLinked(_linked, _master, _linkedAddressActivatesAt);
    }

```
