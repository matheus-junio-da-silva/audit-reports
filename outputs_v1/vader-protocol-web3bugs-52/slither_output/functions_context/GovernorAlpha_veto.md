# Context: GovernorAlpha.veto

**Contract:** `GovernorAlpha` (Inherits: None)
**Signature:** `veto(uint256,bool)`
**Method Selector ID:** `0x5e8b7244`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyCouncil`
  ```solidity
  modifier onlyCouncil() {
          _onlyCouncil();
          _;
      }
  ```

### State Variables Interaction
- **Reads:** proposals
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_state == ProposalState.Active || _state == ProposalState.Pending,GovernorAlpha::veto: Proposal can only be vetoed when active)`
- revert: `revert(string)(GovernorAlpha::veto: council cannot veto on proposal having action with address(this) as target)`

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
    Node_0 --> Node_20
    Node_1["1: NodeType.VARIABLE - _state = state(proposalId)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(_state == ProposalState.Active || _state == ProposalState.Pending,GovernorAlpha::veto: Proposal can only be vetoed when active)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - proposal = proposals(proposalId)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - _targets = proposal.targets"]
    Node_4 --> Node_7
    Node_5["5: NodeType.STARTLOOP - "]
    Node_5 --> Node_8
    Node_6["6: NodeType.ENDLOOP - "]
    Node_6 --> Node_13
    Node_7["7: NodeType.VARIABLE - i = 0"]
    Node_7 --> Node_5
    Node_8["8: NodeType.IFLOOP - i < _targets.length"]
    Node_8 --> Node_9
    Node_8 --> Node_6
    Node_9["9: NodeType.IF - _targets(i) == address(this)"]
    Node_9 --> Node_10
    Node_9 --> Node_11
    Node_10["10: NodeType.EXPRESSION - revert(string)(GovernorAlpha::veto: council cannot veto on proposal having action with address(this) as target)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.ENDIF - "]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - i ++"]
    Node_12 --> Node_8
    Node_13["13: NodeType.VARIABLE - _vetoStatus = proposal.vetoStatus"]
    Node_13 --> Node_14
    Node_14["14: NodeType.EXPRESSION - _vetoStatus.hasBeenVetoed = true"]
    Node_14 --> Node_15
    Node_15["15: NodeType.EXPRESSION - _vetoStatus.support = support"]
    Node_15 --> Node_16
    Node_16["16: NodeType.IF - support"]
    Node_16 --> Node_17
    Node_16 --> Node_18
    Node_17["17: NodeType.EXPRESSION - queue(proposalId)"]
    Node_17 --> Node_18
    Node_18["18: NodeType.ENDIF - "]
    Node_18 --> Node_19
    Node_19["19: NodeType.EXPRESSION - ProposalVetoed(proposalId,support)"]
    Node_20["20: NodeType.EXPRESSION - onlyCouncil()"]
    Node_20 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/governance/GovernorAlpha.sol` on lines **562** to **588**

```solidity
    function veto(uint256 proposalId, bool support) external onlyCouncil {
        ProposalState _state = state(proposalId);
        require(
            _state == ProposalState.Active || _state == ProposalState.Pending,
            "GovernorAlpha::veto: Proposal can only be vetoed when active"
        );

        Proposal storage proposal = proposals[proposalId];
        address[] memory _targets = proposal.targets;
        for (uint256 i = 0; i < _targets.length; i++) {
            if (_targets[i] == address(this)) {
                revert(
                    "GovernorAlpha::veto: council cannot veto on proposal having action with address(this) as target"
                );
            }
        }

        VetoStatus storage _vetoStatus = proposal.vetoStatus;
        _vetoStatus.hasBeenVetoed = true;
        _vetoStatus.support = support;

        if (support) {
            queue(proposalId);
        }

        emit ProposalVetoed(proposalId, support);
    }

```
