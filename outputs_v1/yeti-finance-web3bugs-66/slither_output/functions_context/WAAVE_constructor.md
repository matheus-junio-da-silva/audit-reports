# Context: WAAVE.constructor

**Contract:** `WAAVE` (Inherits: IWAsset, ERC20_8, IERC20)
**Signature:** `constructor(string,string,uint8,IERC20)`
**Method Selector ID:** `0x8983c26b`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** _decimals, _name, _symbol, _totalSupply, aToken

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
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - aToken = _aToken"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/AssetWrappers/WAAVE.sol` on lines **43** to **56**

```solidity
    constructor(string memory ERC20_symbol,
        string memory ERC20_name,
        uint8 ERC20_decimals,
        IERC20 _aToken
        ) {

        _symbol = ERC20_symbol;
        _name = ERC20_name;
        _decimals = ERC20_decimals;
        _totalSupply = 0;

        aToken = _aToken;

    }

```
