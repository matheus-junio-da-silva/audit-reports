# Context: GovernorAlpha._castVote

**Contract:** `GovernorAlpha` (Inherits: None)
**Signature:** `_castVote(address,uint256,bool)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** proposals, xVader
- **Writes:** proposals

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(state(proposalId) == ProposalState.Active,GovernorAlpha::_castVote: voting is closed)`
- require/assert: `require(bool,string)(! receipt.hasVoted,GovernorAlpha::_castVote: voter already voted)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IXVader.TMP_146(uint256) = HIGH_LEVEL_CALL, dest:xVader(IXVader), function:getPastVotes, arguments:['voter', 'REF_130']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(state(proposalId) == ProposalState.Active,GovernorAlpha::_castVote: voting is closed)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - proposal = proposals(proposalId)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - receipt = proposal.receipts(voter)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - require(bool,string)(! receipt.hasVoted,GovernorAlpha::_castVote: voter already voted)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - votes = uint224(xVader.getPastVotes(voter,proposal.startBlock))"]
    Node_5 --> Node_6
    Node_6["6: NodeType.IF - support"]
    Node_6 --> Node_7
    Node_6 --> Node_8
    Node_7["7: NodeType.EXPRESSION - proposal.forVotes = proposal.forVotes + votes"]
    Node_7 --> Node_9
    Node_8["8: NodeType.EXPRESSION - proposal.againstVotes = proposal.againstVotes + votes"]
    Node_8 --> Node_9
    Node_9["9: NodeType.ENDIF - "]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - receipt.hasVoted = true"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - receipt.support = support"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - receipt.votes = votes"]
    Node_12 --> Node_13
    Node_13["13: NodeType.EXPRESSION - VoteCast(voter,proposalId,support,votes)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/governance/GovernorAlpha.sol` on lines **728** to **761**

```solidity
    function _castVote(
        address voter,
        uint256 proposalId,
        bool support
    ) internal {
        require(
            state(proposalId) == ProposalState.Active,
            "GovernorAlpha::_castVote: voting is closed"
        );

        Proposal storage proposal = proposals[proposalId];
        Receipt storage receipt = proposal.receipts[voter];

        require(
            !receipt.hasVoted,
            "GovernorAlpha::_castVote: voter already voted"
        );

        // optimistically casting to uint224 as xVader contract performs the checks for
        // votes to not overflow uint224.
        uint224 votes = uint224(xVader.getPastVotes(voter, proposal.startBlock));

        if (support) {
            proposal.forVotes = proposal.forVotes + votes;
        } else {
            proposal.againstVotes = proposal.againstVotes + votes;
        }

        receipt.hasVoted = true;
        receipt.support = support;
        receipt.votes = votes;

        emit VoteCast(voter, proposalId, support, votes);
    }

```
