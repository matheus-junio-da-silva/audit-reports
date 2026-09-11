# Context: Allocation._calcVaultTargetDelta

**Contract:** `Allocation` (Inherits: IAllocation, Whitelist, Controllable, Ownable, Context, Constants)
**Signature:** `_calcVaultTargetDelta(SystemState,bool,bool) returns (StablecoinAllocationState)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `private`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** N_COINS, PERCENTAGE_DECIMAL_FACTOR, swapThreshold
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_146(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['REF_45', 'REF_47'] `
- `SafeMath.TMP_173(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['percent', 'REF_113'] `
- `SafeMath.TMP_172(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_171', 'swapOutTotalUsd'] `
- `SafeMath.TMP_164(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['vaultTargetUsd', 'REF_95'] `
- `SafeMath.TMP_147(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_146', 'PERCENTAGE_DECIMAL_FACTOR'] `
- `SafeMath.TMP_151(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['TMP_150', 'REF_59'] `
- `SafeMath.TMP_153(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['TMP_151', 'TMP_152'] `
- `SafeMath.TMP_150(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['REF_55', 'REF_57'] `
- `SafeMath.TMP_177(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['curveCurrentAssetsUsd', 'REF_119'] `
- `SafeMath.TMP_148(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['REF_49', 'REF_51'] `
- `SafeMath.TMP_161(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['REF_78', 'vaultTargetUsd'] `
- `IController.TMP_140(address) = HIGH_LEVEL_CALL, dest:TMP_139(IController), function:lifeGuard, arguments:[]  `
- `SafeMath.TMP_149(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['REF_52', 'REF_54'] `
- `SafeMath.TMP_166(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['swapOutTotalUsd', 'REF_102'] `
- `ILifeGuard.TMP_142(address) = HIGH_LEVEL_CALL, dest:lg(ILifeGuard), function:getBuoy, arguments:[]  `
- `SafeMath.TMP_155(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['amountToRebalance', 'REF_64'] `
- `SafeMath.TMP_171(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['REF_108', 'PERCENTAGE_DECIMAL_FACTOR'] `
- `SafeMath.TMP_163(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['REF_87', 'REF_90'] `
- `ILifeGuard.TMP_152(uint256) = HIGH_LEVEL_CALL, dest:lg(ILifeGuard), function:availableUsd, arguments:[]  `
- `SafeMath.TMP_156(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_155', 'PERCENTAGE_DECIMAL_FACTOR'] `
- `SafeMath.TMP_160(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['REF_73', 'vaultTargetAssets'] `
- `IBuoy.TMP_180(uint256) = HIGH_LEVEL_CALL, dest:buoy(IBuoy), function:singleStableFromUsd, arguments:['vaultTargetUsd', 'TMP_179']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - lg = ILifeGuard(_controller().lifeGuard())"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - buoy = IBuoy(lg.getBuoy())"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.IF - includeCurveVault && needCurveVault(sysState)"]
    Node_4 --> Node_5
    Node_4 --> Node_9
    Node_5["5: NodeType.EXPRESSION - stableState.curveTargetUsd = sysState.totalCurrentAssetsUsd.mul(sysState.curvePercent).div(PERCENTAGE_DECIMAL_FACTOR)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - amountToRebalance = sysState.totalCurrentAssetsUsd.sub(stableState.curveTargetUsd)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - curveCurrentAssetsUsd = sysState.lifeguardCurrentAssetsUsd.add(sysState.curveCurrentAssetsUsd)"]
    Node_7 --> Node_50
    Node_9["9: NodeType.EXPRESSION - amountToRebalance = sysState.totalCurrentAssetsUsd.sub(sysState.curveCurrentAssetsUsd).sub(sysState.lifeguardCurrentAssetsUsd).add(lg.availableUsd())"]
    Node_9 --> Node_10
    Node_10["10: NodeType.ENDIF - "]
    Node_10 --> Node_11
    Node_11["11: NodeType.VARIABLE - swapOutTotalUsd = 0"]
    Node_11 --> Node_14
    Node_12["12: NodeType.STARTLOOP - "]
    Node_12 --> Node_15
    Node_13["13: NodeType.ENDLOOP - "]
    Node_13 --> Node_39
    Node_14["14: NodeType.VARIABLE - i = 0"]
    Node_14 --> Node_12
    Node_15["15: NodeType.IFLOOP - i < N_COINS"]
    Node_15 --> Node_16
    Node_15 --> Node_13
    Node_16["16: NodeType.VARIABLE - vaultTargetUsd = amountToRebalance.mul(sysState.stablePercents(i)).div(PERCENTAGE_DECIMAL_FACTOR)"]
    Node_16 --> Node_17
    Node_17["17: NodeType.VARIABLE - "]
    Node_17 --> Node_18
    Node_18["18: NodeType.IF - ! onlySwapOut"]
    Node_18 --> Node_54
    Node_18 --> Node_21
    Node_20["20: NodeType.EXPRESSION - stableState.vaultsTargetUsd(i) = vaultTargetUsd"]
    Node_20 --> Node_21
    Node_21["21: NodeType.ENDIF - "]
    Node_21 --> Node_22
    Node_22["22: NodeType.IF - sysState.vaultCurrentAssetsUsd(i) > vaultTargetUsd"]
    Node_22 --> Node_23
    Node_22 --> Node_32
    Node_23["23: NodeType.IF - ! onlySwapOut"]
    Node_23 --> Node_24
    Node_23 --> Node_31
    Node_24["24: NodeType.EXPRESSION - stableState.swapInAmounts(i) = sysState.vaultCurrentAssets(i).sub(vaultTargetAssets)"]
    Node_24 --> Node_25
    Node_25["25: NodeType.EXPRESSION - stableState.swapInAmountsUsd(i) = sysState.vaultCurrentAssetsUsd(i).sub(vaultTargetUsd)"]
    Node_25 --> Node_26
    Node_26["26: NodeType.IF - invalidDelta(swapThreshold,stableState.swapInAmountsUsd(i))"]
    Node_26 --> Node_27
    Node_26 --> Node_29
    Node_27["27: NodeType.EXPRESSION - stableState.swapInAmounts(i) = 0"]
    Node_27 --> Node_28
    Node_28["28: NodeType.EXPRESSION - stableState.swapInAmountsUsd(i) = 0"]
    Node_28 --> Node_30
    Node_29["29: NodeType.EXPRESSION - stableState.swapInTotalAmountUsd = stableState.swapInTotalAmountUsd.add(stableState.swapInAmountsUsd(i))"]
    Node_29 --> Node_30
    Node_30["30: NodeType.ENDIF - "]
    Node_30 --> Node_31
    Node_31["31: NodeType.ENDIF - "]
    Node_31 --> Node_37
    Node_32["32: NodeType.EXPRESSION - stableState.swapOutPercents(i) = vaultTargetUsd.sub(sysState.vaultCurrentAssetsUsd(i))"]
    Node_32 --> Node_33
    Node_33["33: NodeType.IF - invalidDelta(swapThreshold,stableState.swapOutPercents(i))"]
    Node_33 --> Node_34
    Node_33 --> Node_35
    Node_34["34: NodeType.EXPRESSION - stableState.swapOutPercents(i) = 0"]
    Node_34 --> Node_36
    Node_35["35: NodeType.EXPRESSION - swapOutTotalUsd = swapOutTotalUsd.add(stableState.swapOutPercents(i))"]
    Node_35 --> Node_36
    Node_36["36: NodeType.ENDIF - "]
    Node_36 --> Node_37
    Node_37["37: NodeType.ENDIF - "]
    Node_37 --> Node_38
    Node_38["38: NodeType.EXPRESSION - i ++"]
    Node_38 --> Node_15
    Node_39["39: NodeType.VARIABLE - percent = PERCENTAGE_DECIMAL_FACTOR"]
    Node_39 --> Node_42
    Node_40["40: NodeType.STARTLOOP - "]
    Node_40 --> Node_43
    Node_41["41: NodeType.ENDLOOP - "]
    Node_41 --> Node_49
    Node_42["42: NodeType.VARIABLE - i_scope_0 = 0"]
    Node_42 --> Node_40
    Node_43["43: NodeType.IFLOOP - i_scope_0 < N_COINS - 1"]
    Node_43 --> Node_44
    Node_43 --> Node_41
    Node_44["44: NodeType.IF - stableState.swapOutPercents(i_scope_0) > 0"]
    Node_44 --> Node_45
    Node_44 --> Node_47
    Node_45["45: NodeType.EXPRESSION - stableState.swapOutPercents(i_scope_0) = stableState.swapOutPercents(i_scope_0).mul(PERCENTAGE_DECIMAL_FACTOR).div(swapOutTotalUsd)"]
    Node_45 --> Node_46
    Node_46["46: NodeType.EXPRESSION - percent = percent.sub(stableState.swapOutPercents(i_scope_0))"]
    Node_46 --> Node_47
    Node_47["47: NodeType.ENDIF - "]
    Node_47 --> Node_48
    Node_48["48: NodeType.EXPRESSION - i_scope_0 ++"]
    Node_48 --> Node_43
    Node_49["49: NodeType.EXPRESSION - stableState.swapOutPercents(N_COINS - 1) = percent"]
    Node_49 --> Node_58
    Node_50["50: NodeType.IF - curveCurrentAssetsUsd > stableState.curveTargetUsd"]
    Node_50 --> Node_51
    Node_50 --> Node_52
    Node_51["51: NodeType.EXPRESSION - stableState.curveTargetDeltaUsd = curveCurrentAssetsUsd.sub(stableState.curveTargetUsd)"]
    Node_51 --> Node_53
    Node_52["52: NodeType.EXPRESSION - stableState.curveTargetDeltaUsd = 0"]
    Node_52 --> Node_53
    Node_53["53: NodeType.ENDIF - "]
    Node_53 --> Node_10
    Node_54["54: NodeType.IF - vaultTargetUsd == 0"]
    Node_54 --> Node_55
    Node_54 --> Node_56
    Node_55["55: NodeType.EXPRESSION - vaultTargetAssets = 0"]
    Node_55 --> Node_57
    Node_56["56: NodeType.EXPRESSION - vaultTargetAssets = buoy.singleStableFromUsd(vaultTargetUsd,int128(i))"]
    Node_56 --> Node_57
    Node_57["57: NodeType.ENDIF - "]
    Node_57 --> Node_20
    Node_58["58: NodeType.RETURN - stableState"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/insurance/Allocation.sol` on lines **165** to **256**

