# Context: Vader._mint

**Contract:** `Vader` (Inherits: iERC20)
**Signature:** `_mint(address,uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** _balances, maxSupply, totalSupply
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
    Node_2["2: NodeType.IF - (totalSupply + amount) >= maxSupply"]
    Node_2 --> Node_3
    Node_2 --> Node_4
    Node_3["3: NodeType.EXPRESSION - amount = maxSupply - totalSupply"]
    Node_3 --> Node_4
    Node_4["4: NodeType.ENDIF - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - totalSupply += amount"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - _balances(account) += amount"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - Transfer(address(0),account,amount)"]
```

### Source Mapping
Declared in: `contracts/Vader.sol` on lines **136** to **144**

```solidity
    function _mint(address account, uint amount) internal virtual {
        require(account != address(0), "recipient");
        if((totalSupply + amount) >= maxSupply){
            amount = maxSupply - totalSupply;       // Safety, can't mint above maxSupply
        }
        totalSupply += amount;
        _balances[account] += amount;
        emit Transfer(address(0), account, amount);
    }

```
