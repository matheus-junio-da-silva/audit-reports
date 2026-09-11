# Context: USDV._burn

**Contract:** `USDV` (Inherits: iERC20)
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
    Node_1["1: NodeType.IF - amount > 0"]
    Node_1 --> Node_2
    Node_1 --> Node_6
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(account != address(0),address err)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - _balances(account) -= amount"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - totalSupply -= amount"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - Transfer(account,address(0),amount)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.ENDIF - "]
```

### Source Mapping
Declared in: `contracts/USDV.sol` on lines **129** to **136**

```solidity
    function _burn(address account, uint amount) internal virtual {
        if(amount > 0){                                     // Due to design, this function may be called with 0
            require(account != address(0), "address err");
            _balances[account] -= amount;
            totalSupply -= amount;
            emit Transfer(account, address(0), amount);
        }
    }

```
