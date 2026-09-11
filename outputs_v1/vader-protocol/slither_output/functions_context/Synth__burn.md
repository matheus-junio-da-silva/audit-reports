# Context: Synth._burn

**Contract:** `Synth` (Inherits: iERC20)
**Signature:** `_burn(address,uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** _balances, totalSupply
- **Writes:** _balances, totalSupply

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(account != address(0),address err)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(account != address(0),address err)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - _balances(account) -= amount"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - totalSupply -= amount"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - Transfer(account,address(0),amount)"]
```

### Source Mapping
Declared in: `contracts/Synth.sol` on lines **101** to **106**

```solidity
    function _burn(address account, uint amount) internal virtual {
        require(account != address(0), "address err");
        _balances[account] -= amount;
        totalSupply -= amount;
        emit Transfer(account, address(0), amount);
    }

```
