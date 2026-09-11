# Context: StabilityPoolTester._getCompoundedStakeFromSnapshots

**Contract:** `StabilityPoolTester` (Inherits: StabilityPool, IStabilityPool, ICollateralReceiver, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `_getCompoundedStakeFromSnapshots(uint256,StabilityPool.Snapshots) returns (uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** P, SCALE_FACTOR, currentEpoch, currentScale, depositSnapshots, frontEndSnapshots
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_849(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['initialStake', '1000000000'] `
- `SafeMath.TMP_846(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['initialStake', 'P'] `
- `SafeMath.TMP_847(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_846', 'snapshot_P'] `
- `SafeMath.TMP_844(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_843', 'snapshot_P'] `
- `SafeMath.TMP_843(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['initialStake', 'P'] `
- `LiquitySafeMath128.TMP_841(uint128) = LIBRARY_CALL, dest:LiquitySafeMath128, function:LiquitySafeMath128.sub(uint128,uint128), arguments:['currentScale', 'scaleSnapshot'] `
- `SafeMath.TMP_848(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_847', 'SCALE_FACTOR'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - snapshot_P = snapshots.P"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - scaleSnapshot = snapshots.scale"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - epochSnapshot = snapshots.epoch"]
    Node_3 --> Node_4
    Node_4["4: NodeType.IF - epochSnapshot < currentEpoch"]
    Node_4 --> Node_5
    Node_4 --> Node_6
    Node_5["5: NodeType.RETURN - 0"]
    Node_6["6: NodeType.ENDIF - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - "]
    Node_7 --> Node_8
    Node_8["8: NodeType.VARIABLE - scaleDiff = currentScale.sub(scaleSnapshot)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.IF - scaleDiff == 0"]
    Node_9 --> Node_10
    Node_9 --> Node_11
    Node_10["10: NodeType.EXPRESSION - compoundedStake = initialStake.mul(P).div(snapshot_P)"]
    Node_10 --> Node_15
    Node_11["11: NodeType.IF - scaleDiff == 1"]
    Node_11 --> Node_12
    Node_11 --> Node_13
    Node_12["12: NodeType.EXPRESSION - compoundedStake = initialStake.mul(P).div(snapshot_P).div(SCALE_FACTOR)"]
    Node_12 --> Node_14
    Node_13["13: NodeType.EXPRESSION - compoundedStake = 0"]
    Node_13 --> Node_14
    Node_14["14: NodeType.ENDIF - "]
    Node_14 --> Node_15
    Node_15["15: NodeType.ENDIF - "]
    Node_15 --> Node_16
    Node_16["16: NodeType.IF - compoundedStake < initialStake.div(1e9)"]
    Node_16 --> Node_17
    Node_16 --> Node_18
    Node_17["17: NodeType.RETURN - 0"]
    Node_18["18: NodeType.ENDIF - "]
    Node_18 --> Node_19
    Node_19["19: NodeType.RETURN - compoundedStake"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/StabilityPool.sol` on lines **884** to **928**

```solidity
    function _getCompoundedStakeFromSnapshots(uint256 initialStake, Snapshots storage snapshots)
        internal
        view
        returns (uint256)
    {
        uint256 snapshot_P = snapshots.P;
        uint128 scaleSnapshot = snapshots.scale;
        uint128 epochSnapshot = snapshots.epoch;

        // If stake was made before a pool-emptying event, then it has been fully cancelled with debt -- so, return 0
        if (epochSnapshot < currentEpoch) {
            return 0;
        }

        uint256 compoundedStake;
        uint128 scaleDiff = currentScale.sub(scaleSnapshot);

        /* Compute the compounded stake. If a scale change in P was made during the stake's lifetime,
         * account for it. If more than one scale change was made, then the stake has decreased by a factor of
         * at least 1e-9 -- so return 0.
         */
        if (scaleDiff == 0) {
            compoundedStake = initialStake.mul(P).div(snapshot_P);
        } else if (scaleDiff == 1) {
            compoundedStake = initialStake.mul(P).div(snapshot_P).div(SCALE_FACTOR);
        } else {
            // if scaleDiff >= 2
            compoundedStake = 0;
        }

        /*
         * If compounded deposit is less than a billionth of the initial deposit, return 0.
         *
         * NOTE: originally, this line was in place to stop rounding errors making the deposit too large. However, the error
         * corrections should ensure the error in P "favors the Pool", i.e. any given compounded deposit should slightly less
         * than it's theoretical value.
         *
         * Thus it's unclear whether this line is still really needed.
         */
        if (compoundedStake < initialStake.div(1e9)) {
            return 0;
        }

        return compoundedStake;
    }

```
