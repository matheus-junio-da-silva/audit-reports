# Context: DAO.voteProposal

**Contract:** `DAO` (Inherits: None)
**Signature:** `voteProposal(uint256) returns (uint256)`
**Method Selector ID:** `0x807896d5`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** mapPID_finalising, mapPID_type, mapPID_votes
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
    Node_1["1: NodeType.VARIABLE - _type = bytes(mapPID_type(proposalID))"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - voteWeight = countMemberVotes(proposalID)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.IF - hasQuorum(proposalID) && mapPID_finalising(proposalID) == false"]
    Node_3 --> Node_4
    Node_3 --> Node_10
    Node_4["4: NodeType.IF - isEqual(_type,DAO) || isEqual(_type,UTILS) || isEqual(_type,REWARD)"]
    Node_4 --> Node_5
    Node_4 --> Node_8
    Node_5["5: NodeType.IF - hasMajority(proposalID)"]
    Node_5 --> Node_6
    Node_5 --> Node_7
    Node_6["6: NodeType.EXPRESSION - _finalise(proposalID)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.ENDIF - "]
    Node_7 --> Node_9
    Node_8["8: NodeType.EXPRESSION - _finalise(proposalID)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.ENDIF - "]
    Node_9 --> Node_10
    Node_10["10: NodeType.ENDIF - "]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - NewVote(msg.sender,proposalID,voteWeight,mapPID_votes(proposalID),string(_type))"]
    Node_11 --> Node_12
    Node_12["12: NodeType.RETURN - voteWeight"]
```

### Source Mapping
Declared in: `contracts/DAO.sol` on lines **79** to **92**

```solidity
    function voteProposal(uint proposalID) public returns (uint voteWeight) {
        bytes memory _type = bytes(mapPID_type[proposalID]);
        voteWeight = countMemberVotes(proposalID);
        if(hasQuorum(proposalID) && mapPID_finalising[proposalID] == false){
            if(isEqual(_type, 'DAO') || isEqual(_type, 'UTILS') || isEqual(_type, 'REWARD')){
                if(hasMajority(proposalID)){
                    _finalise(proposalID);
                }
            } else {
                _finalise(proposalID);
            }
        }
        emit NewVote(msg.sender, proposalID, voteWeight, mapPID_votes[proposalID], string(_type));
    }

```
