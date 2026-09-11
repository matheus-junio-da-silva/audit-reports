# Context: Attack.init

**Contract:** `Attack` (Inherits: None)
**Signature:** `init(address,address)`
**Method Selector ID:** `0xf09a4016`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** inited
- **Writes:** USDV, VADER, inited

### Assertion Checks & Business Requirements
- require/assert: `require(bool)(inited == false)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool)(inited == false)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - inited = true"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - VADER = _vader"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - USDV = _USDV"]
```

### Source Mapping
Declared in: `contracts/Attack.sol` on lines **20** to **25**

```solidity
    function init(address _vader, address _USDV) public {
        require(inited == false);
inited = true;
        VADER = _vader;
        USDV = _USDV;
    }

```
