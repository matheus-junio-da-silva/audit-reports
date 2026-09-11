# Context: Pools.getAddedAmount

**Contract:** `Pools` (Inherits: None)
**Signature:** `getAddedAmount(address,address) returns (uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** USDV, VADER, mapToken_tokenAmount, pooledUSDV, pooledVADER
- **Writes:** pooledUSDV, pooledVADER

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `iERC20.TMP_238(uint256) = HIGH_LEVEL_CALL, dest:TMP_236(iERC20), function:balanceOf, arguments:['TMP_237']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - _balance = iERC20(_token).balanceOf(address(this))"]
    Node_1 --> Node_2
    Node_2["2: NodeType.IF - _token == VADER && _pool != VADER"]
    Node_2 --> Node_3
    Node_2 --> Node_5
    Node_3["3: NodeType.EXPRESSION - addedAmount = _balance - pooledVADER"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - pooledVADER = pooledVADER + addedAmount"]
    Node_4 --> Node_10
    Node_5["5: NodeType.IF - _token == USDV"]
    Node_5 --> Node_6
    Node_5 --> Node_8
    Node_6["6: NodeType.EXPRESSION - addedAmount = _balance - pooledUSDV"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - pooledUSDV = pooledUSDV + addedAmount"]
    Node_7 --> Node_9
    Node_8["8: NodeType.EXPRESSION - addedAmount = _balance - mapToken_tokenAmount(_pool)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.ENDIF - "]
    Node_9 --> Node_10
    Node_10["10: NodeType.ENDIF - "]
    Node_10 --> Node_11
    Node_11["11: NodeType.RETURN - addedAmount"]
```

### Source Mapping
Declared in: `contracts/Pools.sol` on lines **192** to **203**

```solidity
    function getAddedAmount(address _token, address _pool) internal returns(uint addedAmount) {
        uint _balance = iERC20(_token).balanceOf(address(this));
        if(_token == VADER && _pool != VADER){  // Want to know added VADER
            addedAmount = _balance - pooledVADER;
            pooledVADER = pooledVADER + addedAmount;
        } else if(_token == USDV) {             // Want to know added USDV
            addedAmount = _balance - pooledUSDV;
            pooledUSDV = pooledUSDV + addedAmount;
        } else {                                // Want to know added Asset/Anchor
            addedAmount = _balance - mapToken_tokenAmount[_pool];
        }
    }

```
