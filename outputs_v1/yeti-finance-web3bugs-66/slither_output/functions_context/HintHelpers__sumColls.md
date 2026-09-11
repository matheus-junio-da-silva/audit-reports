# Context: HintHelpers._sumColls

**Contract:** `HintHelpers` (Inherits: CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `_sumColls(YetiCustomBase.newColls,YetiCustomBase.newColls) returns (YetiCustomBase.newColls)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** whitelist
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IWhitelist.TMP_261(uint256) = HIGH_LEVEL_CALL, dest:whitelist(IWhitelist), function:getIndex, arguments:['REF_303']  `
- `SafeMath.TMP_269(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['REF_320', 'REF_323'] `
- `IWhitelist.TMP_265(uint256) = HIGH_LEVEL_CALL, dest:whitelist(IWhitelist), function:getIndex, arguments:['REF_312']  `
- `IWhitelist.TMP_257(address[]) = HIGH_LEVEL_CALL, dest:whitelist(IWhitelist), function:getValidCollateral, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - "]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - coll3.tokens = whitelist.getValidCollateral()"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - coll1Len = _coll1.tokens.length"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - coll2Len = _coll2.tokens.length"]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - coll3Len = coll3.tokens.length"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - coll3.amounts = new uint256()(coll3Len)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - n = 0"]
    Node_7 --> Node_10
    Node_8["8: NodeType.STARTLOOP - "]
    Node_8 --> Node_11
    Node_9["9: NodeType.ENDLOOP - "]
    Node_9 --> Node_20
    Node_10["10: NodeType.VARIABLE - "]
    Node_10 --> Node_8
    Node_11["11: NodeType.IFLOOP - i < coll1Len"]
    Node_11 --> Node_12
    Node_11 --> Node_9
    Node_12["12: NodeType.VARIABLE - tokenIndex = whitelist.getIndex(_coll1.tokens(i))"]
    Node_12 --> Node_13
    Node_13["13: NodeType.IF - _coll1.amounts(i) != 0"]
    Node_13 --> Node_14
    Node_13 --> Node_16
    Node_14["14: NodeType.EXPRESSION - n ++"]
    Node_14 --> Node_15
    Node_15["15: NodeType.EXPRESSION - coll3.amounts(tokenIndex) = _coll1.amounts(i)"]
    Node_15 --> Node_16
    Node_16["16: NodeType.ENDIF - "]
    Node_16 --> Node_17
    Node_17["17: NodeType.EXPRESSION - ++ i"]
    Node_17 --> Node_11
    Node_18["18: NodeType.STARTLOOP - "]
    Node_18 --> Node_21
    Node_19["19: NodeType.ENDLOOP - "]
    Node_19 --> Node_30
    Node_20["20: NodeType.VARIABLE - "]
    Node_20 --> Node_18
    Node_21["21: NodeType.IFLOOP - i_scope_0 < coll2Len"]
    Node_21 --> Node_22
    Node_21 --> Node_19
    Node_22["22: NodeType.VARIABLE - tokenIndex_scope_1 = whitelist.getIndex(_coll2.tokens(i_scope_0))"]
    Node_22 --> Node_23
    Node_23["23: NodeType.IF - _coll2.amounts(i_scope_0) != 0"]
    Node_23 --> Node_24
    Node_23 --> Node_28
    Node_24["24: NodeType.IF - coll3.amounts(tokenIndex_scope_1) == 0"]
    Node_24 --> Node_25
    Node_24 --> Node_26
    Node_25["25: NodeType.EXPRESSION - n ++"]
    Node_25 --> Node_26
    Node_26["26: NodeType.ENDIF - "]
    Node_26 --> Node_27
    Node_27["27: NodeType.EXPRESSION - coll3.amounts(tokenIndex_scope_1) = coll3.amounts(tokenIndex_scope_1).add(_coll2.amounts(i_scope_0))"]
    Node_27 --> Node_28
    Node_28["28: NodeType.ENDIF - "]
    Node_28 --> Node_29
    Node_29["29: NodeType.EXPRESSION - ++ i_scope_0"]
    Node_29 --> Node_21
    Node_30["30: NodeType.VARIABLE - sumTokens = new address()(n)"]
    Node_30 --> Node_31
    Node_31["31: NodeType.VARIABLE - sumAmounts = new uint256()(n)"]
    Node_31 --> Node_32
    Node_32["32: NodeType.VARIABLE - "]
    Node_32 --> Node_35
    Node_33["33: NodeType.STARTLOOP - "]
    Node_33 --> Node_36
    Node_34["34: NodeType.ENDLOOP - "]
    Node_34 --> Node_43
    Node_35["35: NodeType.VARIABLE - "]
    Node_35 --> Node_33
    Node_36["36: NodeType.IFLOOP - i_scope_2 < coll3Len"]
    Node_36 --> Node_37
    Node_36 --> Node_34
    Node_37["37: NodeType.IF - coll3.amounts(i_scope_2) != 0"]
    Node_37 --> Node_38
    Node_37 --> Node_41
    Node_38["38: NodeType.EXPRESSION - sumTokens(j) = coll3.tokens(i_scope_2)"]
    Node_38 --> Node_39
    Node_39["39: NodeType.EXPRESSION - sumAmounts(j) = coll3.amounts(i_scope_2)"]
    Node_39 --> Node_40
    Node_40["40: NodeType.EXPRESSION - j ++"]
    Node_40 --> Node_41
    Node_41["41: NodeType.ENDIF - "]
    Node_41 --> Node_42
    Node_42["42: NodeType.EXPRESSION - ++ i_scope_2"]
    Node_42 --> Node_36
    Node_43["43: NodeType.EXPRESSION - finalColls.tokens = sumTokens"]
    Node_43 --> Node_44
    Node_44["44: NodeType.EXPRESSION - finalColls.amounts = sumAmounts"]
    Node_44 --> Node_45
    Node_45["45: NodeType.RETURN - finalColls"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/Dependencies/YetiCustomBase.sol` on lines **25** to **71**

```solidity
    function _sumColls(newColls memory _coll1, newColls memory _coll2)
        internal
        view
        returns (newColls memory finalColls)
    {
        newColls memory coll3;

        coll3.tokens = whitelist.getValidCollateral();
        uint256 coll1Len = _coll1.tokens.length;
        uint256 coll2Len = _coll2.tokens.length;
        uint256 coll3Len = coll3.tokens.length;
        coll3.amounts = new uint256[](coll3Len);

        uint256 n = 0;
        for (uint256 i; i < coll1Len; ++i) {
            uint256 tokenIndex = whitelist.getIndex(_coll1.tokens[i]);
            if (_coll1.amounts[i] != 0) {
                n++;
                coll3.amounts[tokenIndex] = _coll1.amounts[i];
            }
        }

        for (uint256 i; i < coll2Len; ++i) {
            uint256 tokenIndex = whitelist.getIndex(_coll2.tokens[i]);
            if (_coll2.amounts[i] != 0) {
                if (coll3.amounts[tokenIndex] == 0) {
                    n++;
                }
                coll3.amounts[tokenIndex] = coll3.amounts[tokenIndex].add(_coll2.amounts[i]);
            }
        }

        address[] memory sumTokens = new address[](n);
        uint256[] memory sumAmounts = new uint256[](n);
        uint256 j;

        // should only find n amounts over 0
        for (uint256 i; i < coll3Len; ++i) {
            if (coll3.amounts[i] != 0) {
                sumTokens[j] = coll3.tokens[i];
                sumAmounts[j] = coll3.amounts[i];
                j++;
            }
        }
        finalColls.tokens = sumTokens;
        finalColls.amounts = sumAmounts;
    }

```
