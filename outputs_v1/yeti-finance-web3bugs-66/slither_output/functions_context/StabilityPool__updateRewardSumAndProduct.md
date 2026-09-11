# Context: StabilityPool._updateRewardSumAndProduct

**Contract:** `StabilityPool` (Inherits: IStabilityPool, ICollateralReceiver, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `_updateRewardSumAndProduct(address[],uint256[],uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** DECIMAL_PRECISION, P, SCALE_FACTOR, currentEpoch, currentScale, epochToScaleToSum
- **Writes:** P, currentEpoch, currentScale, epochToScaleToSum

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_YUSDLossPerUnitStaked <= DECIMAL_PRECISION,SP: YUSDLoss < 1)`
- require/assert: `require(bool,string)(newP != 0,SP: P = 0)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `LiquitySafeMath128.TMP_495(uint128) = LIBRARY_CALL, dest:LiquitySafeMath128, function:LiquitySafeMath128.add(uint128,uint128), arguments:['currentEpochCached', '1'] `
- `SafeMath.TMP_499(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_498', 'DECIMAL_PRECISION'] `
- `SafeMath.TMP_507(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_506', 'DECIMAL_PRECISION'] `
- `SafeMath.TMP_498(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['currentP', 'newProductFactor'] `
- `SafeMath.TMP_502(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['TMP_501', 'SCALE_FACTOR'] `
- `LiquitySafeMath128.TMP_504(uint128) = LIBRARY_CALL, dest:LiquitySafeMath128, function:LiquitySafeMath128.add(uint128,uint128), arguments:['currentScaleCached', '1'] `
- `SafeMath.TMP_501(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['currentP', 'newProductFactor'] `
- `SafeMath.TMP_506(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['currentP', 'newProductFactor'] `
- `SafeMath.TMP_492(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['currentAssetS', 'REF_488'] `
- `SafeMath.TMP_490(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['TMP_489', '_YUSDLossPerUnitStaked'] `
- `SafeMath.TMP_503(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_502', 'DECIMAL_PRECISION'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - currentP = P"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - require(bool,string)(_YUSDLossPerUnitStaked <= DECIMAL_PRECISION,SP: YUSDLoss < 1)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - newProductFactor = uint256(DECIMAL_PRECISION).sub(_YUSDLossPerUnitStaked)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - currentScaleCached = currentScale"]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - currentEpochCached = currentEpoch"]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - assetsLen = _assets.length"]
    Node_7 --> Node_10
    Node_8["8: NodeType.STARTLOOP - "]
    Node_8 --> Node_11
    Node_9["9: NodeType.ENDLOOP - "]
    Node_9 --> Node_18
    Node_10["10: NodeType.VARIABLE - "]
    Node_10 --> Node_8
    Node_11["11: NodeType.IFLOOP - i < assetsLen"]
    Node_11 --> Node_12
    Node_11 --> Node_9
    Node_12["12: NodeType.VARIABLE - asset = _assets(i)"]
    Node_12 --> Node_13
    Node_13["13: NodeType.VARIABLE - currentAssetS = epochToScaleToSum(asset)(currentEpochCached)(currentScaleCached)"]
    Node_13 --> Node_14
    Node_14["14: NodeType.VARIABLE - newAssetS = currentAssetS.add(_AssetGainPerUnitStaked(i))"]
    Node_14 --> Node_15
    Node_15["15: NodeType.EXPRESSION - epochToScaleToSum(asset)(currentEpochCached)(currentScaleCached) = newAssetS"]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - S_Updated(asset,newAssetS,currentEpochCached,currentScaleCached)"]
    Node_16 --> Node_17
    Node_17["17: NodeType.EXPRESSION - ++ i"]
    Node_17 --> Node_11
    Node_18["18: NodeType.IF - newProductFactor == 0"]
    Node_18 --> Node_19
    Node_18 --> Node_24
    Node_19["19: NodeType.EXPRESSION - currentEpoch = currentEpochCached.add(1)"]
    Node_19 --> Node_20
    Node_20["20: NodeType.EXPRESSION - EpochUpdated(currentEpoch)"]
    Node_20 --> Node_21
    Node_21["21: NodeType.EXPRESSION - currentScale = 0"]
    Node_21 --> Node_22
    Node_22["22: NodeType.EXPRESSION - ScaleUpdated(currentScale)"]
    Node_22 --> Node_23
    Node_23["23: NodeType.EXPRESSION - newP = DECIMAL_PRECISION"]
    Node_23 --> Node_30
    Node_24["24: NodeType.IF - currentP.mul(newProductFactor).div(DECIMAL_PRECISION) < SCALE_FACTOR"]
    Node_24 --> Node_25
    Node_24 --> Node_28
    Node_25["25: NodeType.EXPRESSION - newP = currentP.mul(newProductFactor).mul(SCALE_FACTOR).div(DECIMAL_PRECISION)"]
    Node_25 --> Node_26
    Node_26["26: NodeType.EXPRESSION - currentScale = currentScaleCached.add(1)"]
    Node_26 --> Node_27
    Node_27["27: NodeType.EXPRESSION - ScaleUpdated(currentScale)"]
    Node_27 --> Node_29
    Node_28["28: NodeType.EXPRESSION - newP = currentP.mul(newProductFactor).div(DECIMAL_PRECISION)"]
    Node_28 --> Node_29
    Node_29["29: NodeType.ENDIF - "]
    Node_29 --> Node_30
    Node_30["30: NodeType.ENDIF - "]
    Node_30 --> Node_31
    Node_31["31: NodeType.EXPRESSION - require(bool,string)(newP != 0,SP: P = 0)"]
    Node_31 --> Node_32
    Node_32["32: NodeType.EXPRESSION - P = newP"]
    Node_32 --> Node_33
    Node_33["33: NodeType.EXPRESSION - P_Updated(newP)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/StabilityPool.sol` on lines **605** to **662**

```solidity
    function _updateRewardSumAndProduct(
        address[] memory _assets,
        uint256[] memory _AssetGainPerUnitStaked,
        uint256 _YUSDLossPerUnitStaked
    ) internal {
        uint256 currentP = P;
        uint256 newP;

        require(_YUSDLossPerUnitStaked <= DECIMAL_PRECISION, "SP: YUSDLoss < 1");
        /*
         * The newProductFactor is the factor by which to change all deposits, due to the depletion of Stability Pool YUSD in the liquidation.
         * We make the product factor 0 if there was a pool-emptying. Otherwise, it is (1 - YUSDLossPerUnitStaked)
         */
        uint256 newProductFactor = uint256(DECIMAL_PRECISION).sub(_YUSDLossPerUnitStaked);

        uint128 currentScaleCached = currentScale;
        uint128 currentEpochCached = currentEpoch;

        /*
         * Calculate the new S first, before we update P.
         * The Collateral amount gain for any given depositor from a liquidation depends on the value of their deposit
         * (and the value of totalDeposits) prior to the Stability being depleted by the debt in the liquidation.
         *
         * Since S corresponds to Collateral amount gain, and P to deposit loss, we update S first.
         */
        uint256 assetsLen = _assets.length;
        for (uint256 i; i < assetsLen; ++i) {
            address asset = _assets[i];
            
            // uint256 marginalAssetGain = _AssetGainPerUnitStaked[i]; only used once, named here for clarity.
            uint256 currentAssetS = epochToScaleToSum[asset][currentEpochCached][currentScaleCached];
            uint256 newAssetS = currentAssetS.add(_AssetGainPerUnitStaked[i]);

            epochToScaleToSum[asset][currentEpochCached][currentScaleCached] = newAssetS;
            emit S_Updated(asset, newAssetS, currentEpochCached, currentScaleCached);
        }

        // If the Stability Pool was emptied, increment the epoch, and reset the scale and product P
        if (newProductFactor == 0) {
            currentEpoch = currentEpochCached.add(1);
            emit EpochUpdated(currentEpoch);
            currentScale = 0;
            emit ScaleUpdated(currentScale);
            newP = DECIMAL_PRECISION;

            // If multiplying P by a non-zero product factor would reduce P below the scale boundary, increment the scale
        } else if (currentP.mul(newProductFactor).div(DECIMAL_PRECISION) < SCALE_FACTOR) {
            newP = currentP.mul(newProductFactor).mul(SCALE_FACTOR).div(DECIMAL_PRECISION);
            currentScale = currentScaleCached.add(1);
            emit ScaleUpdated(currentScale);
        } else {
            newP = currentP.mul(newProductFactor).div(DECIMAL_PRECISION);
        }

        require(newP != 0, "SP: P = 0");
        P = newP;
        emit P_Updated(newP);
    }

```
