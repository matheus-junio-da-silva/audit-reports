# Context: Utils.init

**Contract:** `Utils` (Inherits: None)
**Signature:** `init(address,address,address,address,address)`
**Method Selector ID:** `0x359ef75b`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** inited
- **Writes:** FACTORY, POOLS, ROUTER, USDV, VADER, inited

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(inited == false,inited)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(inited == false,inited)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - inited = true"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - VADER = _vader"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - USDV = _usdv"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - ROUTER = _router"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - POOLS = _pools"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - FACTORY = _factory"]
```

### Source Mapping
Declared in: `contracts/Utils.sol` on lines **30** to **38**

```solidity
    function init(address _vader, address _usdv, address _router, address _pools, address _factory) public {
        require(inited == false,  "inited");
        inited = true;
        VADER = _vader;
        USDV = _usdv;
        ROUTER = _router;
        POOLS = _pools;
        FACTORY = _factory;
    }

```
