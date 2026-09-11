# Context: ERC20._burn

**Contract:** `ERC20` (Inherits: IERC20, Context)
**Signature:** `_burn(address,uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** _balances, _totalSupply
- **Writes:** _balances, _totalSupply

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(account != address(0),ERC20: burn from the zero address)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_509(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256,string), arguments:['REF_176', 'amount', 'ERC20: burn amount exceeds balance'] `
- `SafeMath.TMP_510(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['_totalSupply', 'amount'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(account != address(0),ERC20: burn from the zero address)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - _beforeTokenTransfer(account,address(0),amount)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - _balances(account) = _balances(account).sub(amount,ERC20: burn amount exceeds balance)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - _totalSupply = _totalSupply.sub(amount)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - Transfer(account,address(0),amount)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol` on lines **249** to **257**

```solidity
    function _burn(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: burn from the zero address");

        _beforeTokenTransfer(account, address(0), amount);

        _balances[account] = _balances[account].sub(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.sub(amount);
        emit Transfer(account, address(0), amount);
    }

```
