# Context: GovernorAlpha.state

**Contract:** `GovernorAlpha` (Inherits: None)
**Signature:** `state(uint256) returns (GovernorAlpha.ProposalState)`
**Method Selector ID:** `0x3e4f49e6`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** proposalCount, proposals, timelock
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(proposalCount >= proposalId && proposalId > 0,GovernorAlpha::state: invalid proposal id)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `ITimelock.TMP_33(uint256) = HIGH_LEVEL_CALL, dest:timelock(ITimelock), function:GRACE_PERIOD, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(proposalCount >= proposalId && proposalId > 0,GovernorAlpha::state: invalid proposal id)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - proposal = proposals(proposalId)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.IF - proposal.canceled"]
    Node_3 --> Node_4
    Node_3 --> Node_5
    Node_4["4: NodeType.RETURN - ProposalState.Canceled"]
    Node_5["5: NodeType.ENDIF - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.IF - proposal.vetoStatus.hasBeenVetoed"]
    Node_6 --> Node_7
    Node_6 --> Node_14
    Node_7["7: NodeType.VARIABLE - _eta = proposal.eta"]
    Node_7 --> Node_8
    Node_8["8: NodeType.IF - proposal.vetoStatus.support && _eta == 0"]
    Node_8 --> Node_9
    Node_8 --> Node_10
    Node_9["9: NodeType.RETURN - ProposalState.Succeeded"]
    Node_10["10: NodeType.ENDIF - "]
    Node_10 --> Node_11
    Node_11["11: NodeType.IF - _eta == 0"]
    Node_11 --> Node_12
    Node_11 --> Node_13
    Node_12["12: NodeType.RETURN - ProposalState.Defeated"]
    Node_13["13: NodeType.ENDIF - "]
    Node_13 --> Node_26
    Node_14["14: NodeType.IF - block.number <= proposal.startBlock"]
    Node_14 --> Node_15
    Node_14 --> Node_16
    Node_15["15: NodeType.RETURN - ProposalState.Pending"]
    Node_16["16: NodeType.ENDIF - "]
    Node_16 --> Node_17
    Node_17["17: NodeType.IF - block.number <= proposal.endBlock"]
    Node_17 --> Node_18
    Node_17 --> Node_19
    Node_18["18: NodeType.RETURN - ProposalState.Active"]
    Node_19["19: NodeType.ENDIF - "]
    Node_19 --> Node_20
    Node_20["20: NodeType.IF - proposal.forVotes <= proposal.againstVotes || proposal.forVotes < quorumVotes(proposal.startBlock)"]
    Node_20 --> Node_21
    Node_20 --> Node_22
    Node_21["21: NodeType.RETURN - ProposalState.Defeated"]
    Node_22["22: NodeType.ENDIF - "]
    Node_22 --> Node_23
    Node_23["23: NodeType.IF - proposal.eta == 0"]
    Node_23 --> Node_24
    Node_23 --> Node_25
    Node_24["24: NodeType.RETURN - ProposalState.Succeeded"]
    Node_25["25: NodeType.ENDIF - "]
    Node_25 --> Node_26
    Node_26["26: NodeType.ENDIF - "]
    Node_26 --> Node_27
    Node_27["27: NodeType.IF - proposal.executed"]
    Node_27 --> Node_28
    Node_27 --> Node_29
    Node_28["28: NodeType.RETURN - ProposalState.Executed"]
    Node_29["29: NodeType.ENDIF - "]
    Node_29 --> Node_30
    Node_30["30: NodeType.IF - block.timestamp >= proposal.eta + timelock.GRACE_PERIOD()"]
    Node_30 --> Node_31
    Node_30 --> Node_32
    Node_31["31: NodeType.RETURN - ProposalState.Expired"]
    Node_32["32: NodeType.ENDIF - "]
    Node_32 --> Node_33
    Node_33["33: NodeType.RETURN - ProposalState.Queued"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/governance/GovernorAlpha.sol` on lines **279** to **319**

```solidity
    function state(uint256 proposalId) public view returns (ProposalState) {
        require(
            proposalCount >= proposalId && proposalId > 0,
            "GovernorAlpha::state: invalid proposal id"
        );

        Proposal storage proposal = proposals[proposalId];
        if (proposal.canceled) return ProposalState.Canceled;

        if (proposal.vetoStatus.hasBeenVetoed) {
            // proposal has been vetoed
            uint256 _eta = proposal.eta;

            // proposal has been vetoed in favor, so considered succeeded
            if (proposal.vetoStatus.support && _eta == 0)
                return ProposalState.Succeeded;

            // proposal has been vetoed against, so considered defeated
            if (_eta == 0) return ProposalState.Defeated;
        } else {
            // proposal has not been vetoed, normal flow ensues
            if (block.number <= proposal.startBlock)
                return ProposalState.Pending;

            if (block.number <= proposal.endBlock) return ProposalState.Active;

            if (
                proposal.forVotes <= proposal.againstVotes ||
                proposal.forVotes < quorumVotes(proposal.startBlock)
            ) return ProposalState.Defeated;

            if (proposal.eta == 0) return ProposalState.Succeeded;
        }

        if (proposal.executed) return ProposalState.Executed;

        if (block.timestamp >= proposal.eta + timelock.GRACE_PERIOD())
            return ProposalState.Expired;

        return ProposalState.Queued;
    }

```