```solidity
    function _calcVaultTargetDelta(
        SystemState memory sysState,
        bool onlySwapOut,
        bool includeCurveVault
    ) private view returns (StablecoinAllocationState memory stableState) {
        ILifeGuard lg = ILifeGuard(_controller().lifeGuard());
        IBuoy buoy = IBuoy(lg.getBuoy());

        uint256 amountToRebalance;
        // The rebalance may only be possible by moving assets out of the Curve vault,
        //  as Curve adds exposure to all stablecoins
        if (includeCurveVault && needCurveVault(sysState)) {
            stableState.curveTargetUsd = sysState.totalCurrentAssetsUsd.mul(sysState.curvePercent).div(
                PERCENTAGE_DECIMAL_FACTOR
            );
            // Estimate how much needs to be moved out of the Curve vault
            amountToRebalance = sysState.totalCurrentAssetsUsd.sub(stableState.curveTargetUsd);
            // When establishing current Curve exposures, we include uninvested assets in the lifeguard
            // as part of the Curve vault, otherwise I rebalance could temporarily fix an overexposure,
            // just to have to deal with the same overexposure when the lifeguard assets get invested
            // into the Curve vault.
            uint256 curveCurrentAssetsUsd = sysState.lifeguardCurrentAssetsUsd.add(sysState.curveCurrentAssetsUsd);
            stableState.curveTargetDeltaUsd = curveCurrentAssetsUsd > stableState.curveTargetUsd
                ? curveCurrentAssetsUsd.sub(stableState.curveTargetUsd)
                : 0;
        } else {
            // If we dont have to consider the Curve vault, Remove Curve assets and the part in lifeguard for Curve
            // from the rebalance calculations
            amountToRebalance = sysState
            .totalCurrentAssetsUsd
            .sub(sysState.curveCurrentAssetsUsd)
            .sub(sysState.lifeguardCurrentAssetsUsd)
            .add(lg.availableUsd());
        }

        // Calculate the strategy amount by vaultAssets * percentOfStrategy
        uint256 swapOutTotalUsd = 0;
        for (uint256 i = 0; i < N_COINS; i++) {
            // Compare allocation targets with actual assets in vault -
            //   if onlySwapOut = True, we don't consider the the current assets in the vault,
            //   but rather how much we need to remove from the vault based on target allocations.
            //   This means that the removal amount gets split throughout the vaults based on
            //   the allocation targets, rather than the difference between the allocation target
            //   and the actual amount of assets in the vault.
            uint256 vaultTargetUsd = amountToRebalance.mul(sysState.stablePercents[i]).div(PERCENTAGE_DECIMAL_FACTOR);
            uint256 vaultTargetAssets;
            if (!onlySwapOut) {
                vaultTargetAssets = vaultTargetUsd == 0 ? 0 : buoy.singleStableFromUsd(vaultTargetUsd, int128(i));
                stableState.vaultsTargetUsd[i] = vaultTargetUsd;
            }

            // More than target
            if (sysState.vaultCurrentAssetsUsd[i] > vaultTargetUsd) {
                if (!onlySwapOut) {
                    stableState.swapInAmounts[i] = sysState.vaultCurrentAssets[i].sub(vaultTargetAssets);
                    stableState.swapInAmountsUsd[i] = sysState.vaultCurrentAssetsUsd[i].sub(vaultTargetUsd);
                    // Make sure that that the change in vault asset is large enough to
                    // justify rebalancing the vault
                    if (invalidDelta(swapThreshold, stableState.swapInAmountsUsd[i])) {
                        stableState.swapInAmounts[i] = 0;
                        stableState.swapInAmountsUsd[i] = 0;
                    } else {
                        stableState.swapInTotalAmountUsd = stableState.swapInTotalAmountUsd.add(
                            stableState.swapInAmountsUsd[i]
                        );
                    }
                }
                // Less than target
            } else {
                stableState.swapOutPercents[i] = vaultTargetUsd.sub(sysState.vaultCurrentAssetsUsd[i]);
                // Make sure that that the change in vault asset is large enough to
                // justify rebalancing the vault
                if (invalidDelta(swapThreshold, stableState.swapOutPercents[i])) {
                    stableState.swapOutPercents[i] = 0;
                } else {
                    swapOutTotalUsd = swapOutTotalUsd.add(stableState.swapOutPercents[i]);
                }
            }
        }

        // Establish percentage (BP) amount for change in each vault
        uint256 percent = PERCENTAGE_DECIMAL_FACTOR;
        for (uint256 i = 0; i < N_COINS - 1; i++) {
            if (stableState.swapOutPercents[i] > 0) {
                stableState.swapOutPercents[i] = stableState.swapOutPercents[i].mul(PERCENTAGE_DECIMAL_FACTOR).div(
                    swapOutTotalUsd
                );
                percent = percent.sub(stableState.swapOutPercents[i]);
            }
        }
        stableState.swapOutPercents[N_COINS - 1] = percent;
    }

```
