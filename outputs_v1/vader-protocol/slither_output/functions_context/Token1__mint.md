# Context: Token1._mint

**Contract:** `Token1` (Inherits: iERC20)
**Signature:** `_mint(address,uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** _balances, totalSupply
- **Writes:** _balances, totalSupply

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(account != address(0),recipient)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- None

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(account != address(0),recipient)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - totalSupply += amount"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - _balances(account) += amount"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - Transfer(address(0),account,amount)"]
```

### Source Mapping
Declared in: `contracts/Token1.sol` on lines **74** to **79**

```solidity
    function _mint(address account, uint amount) internal virtual {
        require(account != address(0), "recipient");
        totalSupply += amount;
        _balances[account] += amount;
        emit Transfer(address(0), account, amount);
    }

```
