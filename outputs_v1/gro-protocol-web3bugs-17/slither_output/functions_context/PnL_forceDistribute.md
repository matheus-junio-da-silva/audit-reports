# Context: PnL.forceDistribute

**Contract:** `PnL` (Inherits: IPnL, FixedGTokens, Constants, Controllable, Ownable, Context)
**Signature:** `forceDistribute()`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `private`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** DEFAULT_DECIMALS_FACTOR, lastPwrdAssets
- **Writes:** lastGvtAssets, lastPwrdAssets

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_177(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['lastPwrdAssets', 'DEFAULT_DECIMALS_FACTOR'] `
- `SafeMath.TMP_180(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['total', 'DEFAULT_DECIMALS_FACTOR'] `
- `IController.TMP_176(uint256) = HIGH_LEVEL_CALL, dest:TMP_175(IController), function:totalAssets, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - total = _controller().totalAssets()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.IF - total > lastPwrdAssets.add(DEFAULT_DECIMALS_FACTOR)"]
    Node_2 --> Node_3
    Node_2 --> Node_4
    Node_3["3: NodeType.EXPRESSION - lastGvtAssets = total - lastPwrdAssets"]
    Node_3 --> Node_6
    Node_4["4: NodeType.EXPRESSION - lastGvtAssets = DEFAULT_DECIMALS_FACTOR"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - lastPwrdAssets = total.sub(DEFAULT_DECIMALS_FACTOR)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.ENDIF - "]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/pnl/PnL.sol` on lines **230** to **239**

```solidity
    function forceDistribute() private {
        uint256 total = _controller().totalAssets();

        if (total > lastPwrdAssets.add(DEFAULT_DECIMALS_FACTOR)) {
            lastGvtAssets = total - lastPwrdAssets;
        } else {
            lastGvtAssets = DEFAULT_DECIMALS_FACTOR;
            lastPwrdAssets = total.sub(DEFAULT_DECIMALS_FACTOR);
        }
    }

```
