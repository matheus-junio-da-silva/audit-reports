# Context: WJLP.constructor

**Contract:** `WJLP` (Inherits: IWAsset, ERC20_8, IERC20)
**Signature:** `constructor(string,string,uint8,IERC20,IERC20,IMasterChefJoeV2,uint256)`
**Method Selector ID:** `0x13085d57`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** JLP, JOE, _MasterChefJoe, _decimals, _name, _poolPid, _symbol

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
    Node_1["1: NodeType.EXPRESSION - checkContract(address(_JLP))"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - checkContract(address(_JOE))"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - checkContract(address(MasterChefJoe))"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - _symbol = ERC20_symbol"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - _name = ERC20_name"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - _decimals = ERC20_decimals"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - JLP = _JLP"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - JOE = _JOE"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - _MasterChefJoe = MasterChefJoe"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - _poolPid = poolPid"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/AssetWrappers/WJLP.sol` on lines **83** to **104**

```solidity
    constructor(string memory ERC20_symbol,
        string memory ERC20_name,
        uint8 ERC20_decimals,
        IERC20 _JLP,
        IERC20 _JOE,
        IMasterChefJoeV2 MasterChefJoe,
        uint256 poolPid) {

        checkContract(address(_JLP));
        checkContract(address(_JOE));
        checkContract(address(MasterChefJoe));

        _symbol = ERC20_symbol;
        _name = ERC20_name;
        _decimals = ERC20_decimals;

        JLP = _JLP;
        JOE = _JOE;

        _MasterChefJoe = MasterChefJoe;
        _poolPid = poolPid;
    }

```
