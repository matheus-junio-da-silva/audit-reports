# Context: StabilityPoolTester.offset

**Contract:** `StabilityPoolTester` (Inherits: StabilityPool, IStabilityPool, ICollateralReceiver, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `offset(uint256,address[],uint256[])`
**Method Selector ID:** `0x768cc575`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** communityIssuance, totalYUSDDeposits
- **Writes:** None

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
    Node_1["1: NodeType.EXPRESSION - _requireCallerIsTML()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - totalYUSD = totalYUSDDeposits"]
    Node_2 --> Node_3
    Node_3["3: NodeType.IF - totalYUSD == 0 || _debtToOffset == 0"]
    Node_3 --> Node_4
    Node_3 --> Node_5
    Node_4["4: NodeType.RETURN - "]
    Node_5["5: NodeType.ENDIF - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - _triggerYETIIssuance(communityIssuance)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - "]
    Node_7 --> Node_8
    Node_8["8: NodeType.VARIABLE - "]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - (AssetGainPerUnitStaked,YUSDLossPerUnitStaked) = _computeRewardsPerUnitStaked(_tokens,_amountsAdded,_debtToOffset,totalYUSD)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - _updateRewardSumAndProduct(_tokens,AssetGainPerUnitStaked,YUSDLossPerUnitStaked)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - _moveOffsetCollAndDebt(_tokens,_amountsAdded,_debtToOffset)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/StabilityPool.sol` on lines **519** to **539**

```solidity
    function offset(
        uint256 _debtToOffset,
        address[] memory _tokens,
        uint256[] memory _amountsAdded
    ) external override {
        _requireCallerIsTML();
        uint256 totalYUSD = totalYUSDDeposits; // cached to save an SLOAD
        if (totalYUSD == 0 || _debtToOffset == 0) {
            return;
        }

        _triggerYETIIssuance(communityIssuance);

        (
            uint256[] memory AssetGainPerUnitStaked,
            uint256 YUSDLossPerUnitStaked
        ) = _computeRewardsPerUnitStaked(_tokens, _amountsAdded, _debtToOffset, totalYUSD);

        _updateRewardSumAndProduct(_tokens, AssetGainPerUnitStaked, YUSDLossPerUnitStaked); // updates S and P
        _moveOffsetCollAndDebt(_tokens, _amountsAdded, _debtToOffset);
    }

```
