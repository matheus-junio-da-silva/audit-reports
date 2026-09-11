# Context: Vader._transfer

**Contract:** `Vader` (Inherits: iERC20)
**Signature:** `_transfer(address,address,uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** UTILS, _balances, feeOnTransfer
- **Writes:** _balances

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(sender != address(0),sender)`
- require/assert: `require(bool,string)(recipient != address(this),recipient)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `TMP_1113(None) = SOLIDITY_CALL require(bool,string)(TMP_1112,sender)`
- `iUTILS.TMP_1118(uint256) = HIGH_LEVEL_CALL, dest:TMP_1117(iUTILS), function:calcPart, arguments:['feeOnTransfer', 'amount']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(sender != address(0),sender)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(recipient != address(this),recipient)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - _balances(sender) -= amount"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - _fee = iUTILS(UTILS).calcPart(feeOnTransfer,amount)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.IF - _fee >= 0 && _fee <= amount"]
    Node_5 --> Node_6
    Node_5 --> Node_8
    Node_6["6: NodeType.EXPRESSION - amount -= _fee"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - _burn(msg.sender,_fee)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.ENDIF - "]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - _balances(recipient) += amount"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - Transfer(sender,recipient,amount)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - _checkEmission()"]
```

### Source Mapping
Declared in: `contracts/Vader.sol` on lines **122** to **134**

```solidity
    function _transfer(address sender, address recipient, uint amount) internal virtual {
        require(sender != address(0), "sender");
        require(recipient != address(this), "recipient");
        _balances[sender] -= amount;
        uint _fee = iUTILS(UTILS).calcPart(feeOnTransfer, amount);  // Critical functionality
        if(_fee >= 0 && _fee <= amount){                            // Stops reverts if UTILS corrupted
            amount -= _fee;
            _burn(msg.sender, _fee);
        }
        _balances[recipient] += amount;
        emit Transfer(sender, recipient, amount);
        _checkEmission();
    }

```
