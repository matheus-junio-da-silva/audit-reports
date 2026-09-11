# Context: ERC20Token.constructor

**Contract:** `ERC20Token` (Inherits: None)
**Signature:** `constructor(string,string,uint8)`
**Method Selector ID:** `0x5181b956`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** _decimals, _name, _symbol, _totalSupply

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
    Node_1["1: NodeType.EXPRESSION - _symbol = ERC20_symbol"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - _name = ERC20_name"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - _decimals = ERC20_decimals"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - _totalSupply = 0"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TestContracts/TestAssets/ERC20Token.sol` on lines **184** to **189**

```solidity
    constructor(string memory ERC20_symbol, string memory ERC20_name, uint8 ERC20_decimals) public {
        _symbol = ERC20_symbol;
        _name = ERC20_name;
        _decimals = ERC20_decimals;
        _totalSupply = 0;
    }

```
