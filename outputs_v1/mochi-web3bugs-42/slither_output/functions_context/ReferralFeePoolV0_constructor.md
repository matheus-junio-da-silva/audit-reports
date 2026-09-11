# Context: ReferralFeePoolV0.constructor

**Contract:** `ReferralFeePoolV0` (Inherits: IReferralFeePool)
**Signature:** `constructor(address,address)`
**Method Selector ID:** `0x4525f804`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** engine, uniswapRouter

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
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-core/contracts/feePool/ReferralFeePoolV0.sol` on lines **17** to **20**

```solidity
    constructor(address _engine, address _uniswap) {
        engine = IMochiEngine(_engine);
        uniswapRouter = IUniswapV2Router02(_uniswap);
    }

```
