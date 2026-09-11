# Context: DAO.newGrantProposal

**Contract:** `DAO` (Inherits: None)
**Signature:** `newGrantProposal(address,uint256)`
**Method Selector ID:** `0xa6c83fed`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** proposalCount
- **Writes:** mapPID_grant, mapPID_type, proposalCount

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
    Node_1["1: NodeType.VARIABLE - typeStr = GRANT"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - proposalCount += 1"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - mapPID_type(proposalCount) = typeStr"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - grant.recipient = recipient"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - grant.amount = amount"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - mapPID_grant(proposalCount) = grant"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - NewProposal(msg.sender,proposalCount,typeStr)"]
```

### Source Mapping
Declared in: `contracts/DAO.sol` on lines **57** to **66**

```solidity
    function newGrantProposal(address recipient, uint amount) public {
        string memory typeStr = "GRANT";
        proposalCount += 1;
        mapPID_type[proposalCount] = typeStr;
        GrantDetails memory grant;
        grant.recipient = recipient;
        grant.amount = amount;
        mapPID_grant[proposalCount] = grant;
        emit NewProposal(msg.sender, proposalCount, typeStr);
    }

```
