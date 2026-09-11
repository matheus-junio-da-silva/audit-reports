# Context: yVault._mint

**Contract:** `yVault` (Inherits: ERC20Detailed, ERC20, Context)
**Signature:** `_mint(address,uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** _balances, _totalSupply
- **Writes:** _balances, _totalSupply

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(account != address(0),ERC20: mint to the zero address)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_3275(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['REF_1537', 'amount'] `
- `SafeMath.TMP_3274(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['_totalSupply', 'amount'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(account != address(0),ERC20: mint to the zero address)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - _totalSupply = _totalSupply.add(amount)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - _balances(account) = _balances(account).add(amount)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - Transfer(address(0),account,amount)"]
```

### Source Mapping
Declared in: `contracts/mocks/yVault/yVault.sol` on lines **81** to **87**

```solidity
    function _mint(address account, uint256 amount) internal {
        require(account != address(0), 'ERC20: mint to the zero address');

        _totalSupply = _totalSupply.add(amount);
        _balances[account] = _balances[account].add(amount);
        emit Transfer(address(0), account, amount);
    }

```
