# Context: USDV._transfer

**Contract:** `USDV` (Inherits: iERC20)
**Signature:** `_transfer(address,address,uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** _balances
- **Writes:** _balances

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(sender != address(0),sender)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `TMP_749(None) = SOLIDITY_CALL require(bool,string)(TMP_748,sender)`

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.IF - amount > 0"]
    Node_1 --> Node_2
    Node_1 --> Node_7
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(sender != address(0),sender)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - _balances(sender) -= amount"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - _balances(recipient) += amount"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - Transfer(sender,recipient,amount)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - _checkIncentives()"]
    Node_6 --> Node_7
    Node_7["7: NodeType.ENDIF - "]
```

### Source Mapping
Declared in: `contracts/USDV.sol` on lines **102** to **110**

```solidity
    function _transfer(address sender, address recipient, uint amount) internal virtual {
        if(amount > 0){                                     // Due to design, this function may be called with 0
            require(sender != address(0), "sender");
            _balances[sender] -= amount;
            _balances[recipient] += amount;
            emit Transfer(sender, recipient, amount);
            _checkIncentives();
        }
    }

```
