# Context: Utils.assetChecks

**Contract:** `Utils` (Inherits: None)
**Signature:** `assetChecks(address,address)`
**Method Selector ID:** `0xcf975e7b`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** POOLS, USDV, VADER
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(iPOOLS(POOLS).isAnchor(debtAsset),Bad Combo)`
- require/assert: `require(bool,string)(iPOOLS(POOLS).isAsset(debtAsset),Bad Combo)`
- require/assert: `require(bool,string)(iPOOLS(POOLS).isAnchor(debtAsset),Bad Combo)`
- require/assert: `require(bool,string)(iPOOLS(POOLS).isAsset(debtAsset),Bad Combo)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `iPOOLS.TMP_873(bool) = HIGH_LEVEL_CALL, dest:TMP_872(iPOOLS), function:isAsset, arguments:['debtAsset']  `
- `iPOOLS.TMP_856(bool) = HIGH_LEVEL_CALL, dest:TMP_855(iPOOLS), function:isSynth, arguments:['collateralAsset']  `
- `iPOOLS.TMP_866(bool) = HIGH_LEVEL_CALL, dest:TMP_865(iPOOLS), function:isSynth, arguments:['collateralAsset']  `
- `iPOOLS.TMP_853(bool) = HIGH_LEVEL_CALL, dest:TMP_852(iPOOLS), function:isAsset, arguments:['debtAsset']  `
- `iSYNTH.TMP_869(address) = HIGH_LEVEL_CALL, dest:TMP_868(iSYNTH), function:TOKEN, arguments:[]  `
- `iPOOLS.TMP_863(bool) = HIGH_LEVEL_CALL, dest:TMP_862(iPOOLS), function:isAnchor, arguments:['debtAsset']  `
- `iPOOLS.TMP_860(bool) = HIGH_LEVEL_CALL, dest:TMP_857(iPOOLS), function:isAnchor, arguments:['TMP_859']  `
- `iPOOLS.TMP_849(bool) = HIGH_LEVEL_CALL, dest:TMP_848(iPOOLS), function:isAnchor, arguments:['debtAsset']  `
- `iSYNTH.TMP_859(address) = HIGH_LEVEL_CALL, dest:TMP_858(iSYNTH), function:TOKEN, arguments:[]  `
- `iPOOLS.TMP_870(bool) = HIGH_LEVEL_CALL, dest:TMP_867(iPOOLS), function:isAsset, arguments:['TMP_869']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.IF - collateralAsset == VADER"]
    Node_1 --> Node_2
    Node_1 --> Node_3
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(iPOOLS(POOLS).isAnchor(debtAsset),Bad Combo)"]
    Node_2 --> Node_12
    Node_3["3: NodeType.IF - collateralAsset == USDV"]
    Node_3 --> Node_4
    Node_3 --> Node_5
    Node_4["4: NodeType.EXPRESSION - require(bool,string)(iPOOLS(POOLS).isAsset(debtAsset),Bad Combo)"]
    Node_4 --> Node_11
    Node_5["5: NodeType.IF - iPOOLS(POOLS).isSynth(collateralAsset) && iPOOLS(POOLS).isAnchor(iSYNTH(collateralAsset).TOKEN())"]
    Node_5 --> Node_6
    Node_5 --> Node_7
    Node_6["6: NodeType.EXPRESSION - require(bool,string)(iPOOLS(POOLS).isAnchor(debtAsset),Bad Combo)"]
    Node_6 --> Node_10
    Node_7["7: NodeType.IF - iPOOLS(POOLS).isSynth(collateralAsset) && iPOOLS(POOLS).isAsset(iSYNTH(collateralAsset).TOKEN())"]
    Node_7 --> Node_8
    Node_7 --> Node_9
    Node_8["8: NodeType.EXPRESSION - require(bool,string)(iPOOLS(POOLS).isAsset(debtAsset),Bad Combo)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.ENDIF - "]
    Node_9 --> Node_10
    Node_10["10: NodeType.ENDIF - "]
    Node_10 --> Node_11
    Node_11["11: NodeType.ENDIF - "]
    Node_11 --> Node_12
    Node_12["12: NodeType.ENDIF - "]
```

### Source Mapping
Declared in: `contracts/Utils.sol` on lines **45** to **55**

```solidity
    function assetChecks(address collateralAsset, address debtAsset) external {
        if(collateralAsset == VADER){
            require(iPOOLS(POOLS).isAnchor(debtAsset), "Bad Combo"); // Can borrow Anchor with VADER/ANCHOR-SYNTH
        } else if(collateralAsset == USDV){
            require(iPOOLS(POOLS).isAsset(debtAsset), "Bad Combo"); // Can borrow Asset with VADER/ASSET-SYNTH
        } else if(iPOOLS(POOLS).isSynth(collateralAsset) && iPOOLS(POOLS).isAnchor(iSYNTH(collateralAsset).TOKEN())){
            require(iPOOLS(POOLS).isAnchor(debtAsset), "Bad Combo"); // Can borrow Anchor with VADER/ANCHOR-SYNTH
        } else if(iPOOLS(POOLS).isSynth(collateralAsset) && iPOOLS(POOLS).isAsset(iSYNTH(collateralAsset).TOKEN())){
            require(iPOOLS(POOLS).isAsset(debtAsset), "Bad Combo"); // Can borrow Anchor with VADER/ANCHOR-SYNTH
        }
    }

```
