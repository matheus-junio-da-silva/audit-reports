# Context: ERC20Mock.constructor

**Contract:** `ERC20Mock` (Inherits: ERC20, IERC20, Context)
**Signature:** `constructor(string,string)`
**Method Selector ID:** `0xd4d8c5c3`
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
    Node_1["1: NodeType.EXPRESSION - _name = name_"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - _symbol = symbol_"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - _decimals = 18"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol` on lines **55** to **59**

```solidity
    constructor (string memory name_, string memory symbol_) public {
        _name = name_;
        _symbol = symbol_;
        _decimals = 18;
    }

```
