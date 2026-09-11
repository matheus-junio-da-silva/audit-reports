# Context: TroveManagerLiquidations._liquidateNormalMode

**Contract:** `TroveManagerLiquidations` (Inherits: ITroveManagerLiquidations, TroveManagerBase, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `_liquidateNormalMode(IActivePool,IDefaultPool,address,uint256) returns (TroveManagerLiquidations.LiquidationValues)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** YUSD_GAS_COMPENSATION, troveManager, yetiFinanceTreasury
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `ITroveManager.HIGH_LEVEL_CALL, dest:troveManager(ITroveManager), function:movePendingTroveRewardsToActivePool, arguments:['_activePool', '_defaultPool', 'REF_672', 'REF_674', 'REF_676', '_borrower']  `
- `ITroveManager.HIGH_LEVEL_CALL, dest:troveManager(ITroveManager), function:collSurplusUpdate, arguments:['_borrower', 'REF_708', 'REF_710']  `
- `SafeMath.TMP_525(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['REF_695', 'REF_699'] `
- `ITroveManager.TUPLE_0(uint256,address[],uint256[],uint256,address[],uint256[]) = HIGH_LEVEL_CALL, dest:troveManager(ITroveManager), function:getEntireDebtAndColls, arguments:['_borrower']  `
- `ITroveManager.HIGH_LEVEL_CALL, dest:troveManager(ITroveManager), function:removeStakeTLR, arguments:['_borrower']  `
- `ITroveManager.HIGH_LEVEL_CALL, dest:troveManager(ITroveManager), function:closeTroveLiquidation, arguments:['_borrower']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - "]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - (singleLiquidation.entireTroveDebt,singleLiquidation.entireTroveColl.tokens,singleLiquidation.entireTroveColl.amounts,vars.pendingDebtReward,vars.pendingCollReward.tokens,vars.pendingCollReward.amounts) = troveManager.getEntireDebtAndColls(_borrower)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - troveManager.movePendingTroveRewardsToActivePool(_activePool,_defaultPool,vars.pendingDebtReward,vars.pendingCollReward.tokens,vars.pendingCollReward.amounts,_borrower)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - troveManager.removeStakeTLR(_borrower)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - singleLiquidation.collGasCompensation = _getCollGasCompensation(singleLiquidation.entireTroveColl)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - singleLiquidation.YUSDGasCompensation = YUSD_GAS_COMPENSATION"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - vars.collToLiquidate.tokens = singleLiquidation.entireTroveColl.tokens"]
    Node_7 --> Node_8
    Node_8["8: NodeType.VARIABLE - collToLiquidateLen = vars.collToLiquidate.tokens.length"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - vars.collToLiquidate.amounts = new uint256()(collToLiquidateLen)"]
    Node_9 --> Node_12
    Node_10["10: NodeType.STARTLOOP - "]
    Node_10 --> Node_13
    Node_11["11: NodeType.ENDLOOP - "]
    Node_11 --> Node_16
    Node_12["12: NodeType.VARIABLE - "]
    Node_12 --> Node_10
    Node_13["13: NodeType.IFLOOP - i < collToLiquidateLen"]
    Node_13 --> Node_14
    Node_13 --> Node_11
    Node_14["14: NodeType.EXPRESSION - vars.collToLiquidate.amounts(i) = singleLiquidation.entireTroveColl.amounts(i).sub(singleLiquidation.collGasCompensation.amounts(i))"]
    Node_14 --> Node_15
    Node_15["15: NodeType.EXPRESSION - ++ i"]
    Node_15 --> Node_13
    Node_16["16: NodeType.VARIABLE - or_vals = _getOffsetAndRedistributionVals(singleLiquidation.entireTroveDebt,vars.collToLiquidate,_YUSDInStabPool)"]
    Node_16 --> Node_17
    Node_17["17: NodeType.VARIABLE - collsToUpdate = _sumColls(or_vals.collToSendToSP,or_vals.collToRedistribute)"]
    Node_17 --> Node_18
    Node_18["18: NodeType.EXPRESSION - _updateWAssetsRewardOwner(collsToUpdate,_borrower,yetiFinanceTreasury)"]
    Node_18 --> Node_19
    Node_19["19: NodeType.EXPRESSION - singleLiquidation = _updateSingleLiquidation(or_vals,singleLiquidation)"]
    Node_19 --> Node_20
    Node_20["20: NodeType.EXPRESSION - troveManager.closeTroveLiquidation(_borrower)"]
    Node_20 --> Node_21
    Node_21["21: NodeType.IF - _CollsIsNonZero(singleLiquidation.collSurplus)"]
    Node_21 --> Node_22
    Node_21 --> Node_23
    Node_22["22: NodeType.EXPRESSION - troveManager.collSurplusUpdate(_borrower,singleLiquidation.collSurplus.tokens,singleLiquidation.collSurplus.amounts)"]
    Node_22 --> Node_23
    Node_23["23: NodeType.ENDIF - "]
    Node_23 --> Node_24
    Node_24["24: NodeType.EXPRESSION - TroveLiquidated(_borrower,singleLiquidation.entireTroveDebt,TroveManagerOperation.liquidateInNormalMode)"]
    Node_24 --> Node_25
    Node_25["25: NodeType.VARIABLE - "]
    Node_25 --> Node_26
    Node_26["26: NodeType.EXPRESSION - TroveUpdated(_borrower,0,borrowerColls.tokens,borrowerColls.amounts,TroveManagerOperation.liquidateInNormalMode)"]
    Node_26 --> Node_27
    Node_27["27: NodeType.RETURN - singleLiquidation"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TroveManagerLiquidations.sol` on lines **389** to **466**

```solidity
    function _liquidateNormalMode(
        IActivePool _activePool,
        IDefaultPool _defaultPool,
        address _borrower,
        uint256 _YUSDInStabPool
    ) internal returns (LiquidationValues memory singleLiquidation) {
        LocalVariables_InnerSingleLiquidateFunction memory vars;

        (
            singleLiquidation.entireTroveDebt,
            singleLiquidation.entireTroveColl.tokens,
            singleLiquidation.entireTroveColl.amounts,
            vars.pendingDebtReward,
            vars.pendingCollReward.tokens,
            vars.pendingCollReward.amounts
        ) = troveManager.getEntireDebtAndColls(_borrower);

        troveManager.movePendingTroveRewardsToActivePool(
            _activePool,
            _defaultPool,
            vars.pendingDebtReward,
            vars.pendingCollReward.tokens,
            vars.pendingCollReward.amounts, 
            _borrower
        );
        troveManager.removeStakeTLR(_borrower);

        singleLiquidation.collGasCompensation = _getCollGasCompensation(
            singleLiquidation.entireTroveColl
        );

        singleLiquidation.YUSDGasCompensation = YUSD_GAS_COMPENSATION;

        vars.collToLiquidate.tokens = singleLiquidation.entireTroveColl.tokens;
        uint256 collToLiquidateLen = vars.collToLiquidate.tokens.length;
        vars.collToLiquidate.amounts = new uint256[](collToLiquidateLen);
        for (uint256 i; i < collToLiquidateLen; ++i) {
            vars.collToLiquidate.amounts[i] = singleLiquidation.entireTroveColl.amounts[i].sub(
                singleLiquidation.collGasCompensation.amounts[i]
            );
        }

        LocalVariables_ORVals memory or_vals = _getOffsetAndRedistributionVals(
            singleLiquidation.entireTroveDebt,
            vars.collToLiquidate,
            _YUSDInStabPool
        );

        newColls memory collsToUpdate = _sumColls(or_vals.collToSendToSP, or_vals.collToRedistribute);
        // rewards for WAssets sent to SP and collToRedistribute will
        // accrue to Yeti Finance Treasury until the assets are claimed
        _updateWAssetsRewardOwner(collsToUpdate, _borrower, yetiFinanceTreasury);

        singleLiquidation = _updateSingleLiquidation(or_vals, singleLiquidation);
        troveManager.closeTroveLiquidation(_borrower);

        if (_CollsIsNonZero(singleLiquidation.collSurplus)) {
            troveManager.collSurplusUpdate(
                _borrower,
                singleLiquidation.collSurplus.tokens,
                singleLiquidation.collSurplus.amounts
            );
        }

        emit TroveLiquidated(
            _borrower,
            singleLiquidation.entireTroveDebt,
            TroveManagerOperation.liquidateInNormalMode
        );
        newColls memory borrowerColls;
        emit TroveUpdated(
            _borrower,
            0,
            borrowerColls.tokens,
            borrowerColls.amounts,
            TroveManagerOperation.liquidateInNormalMode
        );
    }

```
