# Context: Router.swapWithSynthsWithLimit

**Contract:** `Router` (Inherits: None)
**Signature:** `swapWithSynthsWithLimit(uint256,address,bool,address,bool,uint256) returns (uint256)`
**Method Selector ID:** `0x37785d21`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** POOLS, USDV, VADER
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool)(iUTILS(UTILS()).calcSwapSlip(inputAmount,iPOOLS(POOLS).getTokenAmount(inputToken)) <= slipLimit)`
- require/assert: `require(bool)(iUTILS(UTILS()).calcSwapSlip(inputAmount,iPOOLS(POOLS).getBaseAmount(outputToken)) <= slipLimit)`
- require/assert: `require(bool)(iUTILS(UTILS()).calcSwapSlip(inputAmount,iPOOLS(POOLS).getTokenAmount(inputToken)) <= slipLimit)`
- require/assert: `require(bool)(iUTILS(UTILS()).calcSwapSlip(inputAmount,iPOOLS(POOLS).getBaseAmount(outputToken)) <= slipLimit)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `iPOOLS.TMP_343(uint256) = HIGH_LEVEL_CALL, dest:TMP_342(iPOOLS), function:swap, arguments:['_base', 'outputToken', '_member', 'False']  `
- `iPOOLS.TMP_287(bool) = HIGH_LEVEL_CALL, dest:TMP_286(iPOOLS), function:isAnchor, arguments:['inputToken']  `
- `iPOOLS.TMP_333(uint256) = HIGH_LEVEL_CALL, dest:TMP_332(iPOOLS), function:burnSynth, arguments:['_base', 'inputToken', 'POOLS']  `
- `iPOOLS.TMP_314(uint256) = HIGH_LEVEL_CALL, dest:TMP_313(iPOOLS), function:swap, arguments:['_base', 'outputToken', '_member', 'False']  `
- `iPOOLS.TMP_325(uint256) = HIGH_LEVEL_CALL, dest:TMP_324(iPOOLS), function:getTokenAmount, arguments:['inputToken']  `
- `iPOOLS.TMP_301(uint256) = HIGH_LEVEL_CALL, dest:TMP_300(iPOOLS), function:swap, arguments:['_base', 'inputToken', '_member', 'True']  `
- `iUTILS.TMP_338(uint256) = HIGH_LEVEL_CALL, dest:TMP_335(iUTILS), function:calcSwapSlip, arguments:['inputAmount', 'TMP_337']  `
- `iUTILS.TMP_309(uint256) = HIGH_LEVEL_CALL, dest:TMP_306(iUTILS), function:calcSwapSlip, arguments:['inputAmount', 'TMP_308']  `
- `iUTILS.TMP_296(uint256) = HIGH_LEVEL_CALL, dest:TMP_293(iUTILS), function:calcSwapSlip, arguments:['inputAmount', 'TMP_295']  `
- `iPOOLS.TMP_331(uint256) = HIGH_LEVEL_CALL, dest:TMP_330(iPOOLS), function:swap, arguments:['_base', 'inputToken', 'POOLS', 'True']  `
- `iPOOLS.TMP_345(uint256) = HIGH_LEVEL_CALL, dest:TMP_344(iPOOLS), function:mintSynth, arguments:['_base', 'outputToken', '_member']  `
- `iPOOLS.TMP_303(uint256) = HIGH_LEVEL_CALL, dest:TMP_302(iPOOLS), function:burnSynth, arguments:['_base', 'inputToken', '_member']  `
- `iPOOLS.TMP_316(uint256) = HIGH_LEVEL_CALL, dest:TMP_315(iPOOLS), function:mintSynth, arguments:['_base', 'outputToken', '_member']  `
- `iPOOLS.TMP_295(uint256) = HIGH_LEVEL_CALL, dest:TMP_294(iPOOLS), function:getTokenAmount, arguments:['inputToken']  `
- `iPOOLS.TMP_289(bool) = HIGH_LEVEL_CALL, dest:TMP_288(iPOOLS), function:isAnchor, arguments:['outputToken']  `
- `iPOOLS.TMP_337(uint256) = HIGH_LEVEL_CALL, dest:TMP_336(iPOOLS), function:getBaseAmount, arguments:['outputToken']  `
- `iUTILS.TMP_326(uint256) = HIGH_LEVEL_CALL, dest:TMP_323(iUTILS), function:calcSwapSlip, arguments:['inputAmount', 'TMP_325']  `
- `iPOOLS.TMP_284(address) = HIGH_LEVEL_CALL, dest:TMP_283(iPOOLS), function:getSynth, arguments:['inputToken']  `
- `iPOOLS.TMP_308(uint256) = HIGH_LEVEL_CALL, dest:TMP_307(iPOOLS), function:getBaseAmount, arguments:['outputToken']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - _member = msg.sender"]
    Node_1 --> Node_2
    Node_2["2: NodeType.IF - ! inSynth"]
    Node_2 --> Node_3
    Node_2 --> Node_4
    Node_3["3: NodeType.EXPRESSION - moveTokenToPools(inputToken,inputAmount)"]
    Node_3 --> Node_5
    Node_4["4: NodeType.EXPRESSION - moveTokenToPools(iPOOLS(POOLS).getSynth(inputToken),inputAmount)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.ENDIF - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.IF - iPOOLS(POOLS).isAnchor(inputToken) || iPOOLS(POOLS).isAnchor(outputToken)"]
    Node_7 --> Node_8
    Node_7 --> Node_9
    Node_8["8: NodeType.EXPRESSION - _base = VADER"]
    Node_8 --> Node_10
    Node_9["9: NodeType.EXPRESSION - _base = USDV"]
    Node_9 --> Node_10
    Node_10["10: NodeType.ENDIF - "]
    Node_10 --> Node_11
    Node_11["11: NodeType.IF - isBase(outputToken)"]
    Node_11 --> Node_12
    Node_11 --> Node_17
    Node_12["12: NodeType.EXPRESSION - require(bool)(iUTILS(UTILS()).calcSwapSlip(inputAmount,iPOOLS(POOLS).getTokenAmount(inputToken)) <= slipLimit)"]
    Node_12 --> Node_13
    Node_13["13: NodeType.IF - ! inSynth"]
    Node_13 --> Node_14
    Node_13 --> Node_15
    Node_14["14: NodeType.EXPRESSION - outputAmount = iPOOLS(POOLS).swap(_base,inputToken,_member,true)"]
    Node_14 --> Node_16
    Node_15["15: NodeType.EXPRESSION - outputAmount = iPOOLS(POOLS).burnSynth(_base,inputToken,_member)"]
    Node_15 --> Node_16
    Node_16["16: NodeType.ENDIF - "]
    Node_16 --> Node_36
    Node_17["17: NodeType.IF - isBase(inputToken)"]
    Node_17 --> Node_18
    Node_17 --> Node_23
    Node_18["18: NodeType.EXPRESSION - require(bool)(iUTILS(UTILS()).calcSwapSlip(inputAmount,iPOOLS(POOLS).getBaseAmount(outputToken)) <= slipLimit)"]
    Node_18 --> Node_19
    Node_19["19: NodeType.IF - ! outSynth"]
    Node_19 --> Node_20
    Node_19 --> Node_21
    Node_20["20: NodeType.EXPRESSION - outputAmount = iPOOLS(POOLS).swap(_base,outputToken,_member,false)"]
    Node_20 --> Node_22
    Node_21["21: NodeType.EXPRESSION - outputAmount = iPOOLS(POOLS).mintSynth(_base,outputToken,_member)"]
    Node_21 --> Node_22
    Node_22["22: NodeType.ENDIF - "]
    Node_22 --> Node_35
    Node_23["23: NodeType.IF - ! isBase(inputToken) && ! isBase(outputToken)"]
    Node_23 --> Node_24
    Node_23 --> Node_34
    Node_24["24: NodeType.EXPRESSION - require(bool)(iUTILS(UTILS()).calcSwapSlip(inputAmount,iPOOLS(POOLS).getTokenAmount(inputToken)) <= slipLimit)"]
    Node_24 --> Node_25
    Node_25["25: NodeType.IF - ! inSynth"]
    Node_25 --> Node_26
    Node_25 --> Node_27
    Node_26["26: NodeType.EXPRESSION - iPOOLS(POOLS).swap(_base,inputToken,POOLS,true)"]
    Node_26 --> Node_28
    Node_27["27: NodeType.EXPRESSION - iPOOLS(POOLS).burnSynth(_base,inputToken,POOLS)"]
    Node_27 --> Node_28
    Node_28["28: NodeType.ENDIF - "]
    Node_28 --> Node_29
    Node_29["29: NodeType.EXPRESSION - require(bool)(iUTILS(UTILS()).calcSwapSlip(inputAmount,iPOOLS(POOLS).getBaseAmount(outputToken)) <= slipLimit)"]
    Node_29 --> Node_30
    Node_30["30: NodeType.IF - ! outSynth"]
    Node_30 --> Node_31
    Node_30 --> Node_32
    Node_31["31: NodeType.EXPRESSION - outputAmount = iPOOLS(POOLS).swap(_base,outputToken,_member,false)"]
    Node_31 --> Node_33
    Node_32["32: NodeType.EXPRESSION - outputAmount = iPOOLS(POOLS).mintSynth(_base,outputToken,_member)"]
    Node_32 --> Node_33
    Node_33["33: NodeType.ENDIF - "]
    Node_33 --> Node_34
    Node_34["34: NodeType.ENDIF - "]
    Node_34 --> Node_35
    Node_35["35: NodeType.ENDIF - "]
    Node_35 --> Node_36
    Node_36["36: NodeType.ENDIF - "]
    Node_36 --> Node_37
    Node_37["37: NodeType.EXPRESSION - _handlePoolReward(_base,inputToken)"]
    Node_37 --> Node_38
    Node_38["38: NodeType.EXPRESSION - _handlePoolReward(_base,outputToken)"]
    Node_38 --> Node_39
    Node_39["39: NodeType.EXPRESSION - _handleAnchorPriceUpdate(inputToken)"]
    Node_39 --> Node_40
    Node_40["40: NodeType.EXPRESSION - _handleAnchorPriceUpdate(outputToken)"]
    Node_40 --> Node_41
    Node_41["41: NodeType.RETURN - outputAmount"]
```

