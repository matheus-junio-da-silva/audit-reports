# Context: Router._handleTransferIn

**Contract:** `Router` (Inherits: None)
**Signature:** `_handleTransferIn(address,address,uint256) returns (uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** POOLS
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `iPOOLS.TMP_529(bool) = HIGH_LEVEL_CALL, dest:TMP_528(iPOOLS), function:isSynth, arguments:['_collateralAsset']  `
- `iPOOLS.HIGH_LEVEL_CALL, dest:TMP_533(iPOOLS), function:lockUnits, arguments:['_amount', '_collateralAsset', '_member']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.IF - isBase(_collateralAsset) || iPOOLS(POOLS).isSynth(_collateralAsset)"]
    Node_1 --> Node_2
    Node_1 --> Node_3
    Node_2["2: NodeType.EXPRESSION - _inputAmount = _getFunds(_collateralAsset,_amount)"]
    Node_2 --> Node_7
    Node_3["3: NodeType.IF - isPool(_collateralAsset)"]
    Node_3 --> Node_4
    Node_3 --> Node_6
    Node_4["4: NodeType.EXPRESSION - iPOOLS(POOLS).lockUnits(_amount,_collateralAsset,_member)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - _inputAmount = _amount"]
    Node_5 --> Node_6
    Node_6["6: NodeType.ENDIF - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.ENDIF - "]
    Node_7 --> Node_8
    Node_8["8: NodeType.RETURN - _inputAmount"]
```

### Source Mapping
Declared in: `contracts/Router.sol` on lines **386** to **393**

```solidity
    function _handleTransferIn(address _member, address _collateralAsset, uint _amount) internal returns(uint _inputAmount){
        if(isBase(_collateralAsset) || iPOOLS(POOLS).isSynth(_collateralAsset)){
            _inputAmount = _getFunds(_collateralAsset, _amount); // Get funds
        }else if(isPool(_collateralAsset)){
             iPOOLS(POOLS).lockUnits(_amount, _collateralAsset, _member); // Lock units to protocol
             _inputAmount = _amount;
        }
    }

```
