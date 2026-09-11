# Context: YUSDToken._mint

**Contract:** `YUSDToken` (Inherits: IYUSDToken, IERC2612, IERC20, CheckContract)
**Signature:** `_mint(address,uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** _balances, _totalSupply
- **Writes:** _balances, _totalSupply

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(account != address(0),_mint: account is address(0))`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_100(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['_totalSupply', 'amount'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(account != address(0),_mint: account is address(0))"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - _totalSupply = _totalSupply.add(amount)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - _balances(account) = _balances(account) + amount"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - Transfer(address(0),account,amount)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/YUSDToken.sol` on lines **237** to **243**

```solidity
    function _mint(address account, uint256 amount) internal {
        require(account != address(0), "_mint: account is address(0)");

        _totalSupply = _totalSupply.add(amount);
        _balances[account] = _balances[account] + amount; 
        emit Transfer(address(0), account, amount);
    }

```
