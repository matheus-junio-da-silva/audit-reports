# Context: LiquityMath._decPow

**Contract:** `LiquityMath` (Inherits: None)
**Signature:** `_decPow(uint256,uint256) returns (uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** DECIMAL_PRECISION
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_624(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['n', '1'] `
- `SafeMath.TMP_625(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_624', '2'] `
- `SafeMath.TMP_621(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['n', '2'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.IF - _minutes > 5256e5"]
    Node_1 --> Node_2
    Node_1 --> Node_3
    Node_2["2: NodeType.EXPRESSION - _minutes = 5256e5"]
    Node_2 --> Node_3
    Node_3["3: NodeType.ENDIF - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.IF - _minutes == 0"]
    Node_4 --> Node_5
    Node_4 --> Node_6
    Node_5["5: NodeType.RETURN - DECIMAL_PRECISION"]
    Node_6["6: NodeType.ENDIF - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - y = DECIMAL_PRECISION"]
    Node_7 --> Node_8
    Node_8["8: NodeType.VARIABLE - x = _base"]
    Node_8 --> Node_9
    Node_9["9: NodeType.VARIABLE - n = _minutes"]
    Node_9 --> Node_10
    Node_10["10: NodeType.STARTLOOP - "]
    Node_10 --> Node_11
    Node_11["11: NodeType.IFLOOP - n > 1"]
    Node_11 --> Node_12
    Node_11 --> Node_19
    Node_12["12: NodeType.IF - n % 2 == 0"]
    Node_12 --> Node_13
    Node_12 --> Node_15
    Node_13["13: NodeType.EXPRESSION - x = decMul(x,x)"]
    Node_13 --> Node_14
    Node_14["14: NodeType.EXPRESSION - n = n.div(2)"]
    Node_14 --> Node_18
    Node_15["15: NodeType.EXPRESSION - y = decMul(x,y)"]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - x = decMul(x,x)"]
    Node_16 --> Node_17
    Node_17["17: NodeType.EXPRESSION - n = (n.sub(1)).div(2)"]
    Node_17 --> Node_18
    Node_18["18: NodeType.ENDIF - "]
    Node_18 --> Node_11
    Node_19["19: NodeType.ENDLOOP - "]
    Node_19 --> Node_20
    Node_20["20: NodeType.RETURN - decMul(x,y)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/Dependencies/LiquityMath.sol` on lines **52** to **75**

```solidity
    function _decPow(uint _base, uint _minutes) internal pure returns (uint) {
       
        if (_minutes > 5256e5) {_minutes = 5256e5;}  // cap to avoid overflow
    
        if (_minutes == 0) {return DECIMAL_PRECISION;}

        uint y = DECIMAL_PRECISION;
        uint x = _base;
        uint n = _minutes;

        // Exponentiation-by-squaring
        while (n > 1) {
            if (n % 2 == 0) {
                x = decMul(x, x);
                n = n.div(2);
            } else { // if (n % 2 != 0)
                y = decMul(x, y);
                x = decMul(x, x);
                n = (n.sub(1)).div(2);
            }
        }

        return decMul(x, y);
  }

```
