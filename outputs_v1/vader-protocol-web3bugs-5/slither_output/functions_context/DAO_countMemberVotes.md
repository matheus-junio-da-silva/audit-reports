# Context: DAO.countMemberVotes

**Contract:** `DAO` (Inherits: None)
**Signature:** `countMemberVotes(uint256) returns (uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** VAULT, mapPIDMember_votes, mapPID_votes
- **Writes:** mapPIDMember_votes, mapPID_votes

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `iVAULT.TMP_85(uint256) = HIGH_LEVEL_CALL, dest:TMP_84(iVAULT), function:getMemberWeight, arguments:['msg.sender']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - mapPID_votes(_proposalID) -= mapPIDMember_votes(_proposalID)(msg.sender)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - voteWeight = iVAULT(VAULT).getMemberWeight(msg.sender)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - mapPID_votes(_proposalID) += voteWeight"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - mapPIDMember_votes(_proposalID)(msg.sender) = voteWeight"]
    Node_4 --> Node_5
    Node_5["5: NodeType.RETURN - voteWeight"]
```

### Source Mapping
Declared in: `contracts/DAO.sol` on lines **158** to **163**

```solidity
    function countMemberVotes(uint _proposalID) internal returns (uint voteWeight){
        mapPID_votes[_proposalID] -= mapPIDMember_votes[_proposalID][msg.sender];
        voteWeight = iVAULT(VAULT).getMemberWeight(msg.sender);
        mapPID_votes[_proposalID] += voteWeight;
        mapPIDMember_votes[_proposalID][msg.sender] = voteWeight;
    }

```
