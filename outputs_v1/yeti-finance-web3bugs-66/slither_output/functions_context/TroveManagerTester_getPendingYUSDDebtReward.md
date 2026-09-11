# Context: TroveManagerTester.getPendingYUSDDebtReward

**Contract:** `TroveManagerTester` (Inherits: TroveManager, ReentrancyGuard, ITroveManager, TroveManagerBase, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `getPendingYUSDDebtReward(address) returns (uint256)`
**Method Selector ID:** `0x371e45ba`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** DECIMAL_PRECISION, L_YUSDDebt, Troves, rewardSnapshots, whitelist
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_414(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['pendingYUSDDebtReward', 'assetYUSDDebtReward'] `
- `IWhitelist.TMP_408(address[]) = HIGH_LEVEL_CALL, dest:whitelist(IWhitelist), function:getValidCollateral, arguments:[]  `
- `SafeMath.TMP_410(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['REF_484', 'snapshotYUSDDebt'] `
- `SafeMath.TMP_412(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['stake', 'rewardPerUnitStaked'] `
- `SafeMath.TMP_413(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_412', 'DECIMAL_PRECISION'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.IF - Troves(_borrower).status != Status.active"]
    Node_1 --> Node_2
    Node_1 --> Node_3
    Node_2["2: NodeType.RETURN - 0"]
    Node_3["3: NodeType.ENDIF - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - allColls = whitelist.getValidCollateral()"]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - allCollsLen = allColls.length"]
    Node_5 --> Node_8
    Node_6["6: NodeType.STARTLOOP - "]
    Node_6 --> Node_9
    Node_7["7: NodeType.ENDLOOP - "]
    Node_7 --> Node_20
    Node_8["8: NodeType.VARIABLE - "]
    Node_8 --> Node_6
    Node_9["9: NodeType.IFLOOP - i < allCollsLen"]
    Node_9 --> Node_10
    Node_9 --> Node_7
    Node_10["10: NodeType.VARIABLE - coll = allColls(i)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.VARIABLE - snapshotYUSDDebt = rewardSnapshots(_borrower).YUSDDebts(coll)"]
    Node_11 --> Node_12
    Node_12["12: NodeType.VARIABLE - rewardPerUnitStaked = L_YUSDDebt(allColls(i)).sub(snapshotYUSDDebt)"]
    Node_12 --> Node_13
    Node_13["13: NodeType.IF - rewardPerUnitStaked == 0"]
    Node_13 --> Node_14
    Node_13 --> Node_15
    Node_14["14: NodeType.CONTINUE - "]
    Node_14 --> Node_19
    Node_15["15: NodeType.ENDIF - "]
    Node_15 --> Node_16
    Node_16["16: NodeType.VARIABLE - stake = Troves(_borrower).stakes(coll)"]
    Node_16 --> Node_17
    Node_17["17: NodeType.VARIABLE - assetYUSDDebtReward = stake.mul(rewardPerUnitStaked).div(DECIMAL_PRECISION)"]
    Node_17 --> Node_18
    Node_18["18: NodeType.EXPRESSION - pendingYUSDDebtReward = pendingYUSDDebtReward.add(assetYUSDDebtReward)"]
    Node_18 --> Node_19
    Node_19["19: NodeType.EXPRESSION - ++ i"]
    Node_19 --> Node_9
    Node_20["20: NodeType.RETURN - pendingYUSDDebtReward"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TroveManager.sol` on lines **418** to **436**

```solidity
    function getPendingYUSDDebtReward(address _borrower) public view override returns (uint pendingYUSDDebtReward) {
        if (Troves[_borrower].status != Status.active) {
            return 0;
        }
        address[] memory allColls = whitelist.getValidCollateral();

        uint256 allCollsLen = allColls.length;
        for (uint256 i; i < allCollsLen; ++i) {
            address coll = allColls[i];
            uint snapshotYUSDDebt = rewardSnapshots[_borrower].YUSDDebts[coll];
            uint rewardPerUnitStaked = L_YUSDDebt[allColls[i]].sub(snapshotYUSDDebt);
            if ( rewardPerUnitStaked == 0) { continue; }

            uint stake =  Troves[_borrower].stakes[coll];

            uint assetYUSDDebtReward = stake.mul(rewardPerUnitStaked).div(DECIMAL_PRECISION);
            pendingYUSDDebtReward = pendingYUSDDebtReward.add(assetYUSDDebtReward);
        }
    }

```
