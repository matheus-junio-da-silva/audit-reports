# Context: GovernorAlpha.cancel

**Contract:** `GovernorAlpha` (Inherits: None)
**Signature:** `cancel(uint256)`
**Method Selector ID:** `0x40e58ee5`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyGuardian`
  ```solidity
  modifier onlyGuardian() {
          _onlyGuardian();
          _;
      }
  ```

### State Variables Interaction
- **Reads:** proposals, timelock
- **Writes:** proposals

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_state != ProposalState.Executed,GovernorAlpha::cancel: cannot cancel executed proposal)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `ITimelock.HIGH_LEVEL_CALL, dest:timelock(ITimelock), function:cancelTransaction, arguments:['REF_108', 'REF_110', 'REF_112', 'REF_114', 'REF_115']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_13
    Node_1["1: NodeType.VARIABLE - _state = state(proposalId)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(_state != ProposalState.Executed,GovernorAlpha::cancel: cannot cancel executed proposal)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - proposal = proposals(proposalId)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - proposal.canceled = true"]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - length = proposal.targets.length"]
    Node_5 --> Node_8
    Node_6["6: NodeType.STARTLOOP - "]
    Node_6 --> Node_9
    Node_7["7: NodeType.ENDLOOP - "]
    Node_7 --> Node_12
    Node_8["8: NodeType.VARIABLE - i = 0"]
    Node_8 --> Node_6
    Node_9["9: NodeType.IFLOOP - i < length"]
    Node_9 --> Node_10
    Node_9 --> Node_7
    Node_10["10: NodeType.EXPRESSION - timelock.cancelTransaction(proposal.targets(i),proposal.values(i),proposal.signatures(i),proposal.calldatas(i),proposal.eta)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - i ++"]
    Node_11 --> Node_9
    Node_12["12: NodeType.EXPRESSION - ProposalCanceled(proposalId)"]
    Node_13["13: NodeType.EXPRESSION - onlyGuardian()"]
    Node_13 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/governance/GovernorAlpha.sol` on lines **609** to **630**

```solidity
    function cancel(uint256 proposalId) public onlyGuardian {
        ProposalState _state = state(proposalId);
        require(
            _state != ProposalState.Executed,
            "GovernorAlpha::cancel: cannot cancel executed proposal"
        );

        Proposal storage proposal = proposals[proposalId];
        proposal.canceled = true;
        uint256 length = proposal.targets.length;
        for (uint256 i = 0; i < length; i++) {
            timelock.cancelTransaction(
                proposal.targets[i],
                proposal.values[i],
                proposal.signatures[i],
                proposal.calldatas[i],
                proposal.eta
            );
        }

        emit ProposalCanceled(proposalId);
    }

```
