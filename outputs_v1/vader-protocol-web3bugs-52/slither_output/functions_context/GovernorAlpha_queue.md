# Context: GovernorAlpha.queue

**Contract:** `GovernorAlpha` (Inherits: None)
**Signature:** `queue(uint256)`
**Method Selector ID:** `0xddf0b009`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** proposals, timelock
- **Writes:** proposals

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(state(proposalId) == ProposalState.Succeeded,GovernorAlpha::queue: proposal can only be queued if it is succeeded)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `ITimelock.TMP_67(uint256) = HIGH_LEVEL_CALL, dest:timelock(ITimelock), function:delay, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(state(proposalId) == ProposalState.Succeeded,GovernorAlpha::queue: proposal can only be queued if it is succeeded)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - proposal = proposals(proposalId)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - eta = block.timestamp + timelock.delay()"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - length = proposal.targets.length"]
    Node_4 --> Node_7
    Node_5["5: NodeType.STARTLOOP - "]
    Node_5 --> Node_8
    Node_6["6: NodeType.ENDLOOP - "]
    Node_6 --> Node_11
    Node_7["7: NodeType.VARIABLE - i = 0"]
    Node_7 --> Node_5
    Node_8["8: NodeType.IFLOOP - i < length"]
    Node_8 --> Node_9
    Node_8 --> Node_6
    Node_9["9: NodeType.EXPRESSION - _queueOrRevert(proposal.targets(i),proposal.values(i),proposal.signatures(i),proposal.calldatas(i),eta)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - i ++"]
    Node_10 --> Node_8
    Node_11["11: NodeType.EXPRESSION - proposal.eta = eta"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - ProposalQueued(proposalId,eta)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/governance/GovernorAlpha.sol` on lines **428** to **448**

```solidity
    function queue(uint256 proposalId) public {
        require(
            state(proposalId) == ProposalState.Succeeded,
            "GovernorAlpha::queue: proposal can only be queued if it is succeeded"
        );
        Proposal storage proposal = proposals[proposalId];
        uint256 eta = block.timestamp + timelock.delay();

        uint256 length = proposal.targets.length;
        for (uint256 i = 0; i < length; i++) {
            _queueOrRevert(
                proposal.targets[i],
                proposal.values[i],
                proposal.signatures[i],
                proposal.calldatas[i],
                eta
            );
        }
        proposal.eta = eta;
        emit ProposalQueued(proposalId, eta);
    }

```
