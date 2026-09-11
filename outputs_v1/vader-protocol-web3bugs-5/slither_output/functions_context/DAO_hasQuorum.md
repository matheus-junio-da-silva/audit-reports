# Context: DAO.hasQuorum

**Contract:** `DAO` (Inherits: None)
**Signature:** `hasQuorum(uint256) returns (bool)`
**Method Selector ID:** `0xbbf8cf82`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** VAULT, mapPID_votes
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `iVAULT.TMP_91(uint256) = HIGH_LEVEL_CALL, dest:TMP_90(iVAULT), function:totalWeight, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - votes = mapPID_votes(_proposalID)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - consensus = iVAULT(VAULT).totalWeight() / 3"]
    Node_2 --> Node_3
    Node_3["3: NodeType.IF - votes > consensus"]
    Node_3 --> Node_4
    Node_3 --> Node_5
    Node_4["4: NodeType.RETURN - true"]
    Node_5["5: NodeType.RETURN - false"]
```

### Source Mapping
Declared in: `contracts/DAO.sol` on lines **174** to **182**

```solidity
    function hasQuorum(uint _proposalID) public view returns(bool){
        uint votes = mapPID_votes[_proposalID];
        uint consensus = iVAULT(VAULT).totalWeight() / 3; // >33%
        if(votes > consensus){
            return true;
        } else {
            return false;
        }
    }

```
