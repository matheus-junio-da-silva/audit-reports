# Context: DAO.init

**Contract:** `DAO` (Inherits: None)
**Signature:** `init(address,address,address)`
**Method Selector ID:** `0x184b9559`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** inited
- **Writes:** USDV, VADER, VAULT, coolOffPeriod, inited

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
    Node_4["4: NodeType.EXPRESSION - USDV = _usdv"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - VAULT = _vault"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - coolOffPeriod = 1"]
```

### Source Mapping
Declared in: `contracts/DAO.sol` on lines **46** to **53**

```solidity
    function init(address _vader, address _usdv, address _vault) public {
        require(inited == false);
        inited = true;
        VADER = _vader;
        USDV = _usdv;
        VAULT = _vault;
        coolOffPeriod = 1;
    }

```