### Source Mapping
Declared in: `contracts/Router.sol` on lines **133** to **181**

```solidity
    function swapWithSynthsWithLimit(uint inputAmount, address inputToken, bool inSynth, address outputToken, bool outSynth, uint slipLimit) public returns (uint outputAmount) {
        address _member = msg.sender;
        if(!inSynth){
            moveTokenToPools(inputToken, inputAmount);
        } else {
            moveTokenToPools(iPOOLS(POOLS).getSynth(inputToken), inputAmount);
        }
        address _base;
        if(iPOOLS(POOLS).isAnchor(inputToken) || iPOOLS(POOLS).isAnchor(outputToken)) {
            _base = VADER;
        } else {
            _base = USDV;
        }
        if (isBase(outputToken)) {
            // Token||Synth -> BASE
            require(iUTILS(UTILS()).calcSwapSlip(inputAmount, iPOOLS(POOLS).getTokenAmount(inputToken)) <= slipLimit);
            if(!inSynth){
                outputAmount = iPOOLS(POOLS).swap(_base, inputToken, _member, true);
            } else {
                outputAmount = iPOOLS(POOLS).burnSynth(_base, inputToken, _member);
            }
        } else if (isBase(inputToken)) {
            // BASE -> Token||Synth
            require(iUTILS(UTILS()).calcSwapSlip(inputAmount, iPOOLS(POOLS).getBaseAmount(outputToken)) <= slipLimit);
            if(!outSynth){
                outputAmount = iPOOLS(POOLS).swap(_base, outputToken, _member, false);
            } else {
                outputAmount = iPOOLS(POOLS).mintSynth(_base, outputToken, _member);
            }
        } else if (!isBase(inputToken) && !isBase(outputToken)) {
            // Token||Synth -> Token||Synth
            require(iUTILS(UTILS()).calcSwapSlip(inputAmount, iPOOLS(POOLS).getTokenAmount(inputToken)) <= slipLimit);
            if(!inSynth){
                iPOOLS(POOLS).swap(_base, inputToken, POOLS, true);
            } else {
                iPOOLS(POOLS).burnSynth(_base, inputToken, POOLS);
            }
            require(iUTILS(UTILS()).calcSwapSlip(inputAmount, iPOOLS(POOLS).getBaseAmount(outputToken)) <= slipLimit);
            if(!outSynth){
                outputAmount = iPOOLS(POOLS).swap(_base, outputToken, _member, false);
            } else {
                outputAmount = iPOOLS(POOLS).mintSynth(_base, outputToken, _member);
            }
        }
        _handlePoolReward(_base, inputToken);
        _handlePoolReward(_base, outputToken);
        _handleAnchorPriceUpdate(inputToken);
        _handleAnchorPriceUpdate(outputToken); 
    }

```
