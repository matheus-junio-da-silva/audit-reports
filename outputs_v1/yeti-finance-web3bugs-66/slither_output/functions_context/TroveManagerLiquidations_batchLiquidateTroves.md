# Context: TroveManagerLiquidations.batchLiquidateTroves

**Contract:** `TroveManagerLiquidations` (Inherits: ITroveManagerLiquidations, TroveManagerBase, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `batchLiquidateTroves(address[],address)`
**Method Selector ID:** `0xe369e4ab`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** activePool, collSurplusPool, defaultPool, stabilityPoolContract, troveManager
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_troveArray.length != 0,TML: One trove must exist)`
- require/assert: `require(bool,string)(totals.totalDebtInSequence != 0,TML: nothing to liquidate)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IActivePool.TMP_472(bool) = HIGH_LEVEL_CALL, dest:activePoolCached(IActivePool), function:sendCollaterals, arguments:['TMP_471', 'REF_557', 'REF_559']  `
- `ITroveManager.HIGH_LEVEL_CALL, dest:troveManager(ITroveManager), function:updateSystemSnapshots_excludeCollRemainder, arguments:['activePoolCached', 'REF_562', 'REF_564']  `
- `IStabilityPool.TMP_462(uint256) = HIGH_LEVEL_CALL, dest:stabilityPoolCached(IStabilityPool), function:getTotalYUSDDeposits, arguments:[]  `
- `IStabilityPool.HIGH_LEVEL_CALL, dest:stabilityPoolCached(IStabilityPool), function:offset, arguments:['REF_543', 'REF_545', 'REF_547']  `
- `ITroveManager.HIGH_LEVEL_CALL, dest:troveManager(ITroveManager), function:redistributeDebtAndColl, arguments:['activePoolCached', 'defaultPoolCached', 'REF_549', 'REF_551', 'REF_553']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - _requireCallerisTroveManager()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(_troveArray.length != 0,TML: One trove must exist)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - activePoolCached = activePool"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - defaultPoolCached = defaultPool"]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - stabilityPoolCached = stabilityPoolContract"]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - "]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - vars.YUSDInStabPool = stabilityPoolCached.getTotalYUSDDeposits()"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - vars.recoveryModeAtStart = _checkRecoveryMode()"]
    Node_9 --> Node_10
    Node_10["10: NodeType.IF - vars.recoveryModeAtStart"]
    Node_10 --> Node_11
    Node_10 --> Node_12
    Node_11["11: NodeType.EXPRESSION - totals = _getTotalFromBatchLiquidate_RecoveryMode(activePoolCached,defaultPoolCached,vars.YUSDInStabPool,_troveArray)"]
    Node_11 --> Node_13
    Node_12["12: NodeType.EXPRESSION - totals = _getTotalsFromBatchLiquidate_NormalMode(activePoolCached,defaultPoolCached,vars.YUSDInStabPool,_troveArray)"]
    Node_12 --> Node_13
    Node_13["13: NodeType.ENDIF - "]
    Node_13 --> Node_14
    Node_14["14: NodeType.EXPRESSION - require(bool,string)(totals.totalDebtInSequence != 0,TML: nothing to liquidate)"]
    Node_14 --> Node_15
    Node_15["15: NodeType.EXPRESSION - stabilityPoolCached.offset(totals.totalDebtToOffset,totals.totalCollToSendToSP.tokens,totals.totalCollToSendToSP.amounts)"]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - troveManager.redistributeDebtAndColl(activePoolCached,defaultPoolCached,totals.totalDebtToRedistribute,totals.totalCollToRedistribute.tokens,totals.totalCollToRedistribute.amounts)"]
    Node_16 --> Node_17
    Node_17["17: NodeType.IF - _CollsIsNonZero(totals.totalCollSurplus)"]
    Node_17 --> Node_18
    Node_17 --> Node_19
    Node_18["18: NodeType.EXPRESSION - activePoolCached.sendCollaterals(address(collSurplusPool),totals.totalCollSurplus.tokens,totals.totalCollSurplus.amounts)"]
    Node_18 --> Node_19
    Node_19["19: NodeType.ENDIF - "]
    Node_19 --> Node_20
    Node_20["20: NodeType.EXPRESSION - troveManager.updateSystemSnapshots_excludeCollRemainder(activePoolCached,totals.totalCollGasCompensation.tokens,totals.totalCollGasCompensation.amounts)"]
    Node_20 --> Node_21
    Node_21["21: NodeType.EXPRESSION - vars.liquidatedDebt = totals.totalDebtInSequence"]
    Node_21 --> Node_22
    Node_22["22: NodeType.VARIABLE - sumCollsResult = _sumColls(totals.totalCollToSendToSP,totals.totalCollToRedistribute)"]
    Node_22 --> Node_23
    Node_23["23: NodeType.EXPRESSION - sumCollsResult = _sumColls(sumCollsResult,totals.totalCollSurplus)"]
    Node_23 --> Node_24
    Node_24["24: NodeType.EXPRESSION - Liquidation(vars.liquidatedDebt,totals.totalYUSDGasCompensation,sumCollsResult.tokens,sumCollsResult.amounts,totals.totalCollGasCompensation.tokens,totals.totalCollGasCompensation.amounts)"]
    Node_24 --> Node_25
    Node_25["25: NodeType.EXPRESSION - _sendGasCompensation(activePoolCached,_liquidator,totals.totalYUSDGasCompensation,totals.totalCollGasCompensation.tokens,totals.totalCollGasCompensation.amounts)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TroveManagerLiquidations.sol` on lines **171** to **257**

```solidity
    function batchLiquidateTroves(address[] memory _troveArray, address _liquidator) external override {
        _requireCallerisTroveManager();
        require(_troveArray.length != 0, "TML: One trove must exist");

        IActivePool activePoolCached = activePool;
        IDefaultPool defaultPoolCached = defaultPool;
        IStabilityPool stabilityPoolCached = stabilityPoolContract;

        LocalVariables_OuterLiquidationFunction memory vars;
        LiquidationTotals memory totals;

        vars.YUSDInStabPool = stabilityPoolCached.getTotalYUSDDeposits();
        vars.recoveryModeAtStart = _checkRecoveryMode();

        // Perform the appropriate liquidation sequence - tally values and obtain their totals.
        if (vars.recoveryModeAtStart) {
            totals = _getTotalFromBatchLiquidate_RecoveryMode(
                activePoolCached,
                defaultPoolCached,
                vars.YUSDInStabPool,
                _troveArray
            );
        } else {
            //  if !vars.recoveryModeAtStart
            totals = _getTotalsFromBatchLiquidate_NormalMode(
                activePoolCached,
                defaultPoolCached,
                vars.YUSDInStabPool,
                _troveArray
            );
        }

        require(totals.totalDebtInSequence != 0, "TML: nothing to liquidate");
        // Move liquidated Collateral and YUSD to the appropriate pools
        stabilityPoolCached.offset(
            totals.totalDebtToOffset,
            totals.totalCollToSendToSP.tokens,
            totals.totalCollToSendToSP.amounts
        );
        troveManager.redistributeDebtAndColl(
            activePoolCached,
            defaultPoolCached,
            totals.totalDebtToRedistribute,
            totals.totalCollToRedistribute.tokens,
            totals.totalCollToRedistribute.amounts
        );
        if (_CollsIsNonZero(totals.totalCollSurplus)) {
            activePoolCached.sendCollaterals(
                address(collSurplusPool),
                totals.totalCollSurplus.tokens,
                totals.totalCollSurplus.amounts
            );
        }

        // Update system snapshots
        troveManager.updateSystemSnapshots_excludeCollRemainder(
            activePoolCached,
            totals.totalCollGasCompensation.tokens,
            totals.totalCollGasCompensation.amounts
        );

        vars.liquidatedDebt = totals.totalDebtInSequence;

        // merge the colls into one to emit correct event.
        newColls memory sumCollsResult = _sumColls(
            totals.totalCollToSendToSP,
            totals.totalCollToRedistribute
        );
        sumCollsResult = _sumColls(sumCollsResult, totals.totalCollSurplus);

        emit Liquidation(
            vars.liquidatedDebt,
            totals.totalYUSDGasCompensation,
            sumCollsResult.tokens,
            sumCollsResult.amounts,
            totals.totalCollGasCompensation.tokens,
            totals.totalCollGasCompensation.amounts
        );
        // Send gas compensation to caller
        _sendGasCompensation(
            activePoolCached,
            _liquidator,
            totals.totalYUSDGasCompensation,
            totals.totalCollGasCompensation.tokens,
            totals.totalCollGasCompensation.amounts
        );
    }

```
