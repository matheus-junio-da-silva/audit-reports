# Context: Router.payInterest

**Contract:** `Router` (Inherits: None)
**Signature:** `payInterest(address,address)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** POOLS, VADER, mapCollateralAsset_NextEra, mapCollateralDebt_interestPaid
- **Writes:** mapCollateralAsset_NextEra, mapCollateralDebt_interestPaid

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `iERC20.TMP_522(bool) = HIGH_LEVEL_CALL, dest:TMP_521(iERC20), function:transfer, arguments:['POOLS', '_interestOwed']  `
- `iVADER.TMP_508(uint256) = HIGH_LEVEL_CALL, dest:TMP_507(iVADER), function:secondsPerEra, arguments:[]  `
- `iPOOLS.HIGH_LEVEL_CALL, dest:TMP_517(iPOOLS), function:sync, arguments:['collateralAsset', 'debtAsset']  `
- `iPOOLS.TMP_520(bool) = HIGH_LEVEL_CALL, dest:TMP_519(iPOOLS), function:isSynth, arguments:['collateralAsset']  `
- `iERC20.TMP_516(bool) = HIGH_LEVEL_CALL, dest:TMP_515(iERC20), function:transfer, arguments:['POOLS', '_interestOwed']  `
- `iPOOLS.HIGH_LEVEL_CALL, dest:TMP_523(iPOOLS), function:syncSynth, arguments:['TMP_525']  `
- `iSYNTH.TMP_525(address) = HIGH_LEVEL_CALL, dest:TMP_524(iSYNTH), function:TOKEN, arguments:[]  `
- `iUTILS.TMP_512(uint256) = HIGH_LEVEL_CALL, dest:TMP_511(iUTILS), function:getInterestOwed, arguments:['collateralAsset', 'debtAsset', '_timeElapsed']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.IF - block.timestamp >= getNextEraTime(collateralAsset,debtAsset) && emitting()"]
    Node_1 --> Node_2
    Node_1 --> Node_15
    Node_2["2: NodeType.VARIABLE - _timeElapsed = block.timestamp - mapCollateralAsset_NextEra(collateralAsset)(debtAsset)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - mapCollateralAsset_NextEra(collateralAsset)(debtAsset) = block.timestamp + iVADER(VADER).secondsPerEra()"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - _interestOwed = iUTILS(UTILS()).getInterestOwed(collateralAsset,debtAsset,_timeElapsed)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - mapCollateralDebt_interestPaid(collateralAsset)(debtAsset) += _interestOwed"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - _removeCollateral(_interestOwed,collateralAsset,debtAsset)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.IF - isBase(collateralAsset)"]
    Node_7 --> Node_8
    Node_7 --> Node_10
    Node_8["8: NodeType.EXPRESSION - iERC20(collateralAsset).transfer(POOLS,_interestOwed)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - iPOOLS(POOLS).sync(collateralAsset,debtAsset)"]
    Node_9 --> Node_14
    Node_10["10: NodeType.IF - iPOOLS(POOLS).isSynth(collateralAsset)"]
    Node_10 --> Node_11
    Node_10 --> Node_13
    Node_11["11: NodeType.EXPRESSION - iERC20(collateralAsset).transfer(POOLS,_interestOwed)"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - iPOOLS(POOLS).syncSynth(iSYNTH(collateralAsset).TOKEN())"]
    Node_12 --> Node_13
    Node_13["13: NodeType.ENDIF - "]
    Node_13 --> Node_14
    Node_14["14: NodeType.ENDIF - "]
    Node_14 --> Node_15
    Node_15["15: NodeType.ENDIF - "]
```

### Source Mapping
Declared in: `contracts/Router.sol` on lines **358** to **373**

```solidity
    function payInterest(address collateralAsset, address debtAsset) internal {
        if (block.timestamp >= getNextEraTime(collateralAsset, debtAsset) && emitting()) {                              // If new Era
            uint _timeElapsed = block.timestamp - mapCollateralAsset_NextEra[collateralAsset][debtAsset];
            mapCollateralAsset_NextEra[collateralAsset][debtAsset] = block.timestamp + iVADER(VADER).secondsPerEra(); 
            uint _interestOwed = iUTILS(UTILS()).getInterestOwed(collateralAsset, debtAsset, _timeElapsed);
            mapCollateralDebt_interestPaid[collateralAsset][debtAsset] += _interestOwed;
            _removeCollateral(_interestOwed, collateralAsset, debtAsset);
            if(isBase(collateralAsset)){
                iERC20(collateralAsset).transfer(POOLS, _interestOwed);
                iPOOLS(POOLS).sync(collateralAsset, debtAsset);
            } else if(iPOOLS(POOLS).isSynth(collateralAsset)){
                iERC20(collateralAsset).transfer(POOLS, _interestOwed);
                iPOOLS(POOLS).syncSynth(iSYNTH(collateralAsset).TOKEN());
            }
        }
    }

```
