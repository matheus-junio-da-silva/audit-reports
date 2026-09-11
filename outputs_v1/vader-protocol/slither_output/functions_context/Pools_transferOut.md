# Context: Pools.transferOut

**Contract:** `Pools` (Inherits: None)
**Signature:** `transferOut(address,uint256,address)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** USDV, VADER, pooledUSDV, pooledVADER
- **Writes:** pooledUSDV, pooledVADER

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `iERC20.TMP_255(bool) = HIGH_LEVEL_CALL, dest:TMP_254(iERC20), function:transfer, arguments:['_recipient', '_amount']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.IF - _token == VADER"]
    Node_1 --> Node_2
    Node_1 --> Node_3
    Node_2["2: NodeType.EXPRESSION - pooledVADER = pooledVADER - _amount"]
    Node_2 --> Node_6
    Node_3["3: NodeType.IF - _token == USDV"]
    Node_3 --> Node_4
    Node_3 --> Node_5
    Node_4["4: NodeType.EXPRESSION - pooledUSDV = pooledUSDV - _amount"]
    Node_4 --> Node_5
    Node_5["5: NodeType.ENDIF - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.ENDIF - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.IF - _recipient != address(this)"]
    Node_7 --> Node_8
    Node_7 --> Node_9
    Node_8["8: NodeType.EXPRESSION - iERC20(_token).transfer(_recipient,_amount)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.ENDIF - "]
```

### Source Mapping
Declared in: `contracts/Pools.sol` on lines **204** to **213**

```solidity
    function transferOut(address _token, uint _amount, address _recipient) internal {
        if(_token == VADER){
            pooledVADER = pooledVADER - _amount; // Accounting
        } else if(_token == USDV) {
            pooledUSDV = pooledUSDV - _amount;  // Accounting
        }
        if(_recipient != address(this)){
            iERC20(_token).transfer(_recipient, _amount);
        }
    }

```
