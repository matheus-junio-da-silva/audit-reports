# Context: StabilityPoolTester._payOutYETIGains

**Contract:** `StabilityPoolTester` (Inherits: StabilityPool, IStabilityPool, ICollateralReceiver, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `_payOutYETIGains(ICommunityIssuance,address,address)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `ICommunityIssuance.HIGH_LEVEL_CALL, dest:_communityIssuance(ICommunityIssuance), function:sendYETI, arguments:['_depositor', 'depositorYETIGain']  `
- `ICommunityIssuance.HIGH_LEVEL_CALL, dest:_communityIssuance(ICommunityIssuance), function:sendYETI, arguments:['_frontEnd', 'frontEndYETIGain']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.IF - _frontEnd != address(0)"]
    Node_1 --> Node_2
    Node_1 --> Node_5
    Node_2["2: NodeType.VARIABLE - frontEndYETIGain = getFrontEndYETIGain(_frontEnd)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - _communityIssuance.sendYETI(_frontEnd,frontEndYETIGain)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - YETIPaidToFrontEnd(_frontEnd,frontEndYETIGain)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.ENDIF - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - depositorYETIGain = getDepositorYETIGain(_depositor)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - _communityIssuance.sendYETI(_depositor,depositorYETIGain)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - YETIPaidToDepositor(_depositor,depositorYETIGain)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/StabilityPool.sol` on lines **1067** to **1083**

```solidity
    function _payOutYETIGains(
        ICommunityIssuance _communityIssuance,
        address _depositor,
        address _frontEnd
    ) internal {
        // Pay out front end's YETI gain
        if (_frontEnd != address(0)) {
            uint256 frontEndYETIGain = getFrontEndYETIGain(_frontEnd);
            _communityIssuance.sendYETI(_frontEnd, frontEndYETIGain);
            emit YETIPaidToFrontEnd(_frontEnd, frontEndYETIGain);
        }

        // Pay out depositor's YETI gain
        uint256 depositorYETIGain = getDepositorYETIGain(_depositor);
        _communityIssuance.sendYETI(_depositor, depositorYETIGain);
        emit YETIPaidToDepositor(_depositor, depositorYETIGain);
    }

```
