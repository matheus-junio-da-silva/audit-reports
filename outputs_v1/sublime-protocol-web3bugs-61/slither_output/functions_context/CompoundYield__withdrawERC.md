# Context: CompoundYield._withdrawERC

**Contract:** `CompoundYield` (Inherits: ReentrancyGuard, OwnableUpgradeable, ContextUpgradeable, Initializable, IYield)
**Signature:** `_withdrawERC(address,address,uint256) returns (uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(ICToken(cToken).redeem(amount) == 0,Error in unwrapping)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_3744(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['TMP_3743', 'initialAssetBalance'] `
- `IERC20.TMP_3743(uint256) = HIGH_LEVEL_CALL, dest:TMP_3741(IERC20), function:balanceOf, arguments:['TMP_3742']  `
- `ICToken.TMP_3738(uint256) = HIGH_LEVEL_CALL, dest:TMP_3737(ICToken), function:redeem, arguments:['amount']  `
- `IERC20.TMP_3736(uint256) = HIGH_LEVEL_CALL, dest:TMP_3734(IERC20), function:balanceOf, arguments:['TMP_3735']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - initialAssetBalance = IERC20(asset).balanceOf(address(this))"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(ICToken(cToken).redeem(amount) == 0,Error in unwrapping)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - tokensReceived = IERC20(asset).balanceOf(address(this)).sub(initialAssetBalance)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.RETURN - tokensReceived"]
```

### Source Mapping
Declared in: `contracts/yield/CompoundYield.sol` on lines **225** to **233**

```solidity
    function _withdrawERC(
        address asset,
        address cToken,
        uint256 amount
    ) internal returns (uint256 tokensReceived) {
        uint256 initialAssetBalance = IERC20(asset).balanceOf(address(this));
        require(ICToken(cToken).redeem(amount) == 0, 'Error in unwrapping');
        tokensReceived = IERC20(asset).balanceOf(address(this)).sub(initialAssetBalance);
    }

```
