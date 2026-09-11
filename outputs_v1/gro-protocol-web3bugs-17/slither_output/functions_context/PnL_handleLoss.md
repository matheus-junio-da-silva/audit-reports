# Context: PnL.handleLoss

**Contract:** `PnL` (Inherits: IPnL, FixedGTokens, Constants, Controllable, Ownable, Context)
**Signature:** `handleLoss(uint256,uint256,uint256) returns (uint256, uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `private`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** DEFAULT_DECIMALS_FACTOR
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_172(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['loss', 'maxGvtLoss'] `
- `SafeMath.TMP_170(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['gvtAssets', 'DEFAULT_DECIMALS_FACTOR'] `
- `SafeMath.TMP_173(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['pwrdAssets', 'TMP_172'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - maxGvtLoss = gvtAssets.sub(DEFAULT_DECIMALS_FACTOR)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.IF - loss > maxGvtLoss"]
    Node_2 --> Node_3
    Node_2 --> Node_5
    Node_3["3: NodeType.EXPRESSION - gvtAssets = DEFAULT_DECIMALS_FACTOR"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - pwrdAssets = pwrdAssets.sub(loss.sub(maxGvtLoss))"]
    Node_4 --> Node_6
    Node_5["5: NodeType.EXPRESSION - gvtAssets = gvtAssets - loss"]
    Node_5 --> Node_6
    Node_6["6: NodeType.ENDIF - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.RETURN - (gvtAssets,pwrdAssets)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/pnl/PnL.sol` on lines **215** to **228**

```solidity
    function handleLoss(
        uint256 gvtAssets,
        uint256 pwrdAssets,
        uint256 loss
    ) private pure returns (uint256, uint256) {
        uint256 maxGvtLoss = gvtAssets.sub(DEFAULT_DECIMALS_FACTOR);
        if (loss > maxGvtLoss) {
            gvtAssets = DEFAULT_DECIMALS_FACTOR;
            pwrdAssets = pwrdAssets.sub(loss.sub(maxGvtLoss));
        } else {
            gvtAssets = gvtAssets - loss;
        }
        return (gvtAssets, pwrdAssets);
    }

```
