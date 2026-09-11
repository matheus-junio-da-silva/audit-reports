# Context: yVault.constructor

**Contract:** `yVault` (Inherits: ERC20Detailed, ERC20, Context)
**Signature:** `constructor(string,string,uint8)`
**Method Selector ID:** `0x5181b956`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** _decimals, _name, _symbol

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
    Node_1["1: NodeType.EXPRESSION - _name = name"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - _symbol = symbol"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - _decimals = decimals"]
```

### Source Mapping
Declared in: `contracts/mocks/yVault/yVault.sol` on lines **120** to **128**

```solidity
    constructor(
        string memory name,
        string memory symbol,
        uint8 decimals
    ) {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
    }

```
