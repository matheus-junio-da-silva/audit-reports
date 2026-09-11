# Context: Router.updateAnchorPrice

**Contract:** `Router` (Inherits: None)
**Signature:** `updateAnchorPrice(address)`
**Method Selector ID:** `0xe2e1e48f`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** arrayAnchors, one
- **Writes:** arrayPrices

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `iUTILS.TMP_435(uint256) = HIGH_LEVEL_CALL, dest:TMP_434(iUTILS), function:calcValueInBase, arguments:['REF_241', 'one']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_3
    Node_1["1: NodeType.STARTLOOP - "]
    Node_1 --> Node_4
    Node_2["2: NodeType.ENDLOOP - "]
    Node_3["3: NodeType.VARIABLE - i = 0"]
    Node_3 --> Node_1
    Node_4["4: NodeType.IFLOOP - i < arrayAnchors.length"]
    Node_4 --> Node_5
    Node_4 --> Node_2
    Node_5["5: NodeType.IF - arrayAnchors(i) == token"]
    Node_5 --> Node_6
    Node_5 --> Node_7
    Node_6["6: NodeType.EXPRESSION - arrayPrices(i) = iUTILS(UTILS()).calcValueInBase(arrayAnchors(i),one)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.ENDIF - "]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - i ++"]
    Node_8 --> Node_4
```

### Source Mapping
Declared in: `contracts/Router.sol` on lines **270** to **276**

```solidity
    function updateAnchorPrice(address token) public {
        for(uint i = 0; i<arrayAnchors.length; i++){
            if(arrayAnchors[i] == token){
                arrayPrices[i] = iUTILS(UTILS()).calcValueInBase(arrayAnchors[i], one);
            }
        }
    }

```
