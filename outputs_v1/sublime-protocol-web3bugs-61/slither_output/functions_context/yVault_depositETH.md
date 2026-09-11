# Context: yVault.depositETH

**Contract:** `yVault` (Inherits: ERC20Detailed, ERC20, Context)
**Signature:** `depositETH()`
**Method Selector ID:** `0xf6326fb3`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** token
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `ERC20.TMP_3348(uint256) = HIGH_LEVEL_CALL, dest:token(ERC20), function:balanceOf, arguments:['TMP_3347']  `
- `SafeMath.TMP_3359(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_3358', '_pool'] `
- `SafeMath.TMP_3358(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['_amount', 'TMP_3357'] `
- `ERC20.TMP_3353(uint256) = HIGH_LEVEL_CALL, dest:token(ERC20), function:balanceOf, arguments:['TMP_3352']  `
- `WETH.HIGH_LEVEL_CALL, dest:TMP_3350(WETH), function:deposit, arguments:[] value:_amount `
- `SafeMath.TMP_3354(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['_after', '_before'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - _pool = balance()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - _before = token.balanceOf(address(this))"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - _amount = msg.value"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - WETH(address(token)).deposit(value: _amount)()"]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - _after = token.balanceOf(address(this))"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - _amount = _after.sub(_before)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - shares = 0"]
    Node_7 --> Node_8
    Node_8["8: NodeType.IF - totalSupply() == 0"]
    Node_8 --> Node_9
    Node_8 --> Node_10
    Node_9["9: NodeType.EXPRESSION - shares = _amount"]
    Node_9 --> Node_11
    Node_10["10: NodeType.EXPRESSION - shares = (_amount.mul(totalSupply())).div(_pool)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.ENDIF - "]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - _mint(msg.sender,shares)"]
```

### Source Mapping
Declared in: `contracts/mocks/yVault/yVault.sol` on lines **290** to **304**

```solidity
    function depositETH() public payable {
        uint256 _pool = balance();
        uint256 _before = token.balanceOf(address(this));
        uint256 _amount = msg.value;
        WETH(address(token)).deposit{value: _amount}();
        uint256 _after = token.balanceOf(address(this));
        _amount = _after.sub(_before); // Additional check for deflationary tokens
        uint256 shares = 0;
        if (totalSupply() == 0) {
            shares = _amount;
        } else {
            shares = (_amount.mul(totalSupply())).div(_pool);
        }
        _mint(msg.sender, shares);
    }

```
