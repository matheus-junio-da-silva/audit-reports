# Context: yVault.withdrawETH

**Contract:** `yVault` (Inherits: ERC20Detailed, ERC20, Context)
**Signature:** `withdrawETH(uint256)`
**Method Selector ID:** `0xf14210a6`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** controller, token
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_3404(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['_after', 'b'] `
- `IController.HIGH_LEVEL_CALL, dest:TMP_3399(IController), function:withdraw, arguments:['TMP_3400', '_withdraw']  `
- `WETH.HIGH_LEVEL_CALL, dest:TMP_3408(WETH), function:withdraw, arguments:['r']  `
- `SafeMath.TMP_3391(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['TMP_3390', '_shares'] `
- `ERC20.TMP_3396(uint256) = HIGH_LEVEL_CALL, dest:token(ERC20), function:balanceOf, arguments:['TMP_3395']  `
- `ERC20.TMP_3403(uint256) = HIGH_LEVEL_CALL, dest:token(ERC20), function:balanceOf, arguments:['TMP_3402']  `
- `SafeMath.TMP_3398(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['r', 'b'] `
- `SafeMath.TMP_3393(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_3391', 'TMP_3392'] `
- `SafeMath.TMP_3406(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['b', '_diff'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - r = (balance().mul(_shares)).div(totalSupply())"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - _burn(msg.sender,_shares)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - b = token.balanceOf(address(this))"]
    Node_3 --> Node_4
    Node_4["4: NodeType.IF - b < r"]
    Node_4 --> Node_5
    Node_4 --> Node_12
    Node_5["5: NodeType.VARIABLE - _withdraw = r.sub(b)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - IController(controller).withdraw(address(token),_withdraw)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - _after = token.balanceOf(address(this))"]
    Node_7 --> Node_8
    Node_8["8: NodeType.VARIABLE - _diff = _after.sub(b)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.IF - _diff < _withdraw"]
    Node_9 --> Node_10
    Node_9 --> Node_11
    Node_10["10: NodeType.EXPRESSION - r = b.add(_diff)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.ENDIF - "]
    Node_11 --> Node_12
    Node_12["12: NodeType.ENDIF - "]
    Node_12 --> Node_13
    Node_13["13: NodeType.EXPRESSION - WETH(address(token)).withdraw(r)"]
    Node_13 --> Node_14
    Node_14["14: NodeType.EXPRESSION - msg.sender.transfer(r)"]
```

### Source Mapping
Declared in: `contracts/mocks/yVault/yVault.sol` on lines **342** to **360**

```solidity
    function withdrawETH(uint256 _shares) public {
        uint256 r = (balance().mul(_shares)).div(totalSupply());
        _burn(msg.sender, _shares);

        // Check balance
        uint256 b = token.balanceOf(address(this));
        if (b < r) {
            uint256 _withdraw = r.sub(b);
            IController(controller).withdraw(address(token), _withdraw);
            uint256 _after = token.balanceOf(address(this));
            uint256 _diff = _after.sub(b);
            if (_diff < _withdraw) {
                r = b.add(_diff);
            }
        }

        WETH(address(token)).withdraw(r);
        msg.sender.transfer(r);
    }

```
