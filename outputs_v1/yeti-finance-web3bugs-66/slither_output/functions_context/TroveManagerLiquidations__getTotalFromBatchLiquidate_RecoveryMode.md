# Context: TroveManagerLiquidations._getTotalFromBatchLiquidate_RecoveryMode

**Contract:** `TroveManagerLiquidations` (Inherits: ITroveManagerLiquidations, TroveManagerBase, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `_getTotalFromBatchLiquidate_RecoveryMode(IActivePool,IDefaultPool,uint256,address[]) returns (TroveManagerLiquidations.LiquidationTotals)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** MCR, troveManager
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_498(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['REF_622', 'collToSendToSpVc'] `
- `ITroveManager.TMP_481(uint256) = HIGH_LEVEL_CALL, dest:troveManager(ITroveManager), function:getTroveStatus, arguments:['REF_594']  `
- `SafeMath.TMP_507(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['REF_634', 'REF_636'] `
- `SafeMath.TMP_500(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['TMP_499', 'collSurplusTotal'] `
- `SafeMath.TMP_494(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['REF_615', 'REF_617'] `
- `SafeMath.TMP_491(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['REF_609', 'REF_611'] `
- `ITroveManager.TMP_484(uint256) = HIGH_LEVEL_CALL, dest:troveManager(ITroveManager), function:getCurrentICR, arguments:['REF_598']  `
- `SafeMath.TMP_499(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['TMP_498', 'collGasCompensationTotal'] `
- `LiquityMath.TMP_489(uint256) = LIBRARY_CALL, dest:LiquityMath, function:LiquityMath._computeCR(uint256,uint256), arguments:['REF_603', 'REF_604'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - "]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - vars.remainingYUSDInStabPool = _YUSDInStabPool"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - vars.backToNormalMode = false"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - vars.entireSystemDebt = getEntireSystemDebt()"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - vars.entireSystemColl = getEntireSystemColl()"]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - troveArrayLen = _troveArray.length"]
    Node_7 --> Node_10
    Node_8["8: NodeType.STARTLOOP - "]
    Node_8 --> Node_11
    Node_9["9: NodeType.ENDLOOP - "]
    Node_9 --> Node_42
    Node_10["10: NodeType.EXPRESSION - vars.i = 0"]
    Node_10 --> Node_8
    Node_11["11: NodeType.IFLOOP - vars.i < troveArrayLen"]
    Node_11 --> Node_12
    Node_11 --> Node_9
    Node_12["12: NodeType.EXPRESSION - vars.user = _troveArray(vars.i)"]
    Node_12 --> Node_13
    Node_13["13: NodeType.VARIABLE - userStatus = TroveManagerBase.Status(troveManager.getTroveStatus(vars.user))"]
    Node_13 --> Node_14
    Node_14["14: NodeType.IF - userStatus != Status.active"]
    Node_14 --> Node_15
    Node_14 --> Node_16
    Node_15["15: NodeType.CONTINUE - "]
    Node_15 --> Node_41
    Node_16["16: NodeType.ENDIF - "]
    Node_16 --> Node_17
    Node_17["17: NodeType.EXPRESSION - vars.ICR = troveManager.getCurrentICR(vars.user)"]
    Node_17 --> Node_18
    Node_18["18: NodeType.IF - ! vars.backToNormalMode"]
    Node_18 --> Node_19
    Node_18 --> Node_33
    Node_19["19: NodeType.IF - vars.ICR >= MCR && vars.remainingYUSDInStabPool == 0"]
    Node_19 --> Node_20
    Node_19 --> Node_21
    Node_20["20: NodeType.CONTINUE - "]
    Node_20 --> Node_41
    Node_21["21: NodeType.ENDIF - "]
    Node_21 --> Node_22
    Node_22["22: NodeType.VARIABLE - TCR = LiquityMath._computeCR(vars.entireSystemColl,vars.entireSystemDebt)"]
    Node_22 --> Node_23
    Node_23["23: NodeType.EXPRESSION - singleLiquidation = _liquidateRecoveryMode(_activePool,_defaultPool,vars.user,vars.ICR,vars.remainingYUSDInStabPool,TCR)"]
    Node_23 --> Node_24
    Node_24["24: NodeType.EXPRESSION - vars.remainingYUSDInStabPool = vars.remainingYUSDInStabPool.sub(singleLiquidation.debtToOffset)"]
    Node_24 --> Node_25
    Node_25["25: NodeType.EXPRESSION - _updateWAssetsRewardOwner(singleLiquidation.collGasCompensation,vars.user,address(this))"]
    Node_25 --> Node_26
    Node_26["26: NodeType.EXPRESSION - vars.entireSystemDebt = vars.entireSystemDebt.sub(singleLiquidation.debtToOffset)"]
    Node_26 --> Node_27
    Node_27["27: NodeType.VARIABLE - collToSendToSpVc = _getVCColls(singleLiquidation.collToSendToSP)"]
    Node_27 --> Node_28
    Node_28["28: NodeType.VARIABLE - collGasCompensationTotal = _getVCColls(singleLiquidation.collGasCompensation)"]
    Node_28 --> Node_29
    Node_29["29: NodeType.VARIABLE - collSurplusTotal = _getVCColls(singleLiquidation.collSurplus)"]
    Node_29 --> Node_30
    Node_30["30: NodeType.EXPRESSION - vars.entireSystemColl = vars.entireSystemColl.sub(collToSendToSpVc).sub(collGasCompensationTotal).sub(collSurplusTotal)"]
    Node_30 --> Node_31
    Node_31["31: NodeType.EXPRESSION - totals = _addLiquidationValuesToTotals(totals,singleLiquidation)"]
    Node_31 --> Node_32
    Node_32["32: NodeType.EXPRESSION - vars.backToNormalMode = ! _checkPotentialRecoveryMode(vars.entireSystemColl,vars.entireSystemDebt)"]
    Node_32 --> Node_40
    Node_33["33: NodeType.IF - vars.backToNormalMode && vars.ICR < MCR"]
    Node_33 --> Node_34
    Node_33 --> Node_38
    Node_34["34: NodeType.EXPRESSION - singleLiquidation = _liquidateNormalMode(_activePool,_defaultPool,vars.user,vars.remainingYUSDInStabPool)"]
    Node_34 --> Node_35
    Node_35["35: NodeType.EXPRESSION - vars.remainingYUSDInStabPool = vars.remainingYUSDInStabPool.sub(singleLiquidation.debtToOffset)"]
    Node_35 --> Node_36
    Node_36["36: NodeType.EXPRESSION - _updateWAssetsRewardOwner(singleLiquidation.collGasCompensation,vars.user,address(this))"]
    Node_36 --> Node_37
    Node_37["37: NodeType.EXPRESSION - totals = _addLiquidationValuesToTotals(totals,singleLiquidation)"]
    Node_37 --> Node_39
    Node_38["38: NodeType.CONTINUE - "]
    Node_38 --> Node_41
    Node_39["39: NodeType.ENDIF - "]
    Node_39 --> Node_40
    Node_40["40: NodeType.ENDIF - "]
    Node_40 --> Node_41
    Node_41["41: NodeType.EXPRESSION - ++ vars.i"]
    Node_41 --> Node_11
    Node_42["42: NodeType.RETURN - totals"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TroveManagerLiquidations.sol` on lines **263** to **352**

```solidity
    function _getTotalFromBatchLiquidate_RecoveryMode(
        IActivePool _activePool,
        IDefaultPool _defaultPool,
        uint256 _YUSDInStabPool,
        address[] memory _troveArray
    ) internal returns (LiquidationTotals memory totals) {
        LocalVariables_LiquidationSequence memory vars;
        LiquidationValues memory singleLiquidation;

        vars.remainingYUSDInStabPool = _YUSDInStabPool;
        vars.backToNormalMode = false;
        vars.entireSystemDebt = getEntireSystemDebt();
        // get total VC
        vars.entireSystemColl = getEntireSystemColl();
        uint256 troveArrayLen = _troveArray.length;
        for (vars.i = 0; vars.i < troveArrayLen; ++vars.i) {
            vars.user = _troveArray[vars.i];

            // Skip non-active troves
            Status userStatus = Status(troveManager.getTroveStatus(vars.user));
            if (userStatus != Status.active) {
                continue;
            }
            vars.ICR = troveManager.getCurrentICR(vars.user);

            if (!vars.backToNormalMode) {
                // Skip this trove if ICR is greater than MCR and Stability Pool is empty
                if (vars.ICR >= MCR && vars.remainingYUSDInStabPool == 0) {
                    continue;
                }

                uint256 TCR = LiquityMath._computeCR(vars.entireSystemColl, vars.entireSystemDebt);

                singleLiquidation = _liquidateRecoveryMode(
                    _activePool,
                    _defaultPool,
                    vars.user,
                    vars.ICR,
                    vars.remainingYUSDInStabPool,
                    TCR
                );

                // Update aggregate trackers
                vars.remainingYUSDInStabPool = vars.remainingYUSDInStabPool.sub(
                    singleLiquidation.debtToOffset
                );

                // If wrapped assets exist then update the reward to this contract temporarily
                _updateWAssetsRewardOwner(singleLiquidation.collGasCompensation, vars.user, address(this));

                vars.entireSystemDebt = vars.entireSystemDebt.sub(singleLiquidation.debtToOffset);

                uint256 collToSendToSpVc = _getVCColls(singleLiquidation.collToSendToSP);
                uint256 collGasCompensationTotal = _getVCColls(
                    singleLiquidation.collGasCompensation
                );
                uint256 collSurplusTotal = _getVCColls(singleLiquidation.collSurplus);

                vars.entireSystemColl = vars
                    .entireSystemColl
                    .sub(collToSendToSpVc)
                    .sub(collGasCompensationTotal)
                    .sub(collSurplusTotal);

                // Add liquidation values to their respective running totals
                totals = _addLiquidationValuesToTotals(totals, singleLiquidation);

                vars.backToNormalMode = !_checkPotentialRecoveryMode(
                    vars.entireSystemColl,
                    vars.entireSystemDebt
                );
            } else if (vars.backToNormalMode && vars.ICR < MCR) {
                singleLiquidation = _liquidateNormalMode(
                    _activePool,
                    _defaultPool,
                    vars.user,
                    vars.remainingYUSDInStabPool
                );
                vars.remainingYUSDInStabPool = vars.remainingYUSDInStabPool.sub(
                    singleLiquidation.debtToOffset
                );

                // If wrapped assets exist then update the reward to this contract temporarily
                _updateWAssetsRewardOwner(singleLiquidation.collGasCompensation, vars.user, address(this));

                // Add liquidation values to their respective running totals
                totals = _addLiquidationValuesToTotals(totals, singleLiquidation);
            } else continue; // In Normal Mode skip troves with ICR >= MCR
        }
    }

```
