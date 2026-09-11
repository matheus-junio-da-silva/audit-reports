# Context: DAO._finalise

**Contract:** `DAO` (Inherits: None)
**Signature:** `_finalise(uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** coolOffPeriod, mapPID_type
- **Writes:** mapPID_finalising, mapPID_timeStart

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
    Node_1["1: NodeType.VARIABLE - _type = bytes(mapPID_type(_proposalID))"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - mapPID_finalising(_proposalID) = true"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - mapPID_timeStart(_proposalID) = block.timestamp"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - ProposalFinalising(msg.sender,_proposalID,block.timestamp + coolOffPeriod,string(_type))"]
```

### Source Mapping
Declared in: `contracts/DAO.sol` on lines **94** to **99**

```solidity
    function _finalise(uint _proposalID) internal {
        bytes memory _type = bytes(mapPID_type[_proposalID]);
        mapPID_finalising[_proposalID] = true;
        mapPID_timeStart[_proposalID] = block.timestamp;
        emit ProposalFinalising(msg.sender, _proposalID, block.timestamp+coolOffPeriod, string(_type));
    }

```
