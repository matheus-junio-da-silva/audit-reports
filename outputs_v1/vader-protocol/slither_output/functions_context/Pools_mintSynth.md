# Context: Pools.mintSynth

**Contract:** `Pools` (Inherits: None)
**Signature:** `mintSynth(address,address,address) returns (uint256)`
**Method Selector ID:** `0xd016347e`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** FACTORY, mapTokenMember_Units, mapToken_Units, mapToken_baseAmount, mapToken_tokenAmount
- **Writes:** mapTokenMember_Units, mapToken_Units, mapToken_baseAmount

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(iFACTORY(FACTORY).isSynth(getSynth(token)),!synth)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `iUTILS.TMP_191(uint256) = HIGH_LEVEL_CALL, dest:TMP_190(iUTILS), function:calcSynthUnits, arguments:['_actualInputBase', 'REF_110', 'REF_111']  `
- `iFACTORY.TMP_199(bool) = HIGH_LEVEL_CALL, dest:TMP_197(iFACTORY), function:mintSynth, arguments:['TMP_198', 'member', 'outputAmount']  `
- `iFACTORY.TMP_186(bool) = HIGH_LEVEL_CALL, dest:TMP_184(iFACTORY), function:isSynth, arguments:['TMP_185']  `
- `iUTILS.TMP_194(uint256) = HIGH_LEVEL_CALL, dest:TMP_193(iUTILS), function:calcSwapOutput, arguments:['_actualInputBase', 'REF_113', 'REF_114']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(iFACTORY(FACTORY).isSynth(getSynth(token)),!synth)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - _actualInputBase = getAddedAmount(base,token)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - _synthUnits = iUTILS(UTILS()).calcSynthUnits(_actualInputBase,mapToken_baseAmount(token),mapToken_Units(token))"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - outputAmount = iUTILS(UTILS()).calcSwapOutput(_actualInputBase,mapToken_baseAmount(token),mapToken_tokenAmount(token))"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - mapTokenMember_Units(token)(address(this)) += _synthUnits"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - mapToken_Units(token) += _synthUnits"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - mapToken_baseAmount(token) += _actualInputBase"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - AddLiquidity(member,base,_actualInputBase,token,0,_synthUnits)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - iFACTORY(FACTORY).mintSynth(getSynth(token),member,outputAmount)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.RETURN - outputAmount"]
```

### Source Mapping
Declared in: `contracts/Pools.sol` on lines **143** to **153**

```solidity
    function mintSynth(address base, address token, address member) external returns (uint outputAmount) {
        require(iFACTORY(FACTORY).isSynth(getSynth(token)), "!synth");
        uint _actualInputBase = getAddedAmount(base, token);                    // Get input
        uint _synthUnits = iUTILS(UTILS()).calcSynthUnits(_actualInputBase, mapToken_baseAmount[token], mapToken_Units[token]);     // Get Units
        outputAmount = iUTILS(UTILS()).calcSwapOutput(_actualInputBase, mapToken_baseAmount[token], mapToken_tokenAmount[token]);   // Get output
        mapTokenMember_Units[token][address(this)] += _synthUnits;                  // Add units for self
        mapToken_Units[token] += _synthUnits;                                       // Add supply
        mapToken_baseAmount[token] += _actualInputBase;                             // Add BASE 
        emit AddLiquidity(member, base, _actualInputBase, token, 0, _synthUnits);   // Add Liquidity Event
        iFACTORY(FACTORY).mintSynth(getSynth(token), member, outputAmount);         // Ask factory to mint to member
    }

```
