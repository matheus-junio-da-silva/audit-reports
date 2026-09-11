# Context: Insurance._rebalance

**Contract:** `Insurance` (Inherits: IInsurance, Whitelist, Controllable, Ownable, Context, Constants)
**Signature:** `_rebalance(AllocationState)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `private`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** N_COINS
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `ILifeGuard.TMP_307(uint256) = HIGH_LEVEL_CALL, dest:lg(ILifeGuard), function:depositStable, arguments:['True']  `
- `ILifeGuard.TMP_294(address) = HIGH_LEVEL_CALL, dest:lg(ILifeGuard), function:getBuoy, arguments:[]  `
- `ILifeGuard.TMP_318(uint256) = HIGH_LEVEL_CALL, dest:lg(ILifeGuard), function:depositStable, arguments:['False']  `
- `ILifeGuard.TMP_321(uint256) = HIGH_LEVEL_CALL, dest:lg(ILifeGuard), function:invest, arguments:['0', '_swapOutPercents']  `
- `IController.TMP_310(address) = HIGH_LEVEL_CALL, dest:TMP_309(IController), function:curveVault, arguments:[]  `
- `SafeMath.TMP_312(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['curveDeltaUsd', 'usdAmount'] `
- `IVault.HIGH_LEVEL_CALL, dest:TMP_300(IVault), function:withdrawByStrategyIndex, arguments:['amount', 'TMP_302', 'REF_152']  `
- `IController.TMP_292(address[3]) = HIGH_LEVEL_CALL, dest:TMP_291(IController), function:vaults, arguments:[]  `
- `IBuoy.TMP_313(uint256) = HIGH_LEVEL_CALL, dest:buoy(IBuoy), function:usdToLp, arguments:['TMP_312']  `
- `ILifeGuard.TMP_306(uint256) = HIGH_LEVEL_CALL, dest:lg(ILifeGuard), function:totalAssetsUsd, arguments:[]  `
- `IVault.HIGH_LEVEL_CALL, dest:TMP_311(IVault), function:withdraw, arguments:['TMP_313', 'TMP_314']  `
- `IVault.TMP_302(address) = HIGH_LEVEL_CALL, dest:TMP_301(IVault), function:vault, arguments:[]  `
- `IBuoy.TMP_299(uint256) = HIGH_LEVEL_CALL, dest:buoy(IBuoy), function:singleStableFromUsd, arguments:['REF_147', 'TMP_298']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - vaults = _controller().vaults()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - lg = getLifeGuard()"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - buoy = IBuoy(lg.getBuoy())"]
    Node_3 --> Node_4
    Node_4["4: NodeType.IF - allState.needProtocolWithdrawal"]
    Node_4 --> Node_7
    Node_4 --> Node_14
    Node_5["5: NodeType.STARTLOOP - "]
    Node_5 --> Node_8
    Node_6["6: NodeType.ENDLOOP - "]
    Node_6 --> Node_14
    Node_7["7: NodeType.VARIABLE - i = 0"]
    Node_7 --> Node_5
    Node_8["8: NodeType.IFLOOP - i < N_COINS"]
    Node_8 --> Node_9
    Node_8 --> Node_6
    Node_9["9: NodeType.IF - allState.protocolWithdrawalUsd(i) > 0"]
    Node_9 --> Node_10
    Node_9 --> Node_12
    Node_10["10: NodeType.VARIABLE - amount = buoy.singleStableFromUsd(allState.protocolWithdrawalUsd(i),int128(i))"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - IVault(vaults(i)).withdrawByStrategyIndex(amount,IVault(vaults(i)).vault(),allState.protocolExposedIndex)"]
    Node_11 --> Node_12
    Node_12["12: NodeType.ENDIF - "]
    Node_12 --> Node_13
    Node_13["13: NodeType.EXPRESSION - i ++"]
    Node_13 --> Node_8
    Node_14["14: NodeType.ENDIF - "]
    Node_14 --> Node_40
    Node_16["16: NodeType.VARIABLE - curveDeltaUsd = allState.stableState.curveTargetDeltaUsd"]
    Node_16 --> Node_17
    Node_17["17: NodeType.IF - curveDeltaUsd > 0"]
    Node_17 --> Node_18
    Node_17 --> Node_23
    Node_18["18: NodeType.VARIABLE - usdAmount = lg.totalAssetsUsd()"]
    Node_18 --> Node_19
    Node_19["19: NodeType.EXPRESSION - lg.depositStable(true)"]
    Node_19 --> Node_20
    Node_20["20: NodeType.IF - usdAmount < curveDeltaUsd"]
    Node_20 --> Node_21
    Node_20 --> Node_22
    Node_21["21: NodeType.EXPRESSION - IVault(_controller().curveVault()).withdraw(buoy.usdToLp(curveDeltaUsd.sub(usdAmount)),address(lg))"]
    Node_21 --> Node_22
    Node_22["22: NodeType.ENDIF - "]
    Node_22 --> Node_23
    Node_23["23: NodeType.ENDIF - "]
    Node_23 --> Node_24
    Node_24["24: NodeType.IF - curveDeltaUsd == 0 && hasWithdrawal"]
    Node_24 --> Node_25
    Node_24 --> Node_26
    Node_25["25: NodeType.EXPRESSION - lg.depositStable(false)"]
    Node_25 --> Node_26
    Node_26["26: NodeType.ENDIF - "]
    Node_26 --> Node_29
    Node_27["27: NodeType.STARTLOOP - "]
    Node_27 --> Node_30
    Node_28["28: NodeType.ENDLOOP - "]
    Node_29["29: NodeType.VARIABLE - i_scope_0 = 0"]
    Node_29 --> Node_27
    Node_30["30: NodeType.IFLOOP - i_scope_0 < N_COINS"]
    Node_30 --> Node_31
    Node_30 --> Node_28
    Node_31["31: NodeType.IF - allState.stableState.swapOutPercents(i_scope_0) > 0"]
    Node_31 --> Node_32
    Node_31 --> Node_38
    Node_32["32: NodeType.VARIABLE - "]
    Node_32 --> Node_33
    Node_33["33: NodeType.EXPRESSION - _swapOutPercents(0) = allState.stableState.swapOutPercents(0)"]
    Node_33 --> Node_34
    Node_34["34: NodeType.EXPRESSION - _swapOutPercents(1) = allState.stableState.swapOutPercents(1)"]
    Node_34 --> Node_35
    Node_35["35: NodeType.EXPRESSION - _swapOutPercents(2) = allState.stableState.swapOutPercents(2)"]
    Node_35 --> Node_36
    Node_36["36: NodeType.EXPRESSION - lg.invest(0,_swapOutPercents)"]
    Node_36 --> Node_37
    Node_37["37: NodeType.BREAK - "]
    Node_37 --> Node_28
    Node_38["38: NodeType.ENDIF - "]
    Node_38 --> Node_39
    Node_39["39: NodeType.EXPRESSION - i_scope_0 ++"]
    Node_39 --> Node_30
    Node_40["40: NodeType.IF - allState.needProtocolWithdrawal"]
    Node_40 --> Node_41
    Node_40 --> Node_42
    Node_41["41: NodeType.EXPRESSION - hasWithdrawal = moveAssetsFromVaultsToLifeguard(vaults,allState.stableState.swapInAmounts,lg,0,allState.strategyTargetRatio)"]
    Node_41 --> Node_43
    Node_42["42: NodeType.EXPRESSION - hasWithdrawal = moveAssetsFromVaultsToLifeguard(vaults,allState.stableState.swapInAmounts,lg,allState.protocolExposedIndex,allState.strategyTargetRatio)"]
    Node_42 --> Node_43
    Node_43["43: NodeType.ENDIF - "]
    Node_43 --> Node_16
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/insurance/Insurance.sol` on lines **443** to **499**

```solidity
    function _rebalance(AllocationState memory allState) private {
        address[N_COINS] memory vaults = _controller().vaults();
        ILifeGuard lg = getLifeGuard();
        IBuoy buoy = IBuoy(lg.getBuoy());
        // Withdraw from strategies that are overexposed
        if (allState.needProtocolWithdrawal) {
            for (uint256 i = 0; i < N_COINS; i++) {
                if (allState.protocolWithdrawalUsd[i] > 0) {
                    uint256 amount = buoy.singleStableFromUsd(allState.protocolWithdrawalUsd[i], int128(i));
                    IVault(vaults[i]).withdrawByStrategyIndex(
                        amount,
                        IVault(vaults[i]).vault(),
                        allState.protocolExposedIndex
                    );
                }
            }
        }

        bool hasWithdrawal = moveAssetsFromVaultsToLifeguard(
            vaults,
            allState.stableState.swapInAmounts,
            lg,
            allState.needProtocolWithdrawal ? 0 : allState.protocolExposedIndex,
            allState.strategyTargetRatio // Only adjust strategy ratio here
        );

        // Withdraw from Curve vault
        uint256 curveDeltaUsd = allState.stableState.curveTargetDeltaUsd;
        if (curveDeltaUsd > 0) {
            uint256 usdAmount = lg.totalAssetsUsd();
            // This step moves all lifeguard assets into swap out stablecoin vaults, it might cause
            // protocol over exposure in some edge cases after invest/harvest. But it won't have a
            // large impact on the system, as investToCurve should be run periodically by external actors,
            // minimising the total amount of assets in the lifeguard.
            //   - Its recommended to check the total assets in the lifeguard and run the invest to curve
            //   trigger() to determine if investToCurve needs to be run manually before rebalance
            lg.depositStable(true);
            if (usdAmount < curveDeltaUsd) {
                IVault(_controller().curveVault()).withdraw(buoy.usdToLp(curveDeltaUsd.sub(usdAmount)), address(lg));
            }
        }

        if (curveDeltaUsd == 0 && hasWithdrawal) lg.depositStable(false);

        // Keep buffer asset in lifeguard and convert the rest of the assets to target stablecoin.
        // If swapOutPercent all are zero, don't run prepareInvestment
        for (uint256 i = 0; i < N_COINS; i++) {
            if (allState.stableState.swapOutPercents[i] > 0) {
                uint256[N_COINS] memory _swapOutPercents;
                _swapOutPercents[0] = allState.stableState.swapOutPercents[0];
                _swapOutPercents[1] = allState.stableState.swapOutPercents[1];
                _swapOutPercents[2] = allState.stableState.swapOutPercents[2];
                lg.invest(0, _swapOutPercents);
                break;
            }
        }
    }

```
