# Context: MochiTreasuryV0.constructor

**Contract:** `MochiTreasuryV0` (Inherits: None)
**Signature:** `constructor(address,address,address,address)`
**Method Selector ID:** `0xb0647061`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** crv, engine, lockCrv, uniswapRouter, veCrv

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
    Node_1["1: NodeType.EXPRESSION - engine = IMochiEngine(_engine)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - uniswapRouter = IUniswapV2Router02(_uniswap)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - crv = IERC20(_crv)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - veCrv = ICurveVotingEscrow(_veCrv)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - lockCrv = false"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-core/contracts/treasury/MochiTreasuryV0.sol` on lines **20** to **31**

```solidity
    constructor(
        address _engine,
        address _uniswap,
        address _crv,
        address _veCrv
    ) {
        engine = IMochiEngine(_engine);
        uniswapRouter = IUniswapV2Router02(_uniswap);
        crv = IERC20(_crv);
        veCrv = ICurveVotingEscrow(_veCrv);
        lockCrv = false;
    }

```
