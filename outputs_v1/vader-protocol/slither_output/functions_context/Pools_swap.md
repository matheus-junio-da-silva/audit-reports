# Context: Pools.swap

**Contract:** `Pools` (Inherits: None)
**Signature:** `swap(address,address,address,bool) returns (uint256)`
**Method Selector ID:** `0xefc34aab`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** mapToken_baseAmount, mapToken_tokenAmount
- **Writes:** mapToken_baseAmount, mapToken_tokenAmount

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `iUTILS.TMP_161(uint256) = HIGH_LEVEL_CALL, dest:TMP_160(iUTILS), function:calcSwapFee, arguments:['_actualInput', 'REF_93', 'REF_94']  `
- `iUTILS.TMP_167(uint256) = HIGH_LEVEL_CALL, dest:TMP_166(iUTILS), function:calcSwapOutput, arguments:['_actualInput_scope_0', 'REF_98', 'REF_99']  `
- `iUTILS.TMP_170(uint256) = HIGH_LEVEL_CALL, dest:TMP_169(iUTILS), function:calcSwapFee, arguments:['_actualInput_scope_0', 'REF_101', 'REF_102']  `
- `iUTILS.TMP_158(uint256) = HIGH_LEVEL_CALL, dest:TMP_157(iUTILS), function:calcSwapOutput, arguments:['_actualInput', 'REF_90', 'REF_91']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.IF - toBase"]
    Node_1 --> Node_2
    Node_1 --> Node_9
    Node_2["2: NodeType.VARIABLE - _actualInput = getAddedAmount(token,token)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - outputAmount = iUTILS(UTILS()).calcSwapOutput(_actualInput,mapToken_tokenAmount(token),mapToken_baseAmount(token))"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - _swapFee = iUTILS(UTILS()).calcSwapFee(_actualInput,mapToken_tokenAmount(token),mapToken_baseAmount(token))"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - mapToken_tokenAmount(token) += _actualInput"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - mapToken_baseAmount(token) -= outputAmount"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - Swap(member,token,_actualInput,base,outputAmount,_swapFee)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - transferOut(base,outputAmount,member)"]
    Node_8 --> Node_16
    Node_9["9: NodeType.VARIABLE - _actualInput_scope_0 = getAddedAmount(base,token)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - outputAmount = iUTILS(UTILS()).calcSwapOutput(_actualInput_scope_0,mapToken_baseAmount(token),mapToken_tokenAmount(token))"]
    Node_10 --> Node_11
    Node_11["11: NodeType.VARIABLE - _swapFee_scope_1 = iUTILS(UTILS()).calcSwapFee(_actualInput_scope_0,mapToken_baseAmount(token),mapToken_tokenAmount(token))"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - mapToken_baseAmount(token) += _actualInput_scope_0"]
    Node_12 --> Node_13
    Node_13["13: NodeType.EXPRESSION - mapToken_tokenAmount(token) -= outputAmount"]
    Node_13 --> Node_14
    Node_14["14: NodeType.EXPRESSION - Swap(member,base,_actualInput_scope_0,token,outputAmount,_swapFee_scope_1)"]
    Node_14 --> Node_15
    Node_15["15: NodeType.EXPRESSION - transferOut(token,outputAmount,member)"]
    Node_15 --> Node_16
    Node_16["16: NodeType.ENDIF - "]
    Node_16 --> Node_17
    Node_17["17: NodeType.RETURN - outputAmount"]
```

### Source Mapping
Declared in: `contracts/Pools.sol` on lines **101** to **119**

```solidity
    function swap(address base, address token, address member, bool toBase) external returns (uint outputAmount) {
        if(toBase){
            uint _actualInput = getAddedAmount(token, token);
            outputAmount = iUTILS(UTILS()).calcSwapOutput(_actualInput, mapToken_tokenAmount[token], mapToken_baseAmount[token]);
            uint _swapFee = iUTILS(UTILS()).calcSwapFee(_actualInput, mapToken_tokenAmount[token], mapToken_baseAmount[token]);
            mapToken_tokenAmount[token] += _actualInput;
            mapToken_baseAmount[token] -= outputAmount;
            emit Swap(member, token, _actualInput, base, outputAmount, _swapFee);
            transferOut(base, outputAmount, member);
        } else {
            uint _actualInput = getAddedAmount(base, token);
            outputAmount = iUTILS(UTILS()).calcSwapOutput(_actualInput, mapToken_baseAmount[token], mapToken_tokenAmount[token]);
            uint _swapFee = iUTILS(UTILS()).calcSwapFee(_actualInput, mapToken_baseAmount[token], mapToken_tokenAmount[token]);
            mapToken_baseAmount[token] += _actualInput;
            mapToken_tokenAmount[token] -= outputAmount;
            emit Swap(member, base, _actualInput, token, outputAmount, _swapFee);
            transferOut(token, outputAmount, member);
        }
    }

```
