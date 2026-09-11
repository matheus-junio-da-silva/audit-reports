# Context: Router.replaceAnchor

**Contract:** `Router` (Inherits: None)
**Signature:** `replaceAnchor(address,address)`
**Method Selector ID:** `0x1df6acfd`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** POOLS, arrayAnchors, insidePriceLimit, outsidePriceLimit
- **Writes:** _isCurated, arrayAnchors

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(iPOOLS(POOLS).isAnchor(newToken),Not anchor)`
- require/assert: `require(bool,string)((iPOOLS(POOLS).getBaseAmount(newToken) > iPOOLS(POOLS).getBaseAmount(oldToken)),Not deeper)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `iPOOLS.TMP_411(bool) = HIGH_LEVEL_CALL, dest:TMP_410(iPOOLS), function:isAnchor, arguments:['newToken']  `
- `iUTILS.HIGH_LEVEL_CALL, dest:TMP_424(iUTILS), function:requirePriceBounds, arguments:['newToken', 'insidePriceLimit', 'True', 'TMP_425']  `
- `iPOOLS.TMP_414(uint256) = HIGH_LEVEL_CALL, dest:TMP_413(iPOOLS), function:getBaseAmount, arguments:['newToken']  `
- `iUTILS.HIGH_LEVEL_CALL, dest:TMP_420(iUTILS), function:requirePriceBounds, arguments:['oldToken', 'outsidePriceLimit', 'False', 'TMP_421']  `
- `iPOOLS.TMP_416(uint256) = HIGH_LEVEL_CALL, dest:TMP_415(iPOOLS), function:getBaseAmount, arguments:['oldToken']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(iPOOLS(POOLS).isAnchor(newToken),Not anchor)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)((iPOOLS(POOLS).getBaseAmount(newToken) > iPOOLS(POOLS).getBaseAmount(oldToken)),Not deeper)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - iUTILS(UTILS()).requirePriceBounds(oldToken,outsidePriceLimit,false,getAnchorPrice())"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - iUTILS(UTILS()).requirePriceBounds(newToken,insidePriceLimit,true,getAnchorPrice())"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - _isCurated(oldToken) = false"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - _isCurated(newToken) = true"]
    Node_6 --> Node_9
    Node_7["7: NodeType.STARTLOOP - "]
    Node_7 --> Node_10
    Node_8["8: NodeType.ENDLOOP - "]
    Node_8 --> Node_15
    Node_9["9: NodeType.VARIABLE - i = 0"]
    Node_9 --> Node_7
    Node_10["10: NodeType.IFLOOP - i < arrayAnchors.length"]
    Node_10 --> Node_11
    Node_10 --> Node_8
    Node_11["11: NodeType.IF - arrayAnchors(i) == oldToken"]
    Node_11 --> Node_12
    Node_11 --> Node_13
    Node_12["12: NodeType.EXPRESSION - arrayAnchors(i) = newToken"]
    Node_12 --> Node_13
    Node_13["13: NodeType.ENDIF - "]
    Node_13 --> Node_14
    Node_14["14: NodeType.EXPRESSION - i ++"]
    Node_14 --> Node_10
    Node_15["15: NodeType.EXPRESSION - updateAnchorPrice(newToken)"]
```

### Source Mapping
Declared in: `contracts/Router.sol` on lines **254** to **267**

```solidity
    function replaceAnchor(address oldToken, address newToken) external {
        require(iPOOLS(POOLS).isAnchor(newToken), "Not anchor");
        require((iPOOLS(POOLS).getBaseAmount(newToken) > iPOOLS(POOLS).getBaseAmount(oldToken)), "Not deeper");
        iUTILS(UTILS()).requirePriceBounds(oldToken, outsidePriceLimit, false, getAnchorPrice());                             // if price oldToken >5%
        iUTILS(UTILS()).requirePriceBounds(newToken, insidePriceLimit, true, getAnchorPrice());                               // if price newToken <2%
        _isCurated[oldToken] = false; 
        _isCurated[newToken] = true; 
        for(uint i = 0; i<arrayAnchors.length; i++){
            if(arrayAnchors[i] == oldToken){
                arrayAnchors[i] = newToken;
            }
        }
        updateAnchorPrice(newToken);
    }

```
