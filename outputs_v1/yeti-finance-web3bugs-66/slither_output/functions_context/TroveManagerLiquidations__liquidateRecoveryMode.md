# Context: TroveManagerLiquidations._liquidateRecoveryMode

**Contract:** `TroveManagerLiquidations` (Inherits: ITroveManagerLiquidations, TroveManagerBase, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `_liquidateRecoveryMode(IActivePool,IDefaultPool,address,uint256,uint256,uint256) returns (TroveManagerLiquidations.LiquidationValues)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** MCR, YUSD_GAS_COMPENSATION, _100pct, troveManager, yetiFinanceTreasury
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_YUSDInStabPool != 0,TML: zero YUSD in Stab Pool)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_541(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['REF_745', 'REF_749'] `
- `ITroveManager.TMP_535(uint256) = HIGH_LEVEL_CALL, dest:troveManager(ITroveManager), function:getTroveOwnersCount, arguments:[]  `
- `ITroveManager.HIGH_LEVEL_CALL, dest:troveManager(ITroveManager), function:collSurplusUpdate, arguments:['_borrower', 'REF_811', 'REF_813']  `
- `ITroveManager.HIGH_LEVEL_CALL, dest:troveManager(ITroveManager), function:movePendingTroveRewardsToActivePool, arguments:['_activePool', '_defaultPool', 'REF_771', 'REF_773', 'REF_775', '_borrower']  `
- `ITroveManager.TUPLE_1(uint256,address[],uint256[],uint256,address[],uint256[]) = HIGH_LEVEL_CALL, dest:troveManager(ITroveManager), function:getEntireDebtAndColls, arguments:['_borrower']  `
- `ITroveManager.HIGH_LEVEL_CALL, dest:troveManager(ITroveManager), function:movePendingTroveRewardsToActivePool, arguments:['_activePool', '_defaultPool', 'REF_751', 'REF_753', 'REF_755', '_borrower']  `
- `ITroveManager.HIGH_LEVEL_CALL, dest:troveManager(ITroveManager), function:movePendingTroveRewardsToActivePool, arguments:['_activePool', '_defaultPool', 'REF_789', 'REF_791', 'REF_793', '_borrower']  `
- `ITroveManager.HIGH_LEVEL_CALL, dest:troveManager(ITroveManager), function:removeStakeTLR, arguments:['_borrower']  `
- `ITroveManager.HIGH_LEVEL_CALL, dest:troveManager(ITroveManager), function:closeTroveLiquidation, arguments:['_borrower']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - "]
    Node_1 --> Node_2
    Node_2["2: NodeType.IF - troveManager.getTroveOwnersCount() <= 1"]
    Node_2 --> Node_3
    Node_2 --> Node_4
    Node_3["3: NodeType.RETURN - singleLiquidation"]
    Node_4["4: NodeType.ENDIF - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - (singleLiquidation.entireTroveDebt,singleLiquidation.entireTroveColl.tokens,singleLiquidation.entireTroveColl.amounts,vars.pendingDebtReward,vars.pendingCollReward.tokens,vars.pendingCollReward.amounts) = troveManager.getEntireDebtAndColls(_borrower)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - singleLiquidation.collGasCompensation = _getCollGasCompensation(singleLiquidation.entireTroveColl)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - singleLiquidation.YUSDGasCompensation = YUSD_GAS_COMPENSATION"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - vars.collToLiquidate.tokens = singleLiquidation.entireTroveColl.tokens"]
    Node_8 --> Node_9
    Node_9["9: NodeType.VARIABLE - collToLiquidateLen = vars.collToLiquidate.tokens.length"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - vars.collToLiquidate.amounts = new uint256()(collToLiquidateLen)"]
    Node_10 --> Node_13
    Node_11["11: NodeType.STARTLOOP - "]
    Node_11 --> Node_14
    Node_12["12: NodeType.ENDLOOP - "]
    Node_12 --> Node_17
    Node_13["13: NodeType.VARIABLE - "]
    Node_13 --> Node_11
    Node_14["14: NodeType.IFLOOP - i < collToLiquidateLen"]
    Node_14 --> Node_15
    Node_14 --> Node_12
    Node_15["15: NodeType.EXPRESSION - vars.collToLiquidate.amounts(i) = singleLiquidation.entireTroveColl.amounts(i).sub(singleLiquidation.collGasCompensation.amounts(i))"]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - ++ i"]
    Node_16 --> Node_14
    Node_17["17: NodeType.IF - _ICR <= _100pct"]
    Node_17 --> Node_18
    Node_17 --> Node_30
    Node_18["18: NodeType.EXPRESSION - troveManager.movePendingTroveRewardsToActivePool(_activePool,_defaultPool,vars.pendingDebtReward,vars.pendingCollReward.tokens,vars.pendingCollReward.amounts,_borrower)"]
    Node_18 --> Node_19
    Node_19["19: NodeType.EXPRESSION - troveManager.removeStakeTLR(_borrower)"]
    Node_19 --> Node_20
    Node_20["20: NodeType.EXPRESSION - singleLiquidation.debtToOffset = 0"]
    Node_20 --> Node_21
    Node_21["21: NodeType.VARIABLE - "]
    Node_21 --> Node_22
    Node_22["22: NodeType.EXPRESSION - singleLiquidation.collToSendToSP = emptyColls"]
    Node_22 --> Node_23
    Node_23["23: NodeType.EXPRESSION - singleLiquidation.debtToRedistribute = singleLiquidation.entireTroveDebt"]
    Node_23 --> Node_24
    Node_24["24: NodeType.EXPRESSION - singleLiquidation.collToRedistribute = vars.collToLiquidate"]
    Node_24 --> Node_25
    Node_25["25: NodeType.EXPRESSION - _updateWAssetsRewardOwner(singleLiquidation.collToRedistribute,_borrower,yetiFinanceTreasury)"]
    Node_25 --> Node_26
    Node_26["26: NodeType.EXPRESSION - troveManager.closeTroveLiquidation(_borrower)"]
    Node_26 --> Node_27
    Node_27["27: NodeType.EXPRESSION - TroveLiquidated(_borrower,singleLiquidation.entireTroveDebt,TroveManagerOperation.liquidateInRecoveryMode)"]
    Node_27 --> Node_28
    Node_28["28: NodeType.VARIABLE - "]
    Node_28 --> Node_29
    Node_29["29: NodeType.EXPRESSION - TroveUpdated(_borrower,0,borrowerColls.tokens,borrowerColls.amounts,TroveManagerOperation.liquidateInRecoveryMode)"]
    Node_29 --> Node_56
    Node_30["30: NodeType.IF - _ICR < MCR"]
    Node_30 --> Node_31
    Node_30 --> Node_41
    Node_31["31: NodeType.EXPRESSION - troveManager.movePendingTroveRewardsToActivePool(_activePool,_defaultPool,vars.pendingDebtReward,vars.pendingCollReward.tokens,vars.pendingCollReward.amounts,_borrower)"]
    Node_31 --> Node_32
    Node_32["32: NodeType.EXPRESSION - troveManager.removeStakeTLR(_borrower)"]
    Node_32 --> Node_33
    Node_33["33: NodeType.VARIABLE - or_vals = _getOffsetAndRedistributionVals(singleLiquidation.entireTroveDebt,vars.collToLiquidate,_YUSDInStabPool)"]
    Node_33 --> Node_34
    Node_34["34: NodeType.VARIABLE - collsToUpdate = _sumColls(or_vals.collToSendToSP,or_vals.collToRedistribute)"]
    Node_34 --> Node_35
    Node_35["35: NodeType.EXPRESSION - _updateWAssetsRewardOwner(collsToUpdate,_borrower,yetiFinanceTreasury)"]
    Node_35 --> Node_36
    Node_36["36: NodeType.EXPRESSION - singleLiquidation = _updateSingleLiquidation(or_vals,singleLiquidation)"]
    Node_36 --> Node_37
    Node_37["37: NodeType.EXPRESSION - troveManager.closeTroveLiquidation(_borrower)"]
    Node_37 --> Node_38
    Node_38["38: NodeType.EXPRESSION - TroveLiquidated(_borrower,singleLiquidation.entireTroveDebt,TroveManagerOperation.liquidateInRecoveryMode)"]
    Node_38 --> Node_39
    Node_39["39: NodeType.VARIABLE - "]
    Node_39 --> Node_40
    Node_40["40: NodeType.EXPRESSION - TroveUpdated(_borrower,0,borrowerColls_scope_0.tokens,borrowerColls_scope_0.amounts,TroveManagerOperation.liquidateInRecoveryMode)"]
    Node_40 --> Node_55
    Node_41["41: NodeType.IF - (_ICR < _TCR) && (singleLiquidation.entireTroveDebt <= _YUSDInStabPool)"]
    Node_41 --> Node_42
    Node_41 --> Node_52
    Node_42["42: NodeType.EXPRESSION - troveManager.movePendingTroveRewardsToActivePool(_activePool,_defaultPool,vars.pendingDebtReward,vars.pendingCollReward.tokens,vars.pendingCollReward.amounts,_borrower)"]
    Node_42 --> Node_43
    Node_43["43: NodeType.EXPRESSION - require(bool,string)(_YUSDInStabPool != 0,TML: zero YUSD in Stab Pool)"]
    Node_43 --> Node_44
    Node_44["44: NodeType.EXPRESSION - troveManager.removeStakeTLR(_borrower)"]
    Node_44 --> Node_45
    Node_45["45: NodeType.EXPRESSION - singleLiquidation = _getCappedOffsetVals(singleLiquidation.entireTroveDebt,singleLiquidation.entireTroveColl.tokens,singleLiquidation.entireTroveColl.amounts,MCR)"]
    Node_45 --> Node_46
    Node_46["46: NodeType.VARIABLE - collsToUpdate_scope_1 = _sumColls(singleLiquidation.collToSendToSP,singleLiquidation.collToRedistribute)"]
    Node_46 --> Node_47
    Node_47["47: NodeType.EXPRESSION - _updateWAssetsRewardOwner(collsToUpdate_scope_1,_borrower,yetiFinanceTreasury)"]
    Node_47 --> Node_48
    Node_48["48: NodeType.EXPRESSION - troveManager.closeTroveLiquidation(_borrower)"]
    Node_48 --> Node_49
    Node_49["49: NodeType.EXPRESSION - TroveLiquidated(_borrower,singleLiquidation.entireTroveDebt,TroveManagerOperation.liquidateInRecoveryMode)"]
    Node_49 --> Node_50
    Node_50["50: NodeType.VARIABLE - "]
    Node_50 --> Node_51
    Node_51["51: NodeType.EXPRESSION - TroveUpdated(_borrower,0,borrowerColls_scope_2.tokens,borrowerColls_scope_2.amounts,TroveManagerOperation.liquidateInRecoveryMode)"]
    Node_51 --> Node_54
    Node_52["52: NodeType.VARIABLE - "]
    Node_52 --> Node_53
    Node_53["53: NodeType.RETURN - zeroVals"]
    Node_54["54: NodeType.ENDIF - "]
    Node_54 --> Node_55
    Node_55["55: NodeType.ENDIF - "]
    Node_55 --> Node_56
    Node_56["56: NodeType.ENDIF - "]
    Node_56 --> Node_57
    Node_57["57: NodeType.IF - _CollsIsNonZero(singleLiquidation.collSurplus)"]
    Node_57 --> Node_58
    Node_57 --> Node_59
    Node_58["58: NodeType.EXPRESSION - troveManager.collSurplusUpdate(_borrower,singleLiquidation.collSurplus.tokens,singleLiquidation.collSurplus.amounts)"]
    Node_58 --> Node_59
    Node_59["59: NodeType.ENDIF - "]
    Node_59 --> Node_60
    Node_60["60: NodeType.RETURN - singleLiquidation"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TroveManagerLiquidations.sol` on lines **470** to **654**

```solidity
    function _liquidateRecoveryMode(
        IActivePool _activePool,
        IDefaultPool _defaultPool,
        address _borrower,
        uint256 _ICR,
        uint256 _YUSDInStabPool,
        uint256 _TCR
    ) internal returns (LiquidationValues memory singleLiquidation) {
        LocalVariables_InnerSingleLiquidateFunction memory vars;

        if (troveManager.getTroveOwnersCount() <= 1) {
            return singleLiquidation;
        } // don't liquidate if last trove

        (
            singleLiquidation.entireTroveDebt,
            singleLiquidation.entireTroveColl.tokens,
            singleLiquidation.entireTroveColl.amounts,
            vars.pendingDebtReward,
            vars.pendingCollReward.tokens,
            vars.pendingCollReward.amounts
        ) = troveManager.getEntireDebtAndColls(_borrower);

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

        // If ICR <= 100%, purely redistribute the Trove across all active Troves
        if (_ICR <= _100pct) {
            troveManager.movePendingTroveRewardsToActivePool(
                _activePool,
                _defaultPool,
                vars.pendingDebtReward,
                vars.pendingCollReward.tokens,
                vars.pendingCollReward.amounts, 
                _borrower
            );
            // troveManager.movePendingTroveRewardsToActivePool(_activePool, _defaultPool, vars.pendingDebtReward, singleLiquidation.entireTroveColl.tokens, singleLiquidation.entireTroveColl.amounts);
            troveManager.removeStakeTLR(_borrower);

            singleLiquidation.debtToOffset = 0;
            newColls memory emptyColls;
            singleLiquidation.collToSendToSP = emptyColls;
            singleLiquidation.debtToRedistribute = singleLiquidation.entireTroveDebt;
            singleLiquidation.collToRedistribute = vars.collToLiquidate;

            // WAsset rewards for collToRedistribute will accrue to
            // Yeti Finance Treasury until the WAssets are claimed by troves
            _updateWAssetsRewardOwner(singleLiquidation.collToRedistribute, _borrower, yetiFinanceTreasury);

            troveManager.closeTroveLiquidation(_borrower);
            emit TroveLiquidated(
                _borrower,
                singleLiquidation.entireTroveDebt,
                TroveManagerOperation.liquidateInRecoveryMode
            );
            newColls memory borrowerColls;// = troveManager.getTroveColls(_borrower);
            emit TroveUpdated(
                _borrower,
                0,
                borrowerColls.tokens,
                borrowerColls.amounts,
                TroveManagerOperation.liquidateInRecoveryMode
            );

            // If 100% < ICR < MCR, offset as much as possible, and redistribute the remainder
            // ICR > 100% is implied by prevoius state. 
        } else if (_ICR < MCR) {

            troveManager.movePendingTroveRewardsToActivePool(
                _activePool,
                _defaultPool,
                vars.pendingDebtReward,
                vars.pendingCollReward.tokens,
                vars.pendingCollReward.amounts, 
                _borrower
            );

            troveManager.removeStakeTLR(_borrower);

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
            emit TroveLiquidated(
                _borrower,
                singleLiquidation.entireTroveDebt,
                TroveManagerOperation.liquidateInRecoveryMode
            );
            newColls memory borrowerColls;// = troveManager.getTroveColls(_borrower);
            emit TroveUpdated(
                _borrower,
                0,
                borrowerColls.tokens,
                borrowerColls.amounts,
                TroveManagerOperation.liquidateInRecoveryMode
            );
            /*
             * If 110% <= ICR < current TCR (accounting for the preceding liquidations in the current sequence)
             * and there is YUSD in the Stability Pool, only offset, with no redistribution,
             * but at a capped rate of 1.1 and only if the whole debt can be liquidated.
             * The remainder due to the capped rate will be claimable as collateral surplus.
             * ICR >= 110% is implied from last else if statement. 
             */
        } else if (
           (_ICR < _TCR) && (singleLiquidation.entireTroveDebt <= _YUSDInStabPool)
        ) {
            troveManager.movePendingTroveRewardsToActivePool(
                _activePool,
                _defaultPool,
                vars.pendingDebtReward,
                vars.pendingCollReward.tokens,
                vars.pendingCollReward.amounts,
                _borrower
            );

            require(_YUSDInStabPool != 0, "TML: zero YUSD in Stab Pool");

            troveManager.removeStakeTLR(_borrower);

            singleLiquidation = _getCappedOffsetVals(
                singleLiquidation.entireTroveDebt,
                singleLiquidation.entireTroveColl.tokens,
                singleLiquidation.entireTroveColl.amounts,
                MCR
            );

            newColls memory collsToUpdate = _sumColls(
                singleLiquidation.collToSendToSP,
                singleLiquidation.collToRedistribute
            );
            // rewards for WAssets sent to SP and collToRedistribute will
            // accrue to Yeti Finance Treasury until the assets are claimed
            _updateWAssetsRewardOwner(collsToUpdate, _borrower, yetiFinanceTreasury);

            troveManager.closeTroveLiquidation(_borrower);

            emit TroveLiquidated(
                _borrower,
                singleLiquidation.entireTroveDebt,
                TroveManagerOperation.liquidateInRecoveryMode
            );
            newColls memory borrowerColls;
            emit TroveUpdated(
                _borrower,
                0,
                borrowerColls.tokens,
                borrowerColls.amounts,
                TroveManagerOperation.liquidateInRecoveryMode
            );
        } else {
            // if (_ICR >= MCR && ( _ICR >= _TCR || singleLiquidation.entireTroveDebt > _YUSDInStabPool))
            LiquidationValues memory zeroVals;
            return zeroVals;
        }

        if (_CollsIsNonZero(singleLiquidation.collSurplus)) {
            troveManager.collSurplusUpdate(
                _borrower,
                singleLiquidation.collSurplus.tokens,
                singleLiquidation.collSurplus.amounts
            );
        }
    }

```
