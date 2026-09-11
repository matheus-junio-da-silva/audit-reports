# Context: Utils.calcCoverage

**Contract:** `Utils` (Inherits: None)
**Signature:** `calcCoverage(uint256,uint256,uint256,uint256) returns (uint256)`
**Method Selector ID:** `0x595a88a7`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- None

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.IF - B0 > 0 && T1 > 0"]
    Node_1 --> Node_2
    Node_1 --> Node_7
    Node_2["2: NodeType.VARIABLE - _depositValue = B0 + (T0 * B1) / T1"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - _redemptionValue = B1 + (T1 * B1) / T1"]
    Node_3 --> Node_4
    Node_4["4: NodeType.IF - _redemptionValue <= _depositValue"]
    Node_4 --> Node_5
    Node_4 --> Node_6
    Node_5["5: NodeType.EXPRESSION - coverage = (_depositValue - _redemptionValue)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.ENDIF - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.ENDIF - "]
    Node_7 --> Node_8
    Node_8["8: NodeType.RETURN - coverage"]
```

### Source Mapping
Declared in: `contracts/Utils.sol` on lines **277** to **285**

```solidity
    function calcCoverage(uint B0, uint T0, uint B1, uint T1) public pure returns(uint coverage){
        if(B0 > 0 && T1 > 0){
            uint _depositValue = B0 + (T0 * B1) / T1; // B0+(T0*B1/T1)
            uint _redemptionValue = B1 + (T1 * B1) / T1; // B1+(T1*B1/T1)
            if(_redemptionValue <= _depositValue){
                coverage = (_depositValue - _redemptionValue);
            }
        }
    }

```
