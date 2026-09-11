# Context: TroveManagerTester._getPendingCollRewards

**Contract:** `TroveManagerTester` (Inherits: TroveManager, ReentrancyGuard, ITroveManager, TroveManagerBase, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `_getPendingCollRewards(address) returns (YetiCustomBase.newColls)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** L_Coll, Troves, rewardSnapshots, whitelist
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_400(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['REF_462', 'snapshotCollReward'] `
- `IWhitelist.TMP_396(address[]) = HIGH_LEVEL_CALL, dest:whitelist(IWhitelist), function:getValidCollateral, arguments:[]  `
- `SafeMath.TMP_404(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['stake', 'rewardPerUnitStaked'] `
- `IERC20.TMP_403(uint8) = HIGH_LEVEL_CALL, dest:TMP_402(IERC20), function:decimals, arguments:[]  `
- `SafeMath.TMP_406(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_404', 'TMP_405'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.IF - Troves(_borrower).status != Status.active"]
    Node_1 --> Node_2
    Node_1 --> Node_4
    Node_2["2: NodeType.VARIABLE - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.RETURN - emptyColls"]
    Node_4["4: NodeType.ENDIF - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - allColls = whitelist.getValidCollateral()"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - pendingCollRewards.amounts = new uint256()(allColls.length)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - pendingCollRewards.tokens = allColls"]
    Node_7 --> Node_8
    Node_8["8: NodeType.VARIABLE - allCollsLen = allColls.length"]
    Node_8 --> Node_11
    Node_9["9: NodeType.STARTLOOP - "]
    Node_9 --> Node_12
    Node_10["10: NodeType.ENDLOOP - "]
    Node_10 --> Node_25
    Node_11["11: NodeType.VARIABLE - "]
    Node_11 --> Node_9
    Node_12["12: NodeType.IFLOOP - i < allCollsLen"]
    Node_12 --> Node_13
    Node_12 --> Node_10
    Node_13["13: NodeType.VARIABLE - coll = allColls(i)"]
    Node_13 --> Node_14
    Node_14["14: NodeType.VARIABLE - snapshotCollReward = rewardSnapshots(_borrower).CollRewards(coll)"]
    Node_14 --> Node_15
    Node_15["15: NodeType.VARIABLE - rewardPerUnitStaked = L_Coll(coll).sub(snapshotCollReward)"]
    Node_15 --> Node_16
    Node_16["16: NodeType.IF - rewardPerUnitStaked == 0"]
    Node_16 --> Node_17
    Node_16 --> Node_19
    Node_17["17: NodeType.EXPRESSION - pendingCollRewards.amounts(i) = 0"]
    Node_17 --> Node_18
    Node_18["18: NodeType.CONTINUE - "]
    Node_18 --> Node_24
    Node_19["19: NodeType.ENDIF - "]
    Node_19 --> Node_20
    Node_20["20: NodeType.VARIABLE - stake = Troves(_borrower).stakes(coll)"]
    Node_20 --> Node_21
    Node_21["21: NodeType.VARIABLE - dec = IERC20(coll).decimals()"]
    Node_21 --> Node_22
    Node_22["22: NodeType.VARIABLE - assetCollReward = stake.mul(rewardPerUnitStaked).div(10 ** dec)"]
    Node_22 --> Node_23
    Node_23["23: NodeType.EXPRESSION - pendingCollRewards.amounts(i) = assetCollReward"]
    Node_23 --> Node_24
    Node_24["24: NodeType.EXPRESSION - ++ i"]
    Node_24 --> Node_12
    Node_25["25: NodeType.RETURN - pendingCollRewards"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TroveManager.sol` on lines **392** to **415**

```solidity
    function _getPendingCollRewards(address _borrower) internal view returns (newColls memory pendingCollRewards) {
        if (Troves[_borrower].status != Status.active) {
            newColls memory emptyColls;
            return emptyColls;
        }

        address[] memory allColls = whitelist.getValidCollateral();
        pendingCollRewards.amounts = new uint[](allColls.length);
        pendingCollRewards.tokens = allColls;
        uint256 allCollsLen = allColls.length;
        for (uint256 i; i < allCollsLen; ++i) {
            address coll = allColls[i];
            uint snapshotCollReward = rewardSnapshots[_borrower].CollRewards[coll];
            uint rewardPerUnitStaked = L_Coll[coll].sub(snapshotCollReward);
            if ( rewardPerUnitStaked == 0) {
                pendingCollRewards.amounts[i] = 0;
                continue; }

            uint stake = Troves[_borrower].stakes[coll];
            uint dec = IERC20(coll).decimals();
            uint assetCollReward = stake.mul(rewardPerUnitStaked).div(10 ** dec);
            pendingCollRewards.amounts[i] = assetCollReward; // i is correct index here
        }
    }

```
