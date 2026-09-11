# Context: Utils.getProtection

**Contract:** `Utils` (Inherits: None)
**Signature:** `getProtection(address,address,uint256,uint256) returns (uint256)`
**Method Selector ID:** `0x5b0b602d`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** ROUTER
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `iROUTER.TMP_943(uint256) = HIGH_LEVEL_CALL, dest:TMP_942(iROUTER), function:getMemberLastDeposit, arguments:['member', 'token']  `
- `iROUTER.TMP_941(bool) = HIGH_LEVEL_CALL, dest:TMP_940(iROUTER), function:isCurated, arguments:['token']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - _coverage = getCoverage(member,token)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.IF - iROUTER(ROUTER).isCurated(token)"]
    Node_2 --> Node_3
    Node_2 --> Node_8
    Node_3["3: NodeType.VARIABLE - _duration = block.timestamp - iROUTER(ROUTER).getMemberLastDeposit(member,token)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.IF - _duration <= timeForFullProtection"]
    Node_4 --> Node_5
    Node_4 --> Node_6
    Node_5["5: NodeType.EXPRESSION - protection = calcShare(_duration,timeForFullProtection,_coverage)"]
    Node_5 --> Node_7
    Node_6["6: NodeType.EXPRESSION - protection = _coverage"]
    Node_6 --> Node_7
    Node_7["7: NodeType.ENDIF - "]
    Node_7 --> Node_8
    Node_8["8: NodeType.ENDIF - "]
    Node_8 --> Node_9
    Node_9["9: NodeType.RETURN - calcPart(basisPoints,protection)"]
    Node_10["10: NodeType.RETURN - protection"]
```

### Source Mapping
Declared in: `contracts/Utils.sol` on lines **129** to **140**

```solidity
    function getProtection(address member, address token, uint basisPoints, uint timeForFullProtection) public view returns(uint protection) {
        uint _coverage = getCoverage(member, token);
        if(iROUTER(ROUTER).isCurated(token)){
            uint _duration = block.timestamp - iROUTER(ROUTER).getMemberLastDeposit(member, token);
            if(_duration <= timeForFullProtection) {
                protection = calcShare(_duration, timeForFullProtection, _coverage); // Apply 100 day rule
            } else {
                protection = _coverage;
            }
        }
        return calcPart(basisPoints, protection);
    }

```
