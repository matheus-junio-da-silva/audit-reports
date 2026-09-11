# Context: StabilityPoolTester._updateDepositAndSnapshots

**Contract:** `StabilityPoolTester` (Inherits: StabilityPool, IStabilityPool, ICollateralReceiver, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `_updateDepositAndSnapshots(address,uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** P, currentEpoch, currentScale, depositSnapshots, deposits, epochToScaleToG, epochToScaleToSum, whitelist
- **Writes:** depositSnapshots, deposits

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IWhitelist.TMP_878(address[]) = HIGH_LEVEL_CALL, dest:whitelist(IWhitelist), function:getValidCollateral, arguments:[]  `
- `IWhitelist.TMP_881(address[]) = HIGH_LEVEL_CALL, dest:whitelist(IWhitelist), function:getValidCollateral, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - deposits(_depositor).initialValue = _newValue"]
    Node_1 --> Node_2
    Node_2["2: NodeType.IF - _newValue == 0"]
    Node_2 --> Node_3
    Node_2 --> Node_18
    Node_3["3: NodeType.EXPRESSION - delete deposits(_depositor).frontEndTag"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - colls = whitelist.getValidCollateral()"]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - collsLen = colls.length"]
    Node_5 --> Node_8
    Node_6["6: NodeType.STARTLOOP - "]
    Node_6 --> Node_9
    Node_7["7: NodeType.ENDLOOP - "]
    Node_7 --> Node_12
    Node_8["8: NodeType.VARIABLE - "]
    Node_8 --> Node_6
    Node_9["9: NodeType.IFLOOP - i < collsLen"]
    Node_9 --> Node_10
    Node_9 --> Node_7
    Node_10["10: NodeType.EXPRESSION - depositSnapshots(_depositor).S(colls(i)) = 0"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - ++ i"]
    Node_11 --> Node_9
    Node_12["12: NodeType.EXPRESSION - depositSnapshots(_depositor).P = 0"]
    Node_12 --> Node_13
    Node_13["13: NodeType.EXPRESSION - depositSnapshots(_depositor).G = 0"]
    Node_13 --> Node_14
    Node_14["14: NodeType.EXPRESSION - depositSnapshots(_depositor).epoch = 0"]
    Node_14 --> Node_15
    Node_15["15: NodeType.EXPRESSION - depositSnapshots(_depositor).scale = 0"]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - DepositSnapshotUpdated(_depositor,0,0)"]
    Node_16 --> Node_17
    Node_17["17: NodeType.RETURN - "]
    Node_18["18: NodeType.ENDIF - "]
    Node_18 --> Node_19
    Node_19["19: NodeType.VARIABLE - currentScaleCached = currentScale"]
    Node_19 --> Node_20
    Node_20["20: NodeType.VARIABLE - currentEpochCached = currentEpoch"]
    Node_20 --> Node_21
    Node_21["21: NodeType.VARIABLE - currentP = P"]
    Node_21 --> Node_22
    Node_22["22: NodeType.VARIABLE - allColls = whitelist.getValidCollateral()"]
    Node_22 --> Node_23
    Node_23["23: NodeType.VARIABLE - allCollsLen = allColls.length"]
    Node_23 --> Node_26
    Node_24["24: NodeType.STARTLOOP - "]
    Node_24 --> Node_27
    Node_25["25: NodeType.ENDLOOP - "]
    Node_25 --> Node_32
    Node_26["26: NodeType.VARIABLE - "]
    Node_26 --> Node_24
    Node_27["27: NodeType.IFLOOP - i_scope_0 < allCollsLen"]
    Node_27 --> Node_28
    Node_27 --> Node_25
    Node_28["28: NodeType.VARIABLE - token = allColls(i_scope_0)"]
    Node_28 --> Node_29
    Node_29["29: NodeType.VARIABLE - currentSForToken = epochToScaleToSum(token)(currentEpochCached)(currentScaleCached)"]
    Node_29 --> Node_30
    Node_30["30: NodeType.EXPRESSION - depositSnapshots(_depositor).S(token) = currentSForToken"]
    Node_30 --> Node_31
    Node_31["31: NodeType.EXPRESSION - ++ i_scope_0"]
    Node_31 --> Node_27
    Node_32["32: NodeType.VARIABLE - currentG = epochToScaleToG(currentEpochCached)(currentScaleCached)"]
    Node_32 --> Node_33
    Node_33["33: NodeType.EXPRESSION - depositSnapshots(_depositor).P = currentP"]
    Node_33 --> Node_34
    Node_34["34: NodeType.EXPRESSION - depositSnapshots(_depositor).G = currentG"]
    Node_34 --> Node_35
    Node_35["35: NodeType.EXPRESSION - depositSnapshots(_depositor).scale = currentScaleCached"]
    Node_35 --> Node_36
    Node_36["36: NodeType.EXPRESSION - depositSnapshots(_depositor).epoch = currentEpochCached"]
    Node_36 --> Node_37
    Node_37["37: NodeType.EXPRESSION - DepositSnapshotUpdated(_depositor,currentP,currentG)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/StabilityPool.sol` on lines **998** to **1040**

```solidity
    function _updateDepositAndSnapshots(address _depositor, uint256 _newValue) internal {
        deposits[_depositor].initialValue = _newValue;

        if (_newValue == 0) {
            delete deposits[_depositor].frontEndTag;
            address[] memory colls = whitelist.getValidCollateral();
            uint256 collsLen = colls.length;
            for (uint256 i; i < collsLen; ++i) {
                depositSnapshots[_depositor].S[colls[i]] = 0;
            }
            depositSnapshots[_depositor].P = 0;
            depositSnapshots[_depositor].G = 0;
            depositSnapshots[_depositor].epoch = 0;
            depositSnapshots[_depositor].scale = 0;
            emit DepositSnapshotUpdated(_depositor, 0, 0);
            return;
        }
        uint128 currentScaleCached = currentScale;
        uint128 currentEpochCached = currentEpoch;
        uint256 currentP = P;

        address[] memory allColls = whitelist.getValidCollateral();

        // Get S and G for the current epoch and current scale
        uint256 allCollsLen = allColls.length;
        for (uint256 i; i < allCollsLen; ++i) {
            address token = allColls[i];
            uint256 currentSForToken = epochToScaleToSum[token][currentEpochCached][
                currentScaleCached
            ];
            depositSnapshots[_depositor].S[token] = currentSForToken;
        }

        uint256 currentG = epochToScaleToG[currentEpochCached][currentScaleCached];

        // Record new snapshots of the latest running product P, sum S, and sum G, for the depositor
        depositSnapshots[_depositor].P = currentP;
        depositSnapshots[_depositor].G = currentG;
        depositSnapshots[_depositor].scale = currentScaleCached;
        depositSnapshots[_depositor].epoch = currentEpochCached;

        emit DepositSnapshotUpdated(_depositor, currentP, currentG);
    }

```
