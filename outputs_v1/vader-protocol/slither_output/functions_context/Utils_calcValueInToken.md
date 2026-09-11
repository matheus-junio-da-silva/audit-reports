# Context: Utils.calcValueInToken

**Contract:** `Utils` (Inherits: None)
**Signature:** `calcValueInToken(address,uint256) returns (uint256)`
**Method Selector ID:** `0xc0c4a724`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** POOLS
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `iPOOLS.TUPLE_6(uint256,uint256) = HIGH_LEVEL_CALL, dest:TMP_889(iPOOLS), function:getPoolAmounts, arguments:['token']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - "]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - (_baseAmt,_tokenAmt) = iPOOLS(POOLS).getPoolAmounts(token)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.IF - _baseAmt > 0 && _tokenAmt > 0"]
    Node_4 --> Node_5
    Node_4 --> Node_6
    Node_5["5: NodeType.RETURN - (amount * _tokenAmt) / _baseAmt"]
    Node_6["6: NodeType.ENDIF - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.RETURN - value"]
```

### Source Mapping
Declared in: `contracts/Utils.sol` on lines **77** to **82**

```solidity
    function calcValueInToken(address token, uint amount) public view returns (uint value){
        (uint _baseAmt, uint _tokenAmt) = iPOOLS(POOLS).getPoolAmounts(token);
        if(_baseAmt > 0 && _tokenAmt > 0){
            return (amount * _tokenAmt) / _baseAmt;
       }
    }

```
