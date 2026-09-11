# Context: UniswapV2TokenAdapter.update

**Contract:** `UniswapV2TokenAdapter` (Inherits: ICSSRAdapter)
**Signature:** `update(address,bytes) returns (float)`
**Method Selector ID:** `0x02a688ed`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** isKeyCurrency, sushiCSSR, uniswapCSSR
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(isKeyCurrency[p],!keyCurrency)`
- require/assert: `require(bool,string)(isKeyCurrency[p_scope_0],!keyCurrency)`
- revert: `revert(string)(!supported type)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `UniswapV2Library.TMP_21(address) = LIBRARY_CALL, dest:UniswapV2Library, function:UniswapV2Library.pairFor(address,address,address), arguments:['TMP_20', '_asset', 'p'] `
- `IUniswapV2CSSR.TMP_27(ObservedData) = HIGH_LEVEL_CALL, dest:sushiCSSR(IUniswapV2CSSR), function:saveReserve, arguments:['bn_scope_6', 'pair_scope_7', 'ap_scope_2', 'rp_scope_3', 'pp0_scope_4', 'pp1_scope_5']  `
- `IUniswapV2CSSR.TUPLE_2(bytes32,uint256,uint256) = HIGH_LEVEL_CALL, dest:uniswapCSSR(IUniswapV2CSSR), function:saveState, arguments:['bd']  `
- `IUniswapV2CSSR.TMP_20(address) = HIGH_LEVEL_CALL, dest:uniswapCSSR(IUniswapV2CSSR), function:uniswapFactory, arguments:[]  `
- `IUniswapV2CSSR.TMP_25(address) = HIGH_LEVEL_CALL, dest:sushiCSSR(IUniswapV2CSSR), function:uniswapFactory, arguments:[]  `
- `SushiswapV2Library.TMP_26(address) = LIBRARY_CALL, dest:SushiswapV2Library, function:SushiswapV2Library.pairFor(address,address,address), arguments:['TMP_25', '_asset', 'p_scope_0'] `
- `IUniswapV2CSSR.TUPLE_4(bytes32,uint256,uint256) = HIGH_LEVEL_CALL, dest:sushiCSSR(IUniswapV2CSSR), function:saveState, arguments:['bd_scope_1']  `
- `IUniswapV2CSSR.TMP_22(ObservedData) = HIGH_LEVEL_CALL, dest:uniswapCSSR(IUniswapV2CSSR), function:saveReserve, arguments:['bn', 'pair', 'ap', 'rp', 'pp0', 'pp1']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - "]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - (cssrType,data) = abi.decode(_data,(uint256,bytes))"]
    Node_3 --> Node_4
    Node_4["4: NodeType.IF - cssrType == 0"]
    Node_4 --> Node_5
    Node_4 --> Node_17
    Node_5["5: NodeType.VARIABLE - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - "]
    Node_7 --> Node_8
    Node_8["8: NodeType.VARIABLE - "]
    Node_8 --> Node_9
    Node_9["9: NodeType.VARIABLE - "]
    Node_9 --> Node_10
    Node_10["10: NodeType.VARIABLE - "]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - (p,bd,ap,rp,pp0,pp1) = abi.decode(data,(address,bytes,bytes,bytes,bytes,bytes))"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - require(bool,string)(isKeyCurrency(p),!keyCurrency)"]
    Node_12 --> Node_13
    Node_13["13: NodeType.VARIABLE - "]
    Node_13 --> Node_14
    Node_14["14: NodeType.EXPRESSION - (None,bn,None) = uniswapCSSR.saveState(bd)"]
    Node_14 --> Node_15
    Node_15["15: NodeType.VARIABLE - pair = UniswapV2Library.pairFor(uniswapCSSR.uniswapFactory(),_asset,p)"]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - uniswapCSSR.saveReserve(bn,pair,ap,rp,pp0,pp1)"]
    Node_16 --> Node_32
    Node_17["17: NodeType.IF - cssrType == 1"]
    Node_17 --> Node_18
    Node_17 --> Node_30
    Node_18["18: NodeType.VARIABLE - "]
    Node_18 --> Node_19
    Node_19["19: NodeType.VARIABLE - "]
    Node_19 --> Node_20
    Node_20["20: NodeType.VARIABLE - "]
    Node_20 --> Node_21
    Node_21["21: NodeType.VARIABLE - "]
    Node_21 --> Node_22
    Node_22["22: NodeType.VARIABLE - "]
    Node_22 --> Node_23
    Node_23["23: NodeType.VARIABLE - "]
    Node_23 --> Node_24
    Node_24["24: NodeType.EXPRESSION - (p_scope_0,bd_scope_1,ap_scope_2,rp_scope_3,pp0_scope_4,pp1_scope_5) = abi.decode(data,(address,bytes,bytes,bytes,bytes,bytes))"]
    Node_24 --> Node_25
    Node_25["25: NodeType.EXPRESSION - require(bool,string)(isKeyCurrency(p_scope_0),!keyCurrency)"]
    Node_25 --> Node_26
    Node_26["26: NodeType.VARIABLE - "]
    Node_26 --> Node_27
    Node_27["27: NodeType.EXPRESSION - (None,bn_scope_6,None) = sushiCSSR.saveState(bd_scope_1)"]
    Node_27 --> Node_28
    Node_28["28: NodeType.VARIABLE - pair_scope_7 = SushiswapV2Library.pairFor(sushiCSSR.uniswapFactory(),_asset,p_scope_0)"]
    Node_28 --> Node_29
    Node_29["29: NodeType.EXPRESSION - sushiCSSR.saveReserve(bn_scope_6,pair_scope_7,ap_scope_2,rp_scope_3,pp0_scope_4,pp1_scope_5)"]
    Node_29 --> Node_31
    Node_30["30: NodeType.EXPRESSION - revert(string)(!supported type)"]
    Node_30 --> Node_31
    Node_31["31: NodeType.ENDIF - "]
    Node_31 --> Node_32
    Node_32["32: NodeType.ENDIF - "]
    Node_32 --> Node_33
    Node_33["33: NodeType.RETURN - getPrice(_asset)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-cssr/contracts/adapter/UniswapV2TokenAdapter.sol` on lines **71** to **115**

