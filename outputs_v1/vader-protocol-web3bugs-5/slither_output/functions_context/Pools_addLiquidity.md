# Context: Pools.addLiquidity

**Contract:** `Pools` (Inherits: None)
**Signature:** `addLiquidity(address,address,address) returns (uint256)`
**Method Selector ID:** `0xfde3b265`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** USDV, VADER, mapTokenMember_Units, mapToken_Units, mapToken_baseAmount, mapToken_tokenAmount
- **Writes:** _isAnchor, _isAsset, mapTokenMember_Units, mapToken_Units, mapToken_baseAmount, mapToken_tokenAmount

### Assertion Checks & Business Requirements
- require/assert: `require(bool)(token != USDV && token != VADER)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `iUTILS.TMP_137(uint256) = HIGH_LEVEL_CALL, dest:TMP_136(iUTILS), function:calcLiquidityUnits, arguments:['_actualInputBase', 'REF_66', '_actualInputToken', 'REF_67', 'REF_68']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool)(token != USDV && token != VADER)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.IF - base == VADER"]
    Node_3 --> Node_4
    Node_3 --> Node_8
    Node_4["4: NodeType.IF - ! isAnchor(token)"]
    Node_4 --> Node_5
    Node_4 --> Node_6
    Node_5["5: NodeType.EXPRESSION - _isAnchor(token) = true"]
    Node_5 --> Node_6
    Node_6["6: NodeType.ENDIF - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - _actualInputBase = getAddedAmount(VADER,token)"]
    Node_7 --> Node_14
    Node_8["8: NodeType.IF - base == USDV"]
    Node_8 --> Node_9
    Node_8 --> Node_13
    Node_9["9: NodeType.IF - ! isAsset(token)"]
    Node_9 --> Node_10
    Node_9 --> Node_11
    Node_10["10: NodeType.EXPRESSION - _isAsset(token) = true"]
    Node_10 --> Node_11
    Node_11["11: NodeType.ENDIF - "]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - _actualInputBase = getAddedAmount(USDV,token)"]
    Node_12 --> Node_13
    Node_13["13: NodeType.ENDIF - "]
    Node_13 --> Node_14
    Node_14["14: NodeType.ENDIF - "]
    Node_14 --> Node_15
    Node_15["15: NodeType.VARIABLE - _actualInputToken = getAddedAmount(token,token)"]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - liquidityUnits = iUTILS(UTILS()).calcLiquidityUnits(_actualInputBase,mapToken_baseAmount(token),_actualInputToken,mapToken_tokenAmount(token),mapToken_Units(token))"]
    Node_16 --> Node_17
    Node_17["17: NodeType.EXPRESSION - mapTokenMember_Units(token)(member) += liquidityUnits"]
    Node_17 --> Node_18
    Node_18["18: NodeType.EXPRESSION - mapToken_Units(token) += liquidityUnits"]
    Node_18 --> Node_19
    Node_19["19: NodeType.EXPRESSION - mapToken_baseAmount(token) += _actualInputBase"]
    Node_19 --> Node_20
    Node_20["20: NodeType.EXPRESSION - mapToken_tokenAmount(token) += _actualInputToken"]
    Node_20 --> Node_21
    Node_21["21: NodeType.EXPRESSION - AddLiquidity(member,base,_actualInputBase,token,_actualInputToken,liquidityUnits)"]
    Node_21 --> Node_22
    Node_22["22: NodeType.RETURN - liquidityUnits"]
```

### Source Mapping
Declared in: `contracts/Pools.sol` on lines **54** to **75**

```solidity
    function addLiquidity(address base, address token, address member) external returns(uint liquidityUnits) {
        require(token != USDV && token != VADER); // Prohibited
        uint _actualInputBase;
        if(base == VADER){
            if(!isAnchor(token)){               // If new Anchor
                _isAnchor[token] = true;
            }
            _actualInputBase = getAddedAmount(VADER, token);
        } else if (base == USDV) {
            if(!isAsset(token)){               // If new Asset
                _isAsset[token] = true;
            }
            _actualInputBase = getAddedAmount(USDV, token);
        }
        uint _actualInputToken = getAddedAmount(token, token);
        liquidityUnits = iUTILS(UTILS()).calcLiquidityUnits(_actualInputBase, mapToken_baseAmount[token], _actualInputToken, mapToken_tokenAmount[token], mapToken_Units[token]);
        mapTokenMember_Units[token][member] += liquidityUnits;  // Add units to member
        mapToken_Units[token] += liquidityUnits;                // Add in total
        mapToken_baseAmount[token] += _actualInputBase;         // Add BASE
        mapToken_tokenAmount[token] += _actualInputToken;       // Add token
        emit AddLiquidity(member, base, _actualInputBase, token, _actualInputToken, liquidityUnits);
    }

```
