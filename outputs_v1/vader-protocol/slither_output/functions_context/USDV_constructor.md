# Context: USDV.constructor

**Contract:** `USDV` (Inherits: iERC20)
**Signature:** `constructor()`
**Method Selector ID:** `0x90fa17bb`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** decimals, name, symbol, totalSupply

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
    Node_1["1: NodeType.EXPRESSION - name = VADER STABLE DOLLAR"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - symbol = USDV"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - decimals = 18"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - totalSupply = 0"]
```

### Source Mapping
Declared in: `contracts/USDV.sol` on lines **48** to **53**

```solidity
    constructor() {
        name = 'VADER STABLE DOLLAR';
        symbol = 'USDV';
        decimals = 18;
        totalSupply = 0;
    }

```
