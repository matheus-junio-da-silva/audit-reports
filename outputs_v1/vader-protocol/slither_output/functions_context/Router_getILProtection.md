# Context: Router.getILProtection

**Contract:** `Router` (Inherits: None)
**Signature:** `getILProtection(address,address,address,uint256) returns (uint256)`
**Method Selector ID:** `0xe6048ff8`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** VADER, timeForFullProtection
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `iUTILS.TMP_368(uint256) = HIGH_LEVEL_CALL, dest:TMP_367(iUTILS), function:getProtection, arguments:['member', 'token', 'basisPoints', 'timeForFullProtection']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - protection = iUTILS(UTILS()).getProtection(member,token,basisPoints,timeForFullProtection)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.IF - base == VADER"]
    Node_2 --> Node_3
    Node_2 --> Node_6
    Node_3["3: NodeType.IF - protection >= reserveVADER()"]
    Node_3 --> Node_4
    Node_3 --> Node_5
    Node_4["4: NodeType.EXPRESSION - protection = reserveVADER()"]
    Node_4 --> Node_5
    Node_5["5: NodeType.ENDIF - "]
    Node_5 --> Node_9
    Node_6["6: NodeType.IF - protection >= reserveUSDV()"]
    Node_6 --> Node_7
    Node_6 --> Node_8
    Node_7["7: NodeType.EXPRESSION - protection = reserveUSDV()"]
    Node_7 --> Node_8
    Node_8["8: NodeType.ENDIF - "]
    Node_8 --> Node_9
    Node_9["9: NodeType.ENDIF - "]
    Node_9 --> Node_10
    Node_10["10: NodeType.RETURN - protection"]
```

### Source Mapping
Declared in: `contracts/Router.sol` on lines **209** to **220**

```solidity
    function getILProtection(address member, address base, address token, uint basisPoints) public view returns(uint protection) {
        protection = iUTILS(UTILS()).getProtection(member, token, basisPoints, timeForFullProtection);
        if(base == VADER){
            if(protection >= reserveVADER()){
                protection = reserveVADER(); // In case reserve is running out
            }
        } else {
            if(protection >= reserveUSDV()){
                protection = reserveUSDV(); // In case reserve is running out
            }
        }
    }

```
