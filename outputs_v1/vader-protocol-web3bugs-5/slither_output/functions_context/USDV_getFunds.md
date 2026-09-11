# Context: USDV.getFunds

**Contract:** `USDV` (Inherits: iERC20)
**Signature:** `getFunds(address,uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool)(iERC20(token).transferTo(address(this),amount))`
- require/assert: `require(bool)(iERC20(token).transferFrom(msg.sender,address(this),amount))`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `iERC20.TMP_827(bool) = HIGH_LEVEL_CALL, dest:TMP_825(iERC20), function:transferTo, arguments:['TMP_826', 'amount']  `
- `iERC20.TMP_831(bool) = HIGH_LEVEL_CALL, dest:TMP_829(iERC20), function:transferFrom, arguments:['msg.sender', 'TMP_830', 'amount']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.IF - token == address(this)"]
    Node_1 --> Node_2
    Node_1 --> Node_3
    Node_2["2: NodeType.EXPRESSION - _transfer(msg.sender,address(this),amount)"]
    Node_2 --> Node_7
    Node_3["3: NodeType.IF - tx.origin == msg.sender"]
    Node_3 --> Node_4
    Node_3 --> Node_5
    Node_4["4: NodeType.EXPRESSION - require(bool)(iERC20(token).transferTo(address(this),amount))"]
    Node_4 --> Node_6
    Node_5["5: NodeType.EXPRESSION - require(bool)(iERC20(token).transferFrom(msg.sender,address(this),amount))"]
    Node_5 --> Node_6
    Node_6["6: NodeType.ENDIF - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.ENDIF - "]
```

### Source Mapping
Declared in: `contracts/USDV.sol` on lines **195** to **205**

```solidity
    function getFunds(address token, uint amount) internal {
        if(token == address(this)){
            _transfer(msg.sender, address(this), amount);
        } else {
            if(tx.origin==msg.sender){
                require(iERC20(token).transferTo(address(this), amount));
            }else{
                require(iERC20(token).transferFrom(msg.sender, address(this), amount));
            }
        }
    }

```
