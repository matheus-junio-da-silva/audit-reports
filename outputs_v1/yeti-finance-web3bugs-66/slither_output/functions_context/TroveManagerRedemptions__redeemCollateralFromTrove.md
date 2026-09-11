# Context: TroveManagerRedemptions._redeemCollateralFromTrove

**Contract:** `TroveManagerRedemptions` (Inherits: ITroveManagerRedemptions, TroveManagerBase, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `_redeemCollateralFromTrove(TroveManagerBase.ContractsCache,address,uint256,address,address,uint256) returns (TroveManagerBase.SingleRedemptionValues)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** DECIMAL_PRECISION, MIN_NET_DEBT, YUSD_GAS_COMPENSATION, troveManager, whitelist
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `ISortedTroves.HIGH_LEVEL_CALL, dest:REF_793(ISortedTroves), function:reInsert, arguments:['_borrower', 'newICR', '_upperPartialRedemptionHint', '_lowerPartialRedemptionHint']  `
- `ITroveManager.HIGH_LEVEL_CALL, dest:troveManager(ITroveManager), function:closeTroveRedemption, arguments:['_borrower']  `
- `ITroveManager.HIGH_LEVEL_CALL, dest:troveManager(ITroveManager), function:updateTroveCollTMR, arguments:['_borrower', 'REF_802', 'REF_803']  `
- `IWhitelist.TMP_647(bool) = HIGH_LEVEL_CALL, dest:whitelist(IWhitelist), function:isWrapped, arguments:['REF_777']  `
- `SafeMath.TMP_645(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_644', '1000000000000000000'] `
- `ITroveManager.TMP_633(uint256) = HIGH_LEVEL_CALL, dest:troveManager(ITroveManager), function:getTroveDebt, arguments:['_borrower']  `
- `SafeMath.TMP_652(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['TMP_651', 'REF_783'] `
- `SafeMath.TMP_666(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['_partialRedemptionHintICR', '20000000000000000'] `
- `IWAsset.HIGH_LEVEL_CALL, dest:TMP_648(IWAsset), function:updateReward, arguments:['_borrower', 'TMP_649', 'tokenAmountToRedeem']  `
- `SafeMath.TMP_643(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['baseLot', 'REF_765'] `
- `ITroveManager.TMP_651(uint256) = HIGH_LEVEL_CALL, dest:troveManager(ITroveManager), function:getTroveDebt, arguments:['_borrower']  `
- `ITroveManager.TUPLE_5(address[],uint256[],uint256) = HIGH_LEVEL_CALL, dest:troveManager(ITroveManager), function:getCurrentTroveState, arguments:['_borrower']  `
- `ITroveManager.HIGH_LEVEL_CALL, dest:troveManager(ITroveManager), function:updateTroveDebt, arguments:['_borrower', 'newDebt']  `
- `LiquityMath.TMP_663(uint256) = LIBRARY_CALL, dest:LiquityMath, function:LiquityMath._computeCR(uint256,uint256), arguments:['newColl', 'newDebt'] `
- `ITroveManager.HIGH_LEVEL_CALL, dest:troveManager(ITroveManager), function:removeStakeTMR, arguments:['_borrower']  `
- `LiquityMath.TMP_635(uint256) = LIBRARY_CALL, dest:LiquityMath, function:LiquityMath._min(uint256,uint256), arguments:['_maxYUSDAmount', 'TMP_634'] `
- `SafeMath.TMP_644(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_643', 'totalCollUSD'] `
- `SafeMath.TMP_646(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['REF_770', 'tokenAmountToRedeem'] `
- `SafeMath.TMP_664(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['_partialRedemptionHintICR', '20000000000000000'] `
- `SafeMath.TMP_634(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['TMP_633', 'YUSD_GAS_COMPENSATION'] `
- `ITroveManager.HIGH_LEVEL_CALL, dest:troveManager(ITroveManager), function:updateStakeAndTotalStakes, arguments:['_borrower']  `
- `SafeMath.TMP_641(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['REF_761', 'DECIMAL_PRECISION'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - singleRedemption.YUSDLot = LiquityMath._min(_maxYUSDAmount,troveManager.getTroveDebt(_borrower).sub(YUSD_GAS_COMPENSATION))"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - (colls.tokens,colls.amounts,None) = troveManager.getCurrentTroveState(_borrower)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - collsLen = colls.tokens.length"]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - finalAmounts = new uint256()(collsLen)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - singleRedemption.CollLot.tokens = colls.tokens"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - singleRedemption.CollLot.amounts = new uint256()(collsLen)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.VARIABLE - totalCollUSD = _getUSDColls(colls)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.VARIABLE - baseLot = singleRedemption.YUSDLot.mul(DECIMAL_PRECISION)"]
    Node_9 --> Node_12
    Node_10["10: NodeType.STARTLOOP - "]
    Node_10 --> Node_13
    Node_11["11: NodeType.ENDLOOP - "]
    Node_11 --> Node_21
    Node_12["12: NodeType.VARIABLE - "]
    Node_12 --> Node_10
    Node_13["13: NodeType.IFLOOP - i < collsLen"]
    Node_13 --> Node_14
    Node_13 --> Node_11
    Node_14["14: NodeType.VARIABLE - tokenAmountToRedeem = baseLot.mul(colls.amounts(i)).div(totalCollUSD).div(1e18)"]
    Node_14 --> Node_15
    Node_15["15: NodeType.EXPRESSION - finalAmounts(i) = colls.amounts(i).sub(tokenAmountToRedeem)"]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - singleRedemption.CollLot.amounts(i) = tokenAmountToRedeem"]
    Node_16 --> Node_17
    Node_17["17: NodeType.IF - whitelist.isWrapped(colls.tokens(i))"]
    Node_17 --> Node_18
    Node_17 --> Node_19
    Node_18["18: NodeType.EXPRESSION - IWAsset(colls.tokens(i)).updateReward(_borrower,address(this),tokenAmountToRedeem)"]
    Node_18 --> Node_19
    Node_19["19: NodeType.ENDIF - "]
    Node_19 --> Node_20
    Node_20["20: NodeType.EXPRESSION - ++ i"]
    Node_20 --> Node_13
    Node_21["21: NodeType.VARIABLE - newDebt = (troveManager.getTroveDebt(_borrower)).sub(singleRedemption.YUSDLot)"]
    Node_21 --> Node_22
    Node_22["22: NodeType.VARIABLE - newColl = _getVC(colls.tokens,finalAmounts)"]
    Node_22 --> Node_23
    Node_23["23: NodeType.IF - newDebt == YUSD_GAS_COMPENSATION"]
    Node_23 --> Node_24
    Node_23 --> Node_30
    Node_24["24: NodeType.EXPRESSION - troveManager.removeStakeTMR(_borrower)"]
    Node_24 --> Node_25
    Node_25["25: NodeType.EXPRESSION - troveManager.closeTroveRedemption(_borrower)"]
    Node_25 --> Node_26
    Node_26["26: NodeType.EXPRESSION - _redeemCloseTrove(_contractsCache,_borrower,YUSD_GAS_COMPENSATION,colls.tokens,finalAmounts)"]
    Node_26 --> Node_27
    Node_27["27: NodeType.VARIABLE - emptyTokens = new address()(0)"]
    Node_27 --> Node_28
    Node_28["28: NodeType.VARIABLE - emptyAmounts = new uint256()(0)"]
    Node_28 --> Node_29
    Node_29["29: NodeType.EXPRESSION - TroveUpdated(_borrower,0,emptyTokens,emptyAmounts,TroveManagerOperation.redeemCollateral)"]
    Node_29 --> Node_47
    Node_30["30: NodeType.VARIABLE - newICR = LiquityMath._computeCR(newColl,newDebt)"]
    Node_30 --> Node_31
    Node_31["31: NodeType.IF - newICR >= _partialRedemptionHintICR.add(2e16) || newICR <= _partialRedemptionHintICR.sub(2e16) || _getNetDebt(newDebt) < MIN_NET_DEBT"]
    Node_31 --> Node_32
    Node_31 --> Node_34
    Node_32["32: NodeType.EXPRESSION - singleRedemption.cancelledPartial = true"]
    Node_32 --> Node_33
    Node_33["33: NodeType.RETURN - singleRedemption"]
    Node_34["34: NodeType.ENDIF - "]
    Node_34 --> Node_35
    Node_35["35: NodeType.EXPRESSION - _contractsCache.sortedTroves.reInsert(_borrower,newICR,_upperPartialRedemptionHint,_lowerPartialRedemptionHint)"]
    Node_35 --> Node_36
    Node_36["36: NodeType.EXPRESSION - troveManager.updateTroveDebt(_borrower,newDebt)"]
    Node_36 --> Node_37
    Node_37["37: NodeType.VARIABLE - collsLen_scope_0 = colls.tokens.length"]
    Node_37 --> Node_40
    Node_38["38: NodeType.STARTLOOP - "]
    Node_38 --> Node_41
    Node_39["39: NodeType.ENDLOOP - "]
    Node_39 --> Node_44
    Node_40["40: NodeType.VARIABLE - "]
    Node_40 --> Node_38
    Node_41["41: NodeType.IFLOOP - i_scope_1 < collsLen_scope_0"]
    Node_41 --> Node_42
    Node_41 --> Node_39
    Node_42["42: NodeType.EXPRESSION - colls.amounts(i_scope_1) = finalAmounts(i_scope_1)"]
    Node_42 --> Node_43
    Node_43["43: NodeType.EXPRESSION - ++ i_scope_1"]
    Node_43 --> Node_41
    Node_44["44: NodeType.EXPRESSION - troveManager.updateTroveCollTMR(_borrower,colls.tokens,colls.amounts)"]
    Node_44 --> Node_45
    Node_45["45: NodeType.EXPRESSION - troveManager.updateStakeAndTotalStakes(_borrower)"]
    Node_45 --> Node_46
    Node_46["46: NodeType.EXPRESSION - TroveUpdated(_borrower,newDebt,colls.tokens,finalAmounts,TroveManagerOperation.redeemCollateral)"]
    Node_46 --> Node_47
    Node_47["47: NodeType.ENDIF - "]
    Node_47 --> Node_48
    Node_48["48: NodeType.RETURN - singleRedemption"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TroveManagerRedemptions.sol` on lines **505** to **613**

```solidity
    function _redeemCollateralFromTrove(
        ContractsCache memory _contractsCache,
        address _borrower,
        uint256 _maxYUSDAmount,
        address _upperPartialRedemptionHint,
        address _lowerPartialRedemptionHint,
        uint256 _partialRedemptionHintICR
    ) internal returns (SingleRedemptionValues memory singleRedemption) {
        // Determine the remaining amount (lot) to be redeemed, capped by the entire debt of the Trove minus the liquidation reserve
        singleRedemption.YUSDLot = LiquityMath._min(
            _maxYUSDAmount,
            troveManager.getTroveDebt(_borrower).sub(YUSD_GAS_COMPENSATION)
        );

        newColls memory colls;
        (colls.tokens, colls.amounts, ) = troveManager.getCurrentTroveState(_borrower);

        uint256 collsLen = colls.tokens.length;
        uint256[] memory finalAmounts = new uint256[](collsLen);


        // redemption addresses are the same as coll addresses for trove
        // Calculation for how much collateral to send of each type. 
        singleRedemption.CollLot.tokens = colls.tokens;
        singleRedemption.CollLot.amounts = new uint256[](collsLen);
        { // limit scope

            uint256 totalCollUSD = _getUSDColls(colls);
            uint256 baseLot = singleRedemption.YUSDLot.mul(DECIMAL_PRECISION);
            for (uint256 i; i < collsLen; ++i) {
                uint tokenAmountToRedeem = baseLot.mul(colls.amounts[i]).div(totalCollUSD).div(1e18);
                finalAmounts[i] = colls.amounts[i].sub(tokenAmountToRedeem);
                singleRedemption.CollLot.amounts[i] = tokenAmountToRedeem;
                // For wrapped assets, update the wrapped token reward to this contract temporarily 
                // to consolidate all trove's rewards. This is transferred all to the redeemer later. 
                if (whitelist.isWrapped(colls.tokens[i])) {
                    IWAsset(colls.tokens[i]).updateReward(_borrower, address(this), tokenAmountToRedeem);
                }
            }
        }

        // Decrease the debt and collateral of the current Trove according to the YUSD lot and corresponding Collateral to send
        uint256 newDebt = (troveManager.getTroveDebt(_borrower)).sub(singleRedemption.YUSDLot);
        uint256 newColl = _getVC(colls.tokens, finalAmounts); // VC given newAmounts in trove

        if (newDebt == YUSD_GAS_COMPENSATION) {
            // No debt left in the Trove (except for the liquidation reserve), therefore the trove gets closed
            troveManager.removeStakeTMR(_borrower);
            troveManager.closeTroveRedemption(_borrower);
            _redeemCloseTrove(
                _contractsCache,
                _borrower,
                YUSD_GAS_COMPENSATION,
                colls.tokens,
                finalAmounts
            );

            address[] memory emptyTokens = new address[](0);
            uint256[] memory emptyAmounts = new uint256[](0);

            emit TroveUpdated(
                _borrower,
                0,
                emptyTokens,
                emptyAmounts,
                TroveManagerOperation.redeemCollateral
            );
        } else {
            uint256 newICR = LiquityMath._computeCR(newColl, newDebt);

            /*
             * If the provided hint is too inaccurate of date, we bail since trying to reinsert without a good hint will almost
             * certainly result in running out of gas. Arbitrary measures of this mean newICR must be greater than hint ICR - 2%, 
             * and smaller than hint ICR + 2%.
             *
             * If the resultant net debt of the partial is less than the minimum, net debt we bail.
             */

            if (newICR >= _partialRedemptionHintICR.add(2e16) || 
                newICR <= _partialRedemptionHintICR.sub(2e16) || 
                _getNetDebt(newDebt) < MIN_NET_DEBT) {
                singleRedemption.cancelledPartial = true;
                return singleRedemption;
            }

            _contractsCache.sortedTroves.reInsert(
                _borrower,
                newICR,
                _upperPartialRedemptionHint,
                _lowerPartialRedemptionHint
            );

            troveManager.updateTroveDebt(_borrower, newDebt);
            uint256 collsLen = colls.tokens.length;
            for (uint256 i; i < collsLen; ++i) {
                colls.amounts[i] = finalAmounts[i];
            }
            troveManager.updateTroveCollTMR(_borrower, colls.tokens, colls.amounts);
            troveManager.updateStakeAndTotalStakes(_borrower);

            emit TroveUpdated(
                _borrower,
                newDebt,
                colls.tokens,
                finalAmounts,
                TroveManagerOperation.redeemCollateral
            );
        }
    }

```
