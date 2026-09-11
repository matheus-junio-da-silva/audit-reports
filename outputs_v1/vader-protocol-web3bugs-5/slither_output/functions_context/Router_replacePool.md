# Context: Router.replacePool

**Contract:** `Router` (Inherits: None)
**Signature:** `replacePool(address,address)`
**Method Selector ID:** `0xe8b8cfa0`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** POOLS
- **Writes:** _isCurated

### Assertion Checks & Business Requirements
- require/assert: `require(bool)(iPOOLS(POOLS).isAsset(newToken))`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `iPOOLS.TMP_387(bool) = HIGH_LEVEL_CALL, dest:TMP_386(iPOOLS), function:isAsset, arguments:['newToken']  `
- `iPOOLS.TMP_390(uint256) = HIGH_LEVEL_CALL, dest:TMP_389(iPOOLS), function:getBaseAmount, arguments:['newToken']  `
- `iPOOLS.TMP_392(uint256) = HIGH_LEVEL_CALL, dest:TMP_391(iPOOLS), function:getBaseAmount, arguments:['oldToken']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool)(iPOOLS(POOLS).isAsset(newToken))"]
    Node_1 --> Node_2
    Node_2["2: NodeType.IF - iPOOLS(POOLS).getBaseAmount(newToken) > iPOOLS(POOLS).getBaseAmount(oldToken)"]
    Node_2 --> Node_3
    Node_2 --> Node_6
    Node_3["3: NodeType.EXPRESSION - _isCurated(oldToken) = false"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - _isCurated(newToken) = true"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - Curated(msg.sender,newToken)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.ENDIF - "]
```

### Source Mapping
Declared in: `contracts/Router.sol` on lines **234** to **241**

```solidity
    function replacePool(address oldToken, address newToken) external {
        require(iPOOLS(POOLS).isAsset(newToken));
        if(iPOOLS(POOLS).getBaseAmount(newToken) > iPOOLS(POOLS).getBaseAmount(oldToken)){ // Must be deeper
            _isCurated[oldToken] = false;
            _isCurated[newToken] = true;
            emit Curated(msg.sender, newToken);
        }
    }

```
