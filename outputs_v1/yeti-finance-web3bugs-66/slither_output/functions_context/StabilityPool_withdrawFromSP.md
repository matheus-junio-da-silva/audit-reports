# Context: StabilityPool.withdrawFromSP

**Contract:** `StabilityPool` (Inherits: IStabilityPool, ICollateralReceiver, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `withdrawFromSP(uint256)`
**Method Selector ID:** `0x2e54bf95`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** communityIssuance, deposits
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_436(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['compoundedYUSDDeposit', 'YUSDtoWithdraw'] `
- `SafeMath.TMP_432(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['compoundedFrontEndStake', 'YUSDtoWithdraw'] `
- `LiquityMath.TMP_428(uint256) = LIBRARY_CALL, dest:LiquityMath, function:LiquityMath._min(uint256,uint256), arguments:['_amount', 'compoundedYUSDDeposit'] `
- `SafeMath.TMP_429(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['initialDeposit', 'compoundedYUSDDeposit'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.IF - _amount != 0"]
    Node_1 --> Node_2
    Node_1 --> Node_3
    Node_2["2: NodeType.EXPRESSION - _requireNoUnderCollateralizedTroves()"]
    Node_2 --> Node_3
    Node_3["3: NodeType.ENDIF - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - initialDeposit = deposits(msg.sender).initialValue"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - _requireUserHasDeposit(initialDeposit)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - communityIssuanceCached = communityIssuance"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - _triggerYETIIssuance(communityIssuanceCached)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.VARIABLE - "]
    Node_8 --> Node_9
    Node_9["9: NodeType.VARIABLE - "]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - (assets,amounts) = getDepositorGains(msg.sender)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.VARIABLE - compoundedYUSDDeposit = getCompoundedYUSDDeposit(msg.sender)"]
    Node_11 --> Node_12
    Node_12["12: NodeType.VARIABLE - YUSDtoWithdraw = LiquityMath._min(_amount,compoundedYUSDDeposit)"]
    Node_12 --> Node_13
    Node_13["13: NodeType.VARIABLE - YUSDLoss = initialDeposit.sub(compoundedYUSDDeposit)"]
    Node_13 --> Node_14
    Node_14["14: NodeType.VARIABLE - frontEnd = deposits(msg.sender).frontEndTag"]
    Node_14 --> Node_15
    Node_15["15: NodeType.EXPRESSION - _payOutYETIGains(communityIssuanceCached,msg.sender,frontEnd)"]
    Node_15 --> Node_16
    Node_16["16: NodeType.VARIABLE - compoundedFrontEndStake = getCompoundedFrontEndStake(frontEnd)"]
    Node_16 --> Node_17
    Node_17["17: NodeType.VARIABLE - newFrontEndStake = compoundedFrontEndStake.sub(YUSDtoWithdraw)"]
    Node_17 --> Node_18
    Node_18["18: NodeType.EXPRESSION - _updateFrontEndStakeAndSnapshots(frontEnd,newFrontEndStake)"]
    Node_18 --> Node_19
    Node_19["19: NodeType.EXPRESSION - FrontEndStakeChanged(frontEnd,newFrontEndStake,msg.sender)"]
    Node_19 --> Node_20
    Node_20["20: NodeType.EXPRESSION - _sendYUSDToDepositor(msg.sender,YUSDtoWithdraw)"]
    Node_20 --> Node_21
    Node_21["21: NodeType.VARIABLE - newDeposit = compoundedYUSDDeposit.sub(YUSDtoWithdraw)"]
    Node_21 --> Node_22
    Node_22["22: NodeType.EXPRESSION - _updateDepositAndSnapshots(msg.sender,newDeposit)"]
    Node_22 --> Node_23
    Node_23["23: NodeType.EXPRESSION - UserDepositChanged(msg.sender,newDeposit)"]
    Node_23 --> Node_24
    Node_24["24: NodeType.EXPRESSION - GainsWithdrawn(msg.sender,assets,amounts,YUSDLoss)"]
    Node_24 --> Node_25
    Node_25["25: NodeType.EXPRESSION - _sendGainsToDepositor(msg.sender,assets,amounts)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/StabilityPool.sol` on lines **421** to **459**

```solidity
    function withdrawFromSP(uint256 _amount) external override {
        if (_amount != 0) {
            _requireNoUnderCollateralizedTroves();
        }
        uint256 initialDeposit = deposits[msg.sender].initialValue;
        _requireUserHasDeposit(initialDeposit);

        ICommunityIssuance communityIssuanceCached = communityIssuance;

        _triggerYETIIssuance(communityIssuanceCached);

        (address[] memory assets, uint256[] memory amounts) = getDepositorGains(msg.sender);

        uint256 compoundedYUSDDeposit = getCompoundedYUSDDeposit(msg.sender);

        uint256 YUSDtoWithdraw = LiquityMath._min(_amount, compoundedYUSDDeposit);
        uint256 YUSDLoss = initialDeposit.sub(compoundedYUSDDeposit); // Needed only for event log

        // First pay out any YETI gains
        address frontEnd = deposits[msg.sender].frontEndTag;
        _payOutYETIGains(communityIssuanceCached, msg.sender, frontEnd);

        // Update front end stake
        uint256 compoundedFrontEndStake = getCompoundedFrontEndStake(frontEnd);
        uint256 newFrontEndStake = compoundedFrontEndStake.sub(YUSDtoWithdraw);
        _updateFrontEndStakeAndSnapshots(frontEnd, newFrontEndStake);
        emit FrontEndStakeChanged(frontEnd, newFrontEndStake, msg.sender);

        _sendYUSDToDepositor(msg.sender, YUSDtoWithdraw);

        // Update deposit
        uint256 newDeposit = compoundedYUSDDeposit.sub(YUSDtoWithdraw);
        _updateDepositAndSnapshots(msg.sender, newDeposit);
        emit UserDepositChanged(msg.sender, newDeposit);

        emit GainsWithdrawn(msg.sender, assets, amounts, YUSDLoss); // YUSD Loss required for event log

        _sendGainsToDepositor(msg.sender, assets, amounts);
    }

```
