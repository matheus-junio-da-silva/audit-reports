# Context: StabilityPool._computeRewardsPerUnitStaked

**Contract:** `StabilityPool` (Inherits: IStabilityPool, ICollateralReceiver, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `_computeRewardsPerUnitStaked(address[],uint256[],uint256,uint256) returns (uint256[], uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** DECIMAL_PRECISION, P, lastAssetError_Offset, lastYUSDLossError_Offset, whitelist
- **Writes:** lastAssetError_Offset, lastYUSDLossError_Offset

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_debtToOffset <= _totalYUSDDeposits,SP:This debt less than totalYUSD)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_484(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['REF_478', '_totalYUSDDeposits'] `
- `SafeMath.TMP_466(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['REF_458', 'DECIMAL_PRECISION'] `
- `SafeMath.TMP_472(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['TMP_471', 'lastYUSDLossError_Offset'] `
- `SafeMath.TMP_476(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['TMP_475', 'YUSDLossNumerator'] `
- `SafeMath.TMP_474(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['TMP_473', '1'] `
- `SafeMath.TMP_473(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['YUSDLossNumerator', '_totalYUSDDeposits'] `
- `SafeMath.TMP_467(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['TMP_466', 'REF_461'] `
- `SafeMath.TMP_481(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_480', '_totalYUSDDeposits'] `
- `SafeMath.TMP_480(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['REF_470', 'currentP'] `
- `SafeMath.TMP_471(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['_debtToOffset', 'DECIMAL_PRECISION'] `
- `SafeMath.TMP_485(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_484', 'currentP'] `
- `SafeMath.TMP_475(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['YUSDLossPerUnitStaked', '_totalYUSDDeposits'] `
- `SafeMath.TMP_486(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['REF_476', 'TMP_485'] `
- `IWhitelist.TMP_483(uint256) = HIGH_LEVEL_CALL, dest:whitelist(IWhitelist), function:getIndex, arguments:['REF_474']  `
- `IWhitelist.TMP_465(uint256) = HIGH_LEVEL_CALL, dest:whitelist(IWhitelist), function:getIndex, arguments:['REF_456']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - amountsLen = _amountsAdded.length"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - CollateralNumerators = new uint256()(amountsLen)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - currentP = P"]
    Node_3 --> Node_6
    Node_4["4: NodeType.STARTLOOP - "]
    Node_4 --> Node_7
    Node_5["5: NodeType.ENDLOOP - "]
    Node_5 --> Node_11
    Node_6["6: NodeType.VARIABLE - "]
    Node_6 --> Node_4
    Node_7["7: NodeType.IFLOOP - i < amountsLen"]
    Node_7 --> Node_8
    Node_7 --> Node_5
    Node_8["8: NodeType.VARIABLE - tokenIDX = whitelist.getIndex(_tokens(i))"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - CollateralNumerators(i) = _amountsAdded(i).mul(DECIMAL_PRECISION).add(lastAssetError_Offset(tokenIDX))"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - ++ i"]
    Node_10 --> Node_7
    Node_11["11: NodeType.EXPRESSION - require(bool,string)(_debtToOffset <= _totalYUSDDeposits,SP:This debt less than totalYUSD)"]
    Node_11 --> Node_12
    Node_12["12: NodeType.IF - _debtToOffset == _totalYUSDDeposits"]
    Node_12 --> Node_13
    Node_12 --> Node_15
    Node_13["13: NodeType.EXPRESSION - YUSDLossPerUnitStaked = DECIMAL_PRECISION"]
    Node_13 --> Node_14
    Node_14["14: NodeType.EXPRESSION - lastYUSDLossError_Offset = 0"]
    Node_14 --> Node_18
    Node_15["15: NodeType.VARIABLE - YUSDLossNumerator = _debtToOffset.mul(DECIMAL_PRECISION).sub(lastYUSDLossError_Offset)"]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - YUSDLossPerUnitStaked = (YUSDLossNumerator.div(_totalYUSDDeposits)).add(1)"]
    Node_16 --> Node_17
    Node_17["17: NodeType.EXPRESSION - lastYUSDLossError_Offset = (YUSDLossPerUnitStaked.mul(_totalYUSDDeposits)).sub(YUSDLossNumerator)"]
    Node_17 --> Node_18
    Node_18["18: NodeType.ENDIF - "]
    Node_18 --> Node_19
    Node_19["19: NodeType.EXPRESSION - AssetGainPerUnitStaked = new uint256()(_amountsAdded.length)"]
    Node_19 --> Node_22
    Node_20["20: NodeType.STARTLOOP - "]
    Node_20 --> Node_23
    Node_21["21: NodeType.ENDLOOP - "]
    Node_21 --> Node_28
    Node_22["22: NodeType.VARIABLE - "]
    Node_22 --> Node_20
    Node_23["23: NodeType.IFLOOP - i_scope_0 < amountsLen"]
    Node_23 --> Node_24
    Node_23 --> Node_21
    Node_24["24: NodeType.EXPRESSION - AssetGainPerUnitStaked(i_scope_0) = CollateralNumerators(i_scope_0).mul(currentP).div(_totalYUSDDeposits)"]
    Node_24 --> Node_25
    Node_25["25: NodeType.EXPRESSION - ++ i_scope_0"]
    Node_25 --> Node_23
    Node_26["26: NodeType.STARTLOOP - "]
    Node_26 --> Node_29
    Node_27["27: NodeType.ENDLOOP - "]
    Node_27 --> Node_33
    Node_28["28: NodeType.VARIABLE - "]
    Node_28 --> Node_26
    Node_29["29: NodeType.IFLOOP - i_scope_1 < amountsLen"]
    Node_29 --> Node_30
    Node_29 --> Node_27
    Node_30["30: NodeType.VARIABLE - tokenIDX_scope_2 = whitelist.getIndex(_tokens(i_scope_1))"]
    Node_30 --> Node_31
    Node_31["31: NodeType.EXPRESSION - lastAssetError_Offset(tokenIDX_scope_2) = CollateralNumerators(i_scope_1).sub(AssetGainPerUnitStaked(i_scope_1).mul(_totalYUSDDeposits).div(currentP))"]
    Node_31 --> Node_32
    Node_32["32: NodeType.EXPRESSION - ++ i_scope_1"]
    Node_32 --> Node_29
    Node_33["33: NodeType.RETURN - (AssetGainPerUnitStaked,YUSDLossPerUnitStaked)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/StabilityPool.sol` on lines **555** to **602**

```solidity
    function _computeRewardsPerUnitStaked(
        address[] memory _tokens,
        uint256[] memory _amountsAdded,
        uint256 _debtToOffset,
        uint256 _totalYUSDDeposits
    ) internal returns (uint256[] memory AssetGainPerUnitStaked, uint256 YUSDLossPerUnitStaked) {
        uint256 amountsLen = _amountsAdded.length;
        uint256[] memory CollateralNumerators = new uint256[](amountsLen);
        uint256 currentP = P;

        for (uint256 i; i < amountsLen; ++i) {
            uint256 tokenIDX = whitelist.getIndex(_tokens[i]);
            CollateralNumerators[i] = _amountsAdded[i].mul(DECIMAL_PRECISION).add(
                lastAssetError_Offset[tokenIDX]
            );
        }

        require(_debtToOffset <= _totalYUSDDeposits, "SP:This debt less than totalYUSD");
        if (_debtToOffset == _totalYUSDDeposits) {
            YUSDLossPerUnitStaked = DECIMAL_PRECISION; // When the Pool depletes to 0, so does each deposit
            lastYUSDLossError_Offset = 0;
        } else {
            uint256 YUSDLossNumerator = _debtToOffset.mul(DECIMAL_PRECISION).sub(
                lastYUSDLossError_Offset
            );
            /*
             * Add 1 to make error in quotient positive. We want "slightly too much" YUSD loss,
             * which ensures the error in any given compoundedYUSDDeposit favors the Stability Pool.
             */
            YUSDLossPerUnitStaked = (YUSDLossNumerator.div(_totalYUSDDeposits)).add(1);
            lastYUSDLossError_Offset = (YUSDLossPerUnitStaked.mul(_totalYUSDDeposits)).sub(
                YUSDLossNumerator
            );
        }

        AssetGainPerUnitStaked = new uint256[](_amountsAdded.length);
        for (uint256 i; i < amountsLen; ++i) {
            AssetGainPerUnitStaked[i] = CollateralNumerators[i].mul(currentP).div(_totalYUSDDeposits);
        }

        for (uint256 i; i < amountsLen; ++i) {
            uint256 tokenIDX = whitelist.getIndex(_tokens[i]);
            lastAssetError_Offset[tokenIDX] = CollateralNumerators[i].sub(
                AssetGainPerUnitStaked[i].mul(_totalYUSDDeposits).div(currentP)
            );
        }

    }

```
