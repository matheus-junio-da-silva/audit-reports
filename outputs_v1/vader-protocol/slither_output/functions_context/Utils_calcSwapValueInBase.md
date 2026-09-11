# Context: Utils.calcSwapValueInBase

**Contract:** `Utils` (Inherits: None)
**Signature:** `calcSwapValueInBase(address,uint256) returns (uint256)`
**Method Selector ID:** `0xb80e44b8`
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
- `iPOOLS.TUPLE_7(uint256,uint256) = HIGH_LEVEL_CALL, dest:TMP_897(iPOOLS), function:getPoolAmounts, arguments:['token']  `

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
    Node_4["4: NodeType.RETURN - calcSwapOutput(amount,_tokenAmt,_baseAmt)"]
```

### Source Mapping
Declared in: `contracts/Utils.sol` on lines **87** to **90**

```solidity
    function calcSwapValueInBase(address token, uint amount) public view returns (uint){
        (uint _baseAmt, uint _tokenAmt) = iPOOLS(POOLS).getPoolAmounts(token);
        return calcSwapOutput(amount, _tokenAmt, _baseAmt);
    }

```
