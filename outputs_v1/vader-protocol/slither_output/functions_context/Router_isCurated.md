# Context: Router.isCurated

**Contract:** `Router` (Inherits: None)
**Signature:** `isCurated(address) returns (bool)`
**Method Selector ID:** `0x774d70e4`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** _isCurated
- **Writes:** None

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
    Node_1["1: NodeType.IF - _isCurated(token)"]
    Node_1 --> Node_2
    Node_1 --> Node_3
    Node_2["2: NodeType.EXPRESSION - curated = true"]
    Node_2 --> Node_3
    Node_3["3: NodeType.ENDIF - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.RETURN - curated"]
```

### Source Mapping
Declared in: `contracts/Router.sol` on lines **473** to **477**

```solidity
    function isCurated(address token) public view returns(bool curated) {
        if(_isCurated[token]){
            curated = true;
        }
    }

```