```solidity
    function update(address _asset, bytes memory _data)
        external
        override
        returns (float memory)
    {
        (uint256 cssrType, bytes memory data) = abi.decode(_data, (uint256, bytes));
        if(cssrType == 0){
            (
                address p,
                bytes memory bd,
                bytes memory ap,
                bytes memory rp,
                bytes memory pp0,
                bytes memory pp1
            ) = abi.decode(data, (address, bytes, bytes, bytes, bytes, bytes));
            require(isKeyCurrency[p], "!keyCurrency");
            (, uint256 bn, ) = uniswapCSSR.saveState(bd);
            address pair = UniswapV2Library.pairFor(
                uniswapCSSR.uniswapFactory(),
                _asset,
                p
            );
            uniswapCSSR.saveReserve(bn, pair, ap, rp, pp0, pp1);
        } else if(cssrType == 1){
            (
                address p,
                bytes memory bd,
                bytes memory ap,
                bytes memory rp,
                bytes memory pp0,
                bytes memory pp1
            ) = abi.decode(data, (address, bytes, bytes, bytes, bytes, bytes));
            require(isKeyCurrency[p], "!keyCurrency");
            (, uint256 bn, ) = sushiCSSR.saveState(bd);
            address pair = SushiswapV2Library.pairFor(
                sushiCSSR.uniswapFactory(),
                _asset,
                p
            );
            sushiCSSR.saveReserve(bn, pair, ap, rp, pp0, pp1);
        } else {
            revert("!supported type");
        }
        return getPrice(_asset);
    }

```
