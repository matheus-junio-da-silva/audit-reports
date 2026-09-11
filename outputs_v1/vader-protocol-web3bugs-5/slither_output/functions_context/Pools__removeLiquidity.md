# Context: Pools._removeLiquidity

**Contract:** `Pools` (Inherits: None)
**Signature:** `_removeLiquidity(address,address,uint256,address) returns (uint256, uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** USDV, VADER, mapTokenMember_Units, mapToken_Units, mapToken_baseAmount, mapToken_tokenAmount
- **Writes:** mapTokenMember_Units, mapToken_Units, mapToken_baseAmount, mapToken_tokenAmount

### Assertion Checks & Business Requirements
- require/assert: `require(bool)(base == USDV || base == VADER)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `iUTILS.TMP_151(uint256) = HIGH_LEVEL_CALL, dest:TMP_150(iUTILS), function:calcShare, arguments:['_units', 'REF_81', 'REF_82']  `
- `iUTILS.TMP_145(uint256) = HIGH_LEVEL_CALL, dest:TMP_144(iUTILS), function:calcPart, arguments:['basisPoints', 'REF_76']  `
- `iUTILS.TMP_148(uint256) = HIGH_LEVEL_CALL, dest:TMP_147(iUTILS), function:calcShare, arguments:['_units', 'REF_78', 'REF_79']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool)(base == USDV || base == VADER)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - _units = iUTILS(UTILS()).calcPart(basisPoints,mapTokenMember_Units(token)(member))"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - outputBase = iUTILS(UTILS()).calcShare(_units,mapToken_Units(token),mapToken_baseAmount(token))"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - outputToken = iUTILS(UTILS()).calcShare(_units,mapToken_Units(token),mapToken_tokenAmount(token))"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - mapToken_Units(token) -= _units"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - mapTokenMember_Units(token)(member) -= _units"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - mapToken_baseAmount(token) -= outputBase"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - mapToken_tokenAmount(token) -= outputToken"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - RemoveLiquidity(member,base,outputBase,token,outputToken,_units,mapToken_Units(token))"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - transferOut(base,outputBase,member)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - transferOut(token,outputToken,member)"]
    Node_11 --> Node_12
    Node_12["12: NodeType.RETURN - (outputBase,outputToken)"]
    Node_13["13: NodeType.RETURN - (outputBase,outputToken)"]
```

### Source Mapping
Declared in: `contracts/Pools.sol` on lines **83** to **96**

```solidity
    function _removeLiquidity(address base, address token, uint basisPoints, address member) internal returns (uint outputBase, uint outputToken) {
        require(base == USDV || base == VADER);
        uint _units = iUTILS(UTILS()).calcPart(basisPoints, mapTokenMember_Units[token][member]);
        outputBase = iUTILS(UTILS()).calcShare(_units, mapToken_Units[token], mapToken_baseAmount[token]);
        outputToken = iUTILS(UTILS()).calcShare(_units, mapToken_Units[token], mapToken_tokenAmount[token]);
        mapToken_Units[token] -=_units;
        mapTokenMember_Units[token][member] -= _units;
        mapToken_baseAmount[token] -= outputBase;
        mapToken_tokenAmount[token] -= outputToken;
        emit RemoveLiquidity(member, base, outputBase, token, outputToken, _units, mapToken_Units[token]);
        transferOut(base, outputBase, member);
        transferOut(token, outputToken, member);
        return (outputBase, outputToken);
    }

```
