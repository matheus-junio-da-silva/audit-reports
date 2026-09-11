# Context: StabilityPoolTester._updateFrontEndStakeAndSnapshots

**Contract:** `StabilityPoolTester` (Inherits: StabilityPool, IStabilityPool, ICollateralReceiver, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `_updateFrontEndStakeAndSnapshots(address,uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** P, currentEpoch, currentScale, epochToScaleToG, frontEndSnapshots
- **Writes:** frontEndSnapshots, frontEndStakes

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
    Node_1["1: NodeType.EXPRESSION - frontEndStakes(_frontEnd) = _newValue"]
    Node_1 --> Node_2
    Node_2["2: NodeType.IF - _newValue == 0"]
    Node_2 --> Node_3
    Node_2 --> Node_6
    Node_3["3: NodeType.EXPRESSION - delete frontEndSnapshots(_frontEnd)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - FrontEndSnapshotUpdated(_frontEnd,0,0)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.RETURN - "]
    Node_6["6: NodeType.ENDIF - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - currentScaleCached = currentScale"]
    Node_7 --> Node_8
    Node_8["8: NodeType.VARIABLE - currentEpochCached = currentEpoch"]
    Node_8 --> Node_9
    Node_9["9: NodeType.VARIABLE - currentP = P"]
    Node_9 --> Node_10
    Node_10["10: NodeType.VARIABLE - currentG = epochToScaleToG(currentEpochCached)(currentScaleCached)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - frontEndSnapshots(_frontEnd).P = currentP"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - frontEndSnapshots(_frontEnd).G = currentG"]
    Node_12 --> Node_13
    Node_13["13: NodeType.EXPRESSION - frontEndSnapshots(_frontEnd).scale = currentScaleCached"]
    Node_13 --> Node_14
    Node_14["14: NodeType.EXPRESSION - frontEndSnapshots(_frontEnd).epoch = currentEpochCached"]
    Node_14 --> Node_15
    Node_15["15: NodeType.EXPRESSION - FrontEndSnapshotUpdated(_frontEnd,currentP,currentG)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/StabilityPool.sol` on lines **1042** to **1065**

```solidity
    function _updateFrontEndStakeAndSnapshots(address _frontEnd, uint256 _newValue) internal {
        frontEndStakes[_frontEnd] = _newValue;

        if (_newValue == 0) {
            delete frontEndSnapshots[_frontEnd];
            emit FrontEndSnapshotUpdated(_frontEnd, 0, 0);
            return;
        }

        uint128 currentScaleCached = currentScale;
        uint128 currentEpochCached = currentEpoch;
        uint256 currentP = P;

        // Get G for the current epoch and current scale
        uint256 currentG = epochToScaleToG[currentEpochCached][currentScaleCached];

        // Record new snapshots of the latest running product P and sum G for the front end
        frontEndSnapshots[_frontEnd].P = currentP;
        frontEndSnapshots[_frontEnd].G = currentG;
        frontEndSnapshots[_frontEnd].scale = currentScaleCached;
        frontEndSnapshots[_frontEnd].epoch = currentEpochCached;

        emit FrontEndSnapshotUpdated(_frontEnd, currentP, currentG);
    }

```
