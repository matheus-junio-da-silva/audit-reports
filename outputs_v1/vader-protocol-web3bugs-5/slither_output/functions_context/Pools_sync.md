# Context: Pools.sync

**Contract:** `Pools` (Inherits: None)
**Signature:** `sync(address,address)`
**Method Selector ID:** `0x3041949b`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** USDV, VADER, mapToken_baseAmount, mapToken_tokenAmount
- **Writes:** mapToken_baseAmount, mapToken_tokenAmount

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
    Node_1["1: NodeType.VARIABLE - _actualInput = getAddedAmount(token,pool)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.IF - token == VADER || token == USDV"]
    Node_2 --> Node_3
    Node_2 --> Node_4
    Node_3["3: NodeType.EXPRESSION - mapToken_baseAmount(pool) += _actualInput"]
    Node_3 --> Node_5
    Node_4["4: NodeType.EXPRESSION - mapToken_tokenAmount(pool) += _actualInput"]
    Node_4 --> Node_5
    Node_5["5: NodeType.ENDIF - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - Sync(token,pool,_actualInput)"]
```

### Source Mapping
Declared in: `contracts/Pools.sol` on lines **122** to **132**

```solidity
    function sync(address token, address pool) external {
        uint _actualInput = getAddedAmount(token, pool);
        if (token == VADER || token == USDV){
            mapToken_baseAmount[pool] += _actualInput;
        } else {
            mapToken_tokenAmount[pool] += _actualInput;
        // } else if(isSynth()){
        //     //burnSynth && deleteUnits
        }
        emit Sync(token, pool, _actualInput);
    }

```
