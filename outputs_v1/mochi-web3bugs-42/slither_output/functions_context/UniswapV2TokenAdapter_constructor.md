# Context: UniswapV2TokenAdapter.constructor

**Contract:** `UniswapV2TokenAdapter` (Inherits: ICSSRAdapter)
**Signature:** `constructor(address,address,address,address)`
**Method Selector ID:** `0xb0647061`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** cssrRouter, owned, sushiCSSR, uniswapCSSR

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
    Node_1["1: NodeType.EXPRESSION - owned = IGovernanceOwned(_owned)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - cssrRouter = ICSSRRouter(_router)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - uniswapCSSR = IUniswapV2CSSR(_uniCSSR)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - sushiCSSR = IUniswapV2CSSR(_sushiCSSR)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-cssr/contracts/adapter/UniswapV2TokenAdapter.sol` on lines **27** to **37**

```solidity
    constructor(
        address _owned,
        address _router,
        address _uniCSSR,
        address _sushiCSSR
    ) {
        owned = IGovernanceOwned(_owned);
        cssrRouter = ICSSRRouter(_router);
        uniswapCSSR = IUniswapV2CSSR(_uniCSSR);
        sushiCSSR = IUniswapV2CSSR(_sushiCSSR);
    }

```
