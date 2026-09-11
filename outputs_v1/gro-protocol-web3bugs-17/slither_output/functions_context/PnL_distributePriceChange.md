# Context: PnL.distributePriceChange

**Contract:** `PnL` (Inherits: IPnL, FixedGTokens, Constants, Controllable, Ownable, Context)
**Signature:** `distributePriceChange(uint256)`
**Method Selector ID:** `0xe3d94944`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** controller, lastGvtAssets, lastPwrdAssets
- **Writes:** lastGvtAssets, lastPwrdAssets

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(msg.sender == controller,!Controller)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_197(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['currentTotalAssets', 'totalAssets'] `
- `SafeMath.TMP_198(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['gvtAssets', 'TMP_197'] `
- `SafeMath.TMP_195(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['gvtAssets', 'pwrdAssets'] `
- `SafeMath.TMP_200(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['totalAssets', 'currentTotalAssets'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(msg.sender == controller,!Controller)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - gvtAssets = lastGvtAssets"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - pwrdAssets = lastPwrdAssets"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - totalAssets = gvtAssets.add(pwrdAssets)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.IF - currentTotalAssets > totalAssets"]
    Node_5 --> Node_6
    Node_5 --> Node_7
    Node_6["6: NodeType.EXPRESSION - lastGvtAssets = gvtAssets.add(currentTotalAssets.sub(totalAssets))"]
    Node_6 --> Node_10
    Node_7["7: NodeType.IF - currentTotalAssets < totalAssets"]
    Node_7 --> Node_8
    Node_7 --> Node_9
    Node_8["8: NodeType.EXPRESSION - (lastGvtAssets,lastPwrdAssets) = handleLoss(gvtAssets,pwrdAssets,totalAssets.sub(currentTotalAssets))"]
    Node_8 --> Node_9
    Node_9["9: NodeType.ENDIF - "]
    Node_9 --> Node_10
    Node_10["10: NodeType.ENDIF - "]
    Node_10 --> Node_11
    Node_11["11: NodeType.VARIABLE - priceChange = int256(currentTotalAssets) - int256(totalAssets)"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - LogPnLExecution(0,priceChange,0,priceChange,0,0,gvtAssets,pwrdAssets,lastGvtAssets,lastPwrdAssets)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/pnl/PnL.sol` on lines **282** to **307**

```solidity
    function distributePriceChange(uint256 currentTotalAssets) external override {
        require(msg.sender == controller, "!Controller");
        uint256 gvtAssets = lastGvtAssets;
        uint256 pwrdAssets = lastPwrdAssets;
        uint256 totalAssets = gvtAssets.add(pwrdAssets);

        if (currentTotalAssets > totalAssets) {
            lastGvtAssets = gvtAssets.add(currentTotalAssets.sub(totalAssets));
        } else if (currentTotalAssets < totalAssets) {
            (lastGvtAssets, lastPwrdAssets) = handleLoss(gvtAssets, pwrdAssets, totalAssets.sub(currentTotalAssets));
        }
        int256 priceChange = int256(currentTotalAssets) - int256(totalAssets);

        emit LogPnLExecution(
            0,
            priceChange,
            0,
            priceChange,
            0,
            0,
            gvtAssets,
            pwrdAssets,
            lastGvtAssets,
            lastPwrdAssets
        );
    }

```
