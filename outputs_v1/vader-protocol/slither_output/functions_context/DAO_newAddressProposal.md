# Context: DAO.newAddressProposal

**Contract:** `DAO` (Inherits: None)
**Signature:** `newAddressProposal(address,string)`
**Method Selector ID:** `0x293cee7d`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** proposalCount
- **Writes:** mapPID_address, mapPID_type, proposalCount

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
    Node_1["1: NodeType.EXPRESSION - proposalCount += 1"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - mapPID_address(proposalCount) = proposedAddress"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - mapPID_type(proposalCount) = typeStr"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - NewProposal(msg.sender,proposalCount,typeStr)"]
```

### Source Mapping
Declared in: `contracts/DAO.sol` on lines **69** to **74**

```solidity
    function newAddressProposal(address proposedAddress, string memory typeStr) public {
        proposalCount += 1;
        mapPID_address[proposalCount] = proposedAddress;
        mapPID_type[proposalCount] = typeStr;
        emit NewProposal(msg.sender, proposalCount, typeStr);
    }

```
