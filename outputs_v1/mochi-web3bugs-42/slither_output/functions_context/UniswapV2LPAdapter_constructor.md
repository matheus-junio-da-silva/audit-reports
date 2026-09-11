# Context: UniswapV2LPAdapter.constructor

**Contract:** `UniswapV2LPAdapter` (Inherits: ICSSRAdapter)
**Signature:** `constructor(address,address,address,address)`
**Method Selector ID:** `0xb0647061`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** cssr, factory, router, weth

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
    Node_1["1: NodeType.EXPRESSION - weth = _weth"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - router = ICSSRRouter(_router)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - cssr = IUniswapV2CSSR(_cssr)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - factory = _factory"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-cssr/contracts/adapter/UniswapV2LPAdapter.sol` on lines **20** to **25**

```solidity
    constructor(address _weth, address _factory, address _router, address _cssr) {
        weth = _weth;
        router = ICSSRRouter(_router);
        cssr = IUniswapV2CSSR(_cssr);
        factory = _factory;
    }

```
