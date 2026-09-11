# Context: Vader.init

**Contract:** `Vader` (Inherits: iERC20)
**Signature:** `init(address,address,address)`
**Method Selector ID:** `0x184b9559`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** inited
- **Writes:** USDV, UTILS, VETHER, inited, rewardAddress

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
    Node_3["3: NodeType.EXPRESSION - VETHER = _vether"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - USDV = _USDV"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - UTILS = _utils"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - rewardAddress = _USDV"]
```

### Source Mapping
Declared in: `contracts/Vader.sol` on lines **74** to **81**

```solidity
    function init(address _vether, address _USDV, address _utils) external {
        require(inited == false);
        inited = true;
        VETHER = _vether;
        USDV = _USDV;
        UTILS = _utils;
        rewardAddress = _USDV;
    }

```
