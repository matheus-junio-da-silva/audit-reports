# Context: Vault.getFunds

**Contract:** `Vault` (Inherits: None)
**Signature:** `getFunds(address,uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool)(iERC20(synth).transferTo(address(this),amount))`
- require/assert: `require(bool)(iERC20(synth).transferFrom(msg.sender,address(this),amount))`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `iERC20.TMP_1296(bool) = HIGH_LEVEL_CALL, dest:TMP_1294(iERC20), function:transferFrom, arguments:['msg.sender', 'TMP_1295', 'amount']  `
- `iERC20.TMP_1292(bool) = HIGH_LEVEL_CALL, dest:TMP_1290(iERC20), function:transferTo, arguments:['TMP_1291', 'amount']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.IF - tx.origin == msg.sender"]
    Node_1 --> Node_2
    Node_1 --> Node_3
    Node_2["2: NodeType.EXPRESSION - require(bool)(iERC20(synth).transferTo(address(this),amount))"]
    Node_2 --> Node_4
    Node_3["3: NodeType.EXPRESSION - require(bool)(iERC20(synth).transferFrom(msg.sender,address(this),amount))"]
    Node_3 --> Node_4
    Node_4["4: NodeType.ENDIF - "]
```

### Source Mapping
Declared in: `contracts/Vault.sol` on lines **168** to **174**

```solidity
    function getFunds(address synth, uint amount) internal {
        if(tx.origin==msg.sender){
            require(iERC20(synth).transferTo(address(this), amount));
        }else{
            require(iERC20(synth).transferFrom(msg.sender, address(this), amount));
        }
    }

```
