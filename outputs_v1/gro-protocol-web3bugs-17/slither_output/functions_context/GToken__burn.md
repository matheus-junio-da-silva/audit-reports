# Context: GToken._burn

**Contract:** `GToken` (Inherits: IToken, Whitelist, Ownable, Constants, GERC20, IERC20, Context)
**Signature:** `_burn(address,uint256,uint256)`
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
- `SafeMath.TMP_158(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256,string), arguments:['REF_63', 'burnAmount', 'ERC20: burn amount exceeds balance'] `
- `SafeMath.TMP_159(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['_totalSupply', 'burnAmount'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(account != address(0),ERC20: burn from the zero address)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - _beforeTokenTransfer(account,address(0),burnAmount)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - _balances(account) = _balances(account).sub(burnAmount,ERC20: burn amount exceeds balance)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - _totalSupply = _totalSupply.sub(burnAmount)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - Transfer(account,address(0),amount)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/tokens/GERC20.sol` on lines **277** to **289**

```solidity
    function _burn(
        address account,
        uint256 burnAmount,
        uint256 amount
    ) internal virtual {
        require(account != address(0), "ERC20: burn from the zero address");

        _beforeTokenTransfer(account, address(0), burnAmount);

        _balances[account] = _balances[account].sub(burnAmount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.sub(burnAmount);
        emit Transfer(account, address(0), amount);
    }

```
