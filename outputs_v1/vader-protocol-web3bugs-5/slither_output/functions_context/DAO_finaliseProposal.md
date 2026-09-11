# Context: DAO.finaliseProposal

**Contract:** `DAO` (Inherits: None)
**Signature:** `finaliseProposal(uint256)`
**Method Selector ID:** `0x4b193e23`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** coolOffPeriod, mapPID_finalising, mapPID_timeStart, mapPID_type
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)((block.timestamp - mapPID_timeStart[proposalID]) > coolOffPeriod,Must be after cool off)`
- require/assert: `require(bool,string)(mapPID_finalising[proposalID] == true,Must be finalising)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool,string)((block.timestamp - mapPID_timeStart(proposalID)) > coolOffPeriod,Must be after cool off)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(mapPID_finalising(proposalID) == true,Must be finalising)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.IF - ! hasQuorum(proposalID)"]
    Node_3 --> Node_4
    Node_3 --> Node_5
    Node_4["4: NodeType.EXPRESSION - _finalise(proposalID)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.ENDIF - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - _type = bytes(mapPID_type(proposalID))"]
    Node_6 --> Node_7
    Node_7["7: NodeType.IF - isEqual(_type,GRANT)"]
    Node_7 --> Node_8
    Node_7 --> Node_9
    Node_8["8: NodeType.EXPRESSION - grantFunds(proposalID)"]
    Node_8 --> Node_15
    Node_9["9: NodeType.IF - isEqual(_type,UTILS)"]
    Node_9 --> Node_10
    Node_9 --> Node_11
    Node_10["10: NodeType.EXPRESSION - moveUtils(proposalID)"]
    Node_10 --> Node_14
    Node_11["11: NodeType.IF - isEqual(_type,REWARD)"]
    Node_11 --> Node_12
    Node_11 --> Node_13
    Node_12["12: NodeType.EXPRESSION - moveRewardAddress(proposalID)"]
    Node_12 --> Node_13
    Node_13["13: NodeType.ENDIF - "]
    Node_13 --> Node_14
    Node_14["14: NodeType.ENDIF - "]
    Node_14 --> Node_15
    Node_15["15: NodeType.ENDIF - "]
```

### Source Mapping
Declared in: `contracts/DAO.sol` on lines **111** to **125**

```solidity
    function finaliseProposal(uint proposalID) public  {
        require((block.timestamp - mapPID_timeStart[proposalID]) > coolOffPeriod, "Must be after cool off");
        require(mapPID_finalising[proposalID] == true, "Must be finalising");
        if(!hasQuorum(proposalID)){
            _finalise(proposalID);
        }
        bytes memory _type = bytes(mapPID_type[proposalID]);
        if (isEqual(_type, 'GRANT')){
            grantFunds(proposalID);
        } else if (isEqual(_type, 'UTILS')){
            moveUtils(proposalID);
        } else if (isEqual(_type, 'REWARD')){
            moveRewardAddress(proposalID);
        }
    }

```
