# Context: Utils.getCollateralValueInBase

**Contract:** `Utils` (Inherits: None)
**Signature:** `getCollateralValueInBase(address,uint256,address,address) returns (uint256, uint256)`
**Method Selector ID:** `0x5c22141f`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** FACTORY, POOLS
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `iFACTORY.TMP_975(bool) = HIGH_LEVEL_CALL, dest:TMP_974(iFACTORY), function:isSynth, arguments:['collateralAsset']  `
- `iPOOLS.TMP_970(uint256) = HIGH_LEVEL_CALL, dest:TMP_969(iPOOLS), function:getMemberUnits, arguments:['collateralAsset', 'member']  `
- `iSYNTH.TMP_977(address) = HIGH_LEVEL_CALL, dest:TMP_976(iSYNTH), function:TOKEN, arguments:[]  `
- `iPOOLS.TMP_972(uint256) = HIGH_LEVEL_CALL, dest:TMP_971(iPOOLS), function:getBaseAmount, arguments:['collateralAsset']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - _collateralAdjusted = (collateral * 6666) / 10000"]
    Node_1 --> Node_2
    Node_2["2: NodeType.IF - isBase(collateralAsset)"]
    Node_2 --> Node_3
    Node_2 --> Node_4
    Node_3["3: NodeType.EXPRESSION - baseValue = _collateralAdjusted"]
    Node_3 --> Node_10
    Node_4["4: NodeType.IF - isPool(collateralAsset)"]
    Node_4 --> Node_5
    Node_4 --> Node_6
    Node_5["5: NodeType.EXPRESSION - baseValue = calcAsymmetricShare(_collateralAdjusted,iPOOLS(POOLS).getMemberUnits(collateralAsset,member),iPOOLS(POOLS).getBaseAmount(collateralAsset))"]
    Node_5 --> Node_9
    Node_6["6: NodeType.IF - iFACTORY(FACTORY).isSynth(collateralAsset)"]
    Node_6 --> Node_7
    Node_6 --> Node_8
    Node_7["7: NodeType.EXPRESSION - baseValue = calcSwapValueInBase(iSYNTH(collateralAsset).TOKEN(),_collateralAdjusted)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.ENDIF - "]
    Node_8 --> Node_9
    Node_9["9: NodeType.ENDIF - "]
    Node_9 --> Node_10
    Node_10["10: NodeType.ENDIF - "]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - debt = calcSwapValueInToken(debtAsset,baseValue)"]
    Node_11 --> Node_12
    Node_12["12: NodeType.RETURN - (debt,baseValue)"]
    Node_13["13: NodeType.RETURN - (debt,baseValue)"]
```

### Source Mapping
Declared in: `contracts/Utils.sol` on lines **152** to **163**

```solidity
    function getCollateralValueInBase(address member, uint collateral, address collateralAsset, address debtAsset) external view returns (uint debt, uint baseValue) {
        uint _collateralAdjusted = (collateral * 6666) / 10000; // 150% collateral Ratio
        if(isBase(collateralAsset)){
            baseValue = _collateralAdjusted;
        }else if(isPool(collateralAsset)){
            baseValue = calcAsymmetricShare(_collateralAdjusted, iPOOLS(POOLS).getMemberUnits(collateralAsset, member), iPOOLS(POOLS).getBaseAmount(collateralAsset)); // calc units to BASE
        }else if(iFACTORY(FACTORY).isSynth(collateralAsset)){
            baseValue = calcSwapValueInBase(iSYNTH(collateralAsset).TOKEN(), _collateralAdjusted); // Calc swap value
        }
        debt = calcSwapValueInToken(debtAsset, baseValue);        // get debt output
        return (debt, baseValue);
    }

```
