# Context: MochiProfileV0.constructor

**Contract:** `MochiProfileV0` (Inherits: IMochiProfile)
**Signature:** `constructor(address)`
**Method Selector ID:** `0xf8a6c595`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** delay, engine, liquidityRequirement, minimumDebt, secPerYear

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
    Node_1["1: NodeType.EXPRESSION - secPerYear = 31536000"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - engine = IMochiEngine(_engine)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - liquidityRequirement = 1000000e18"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - minimumDebt = 1000e18"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - delay = 180"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-core/contracts/profile/MochiProfileV0.sol` on lines **27** to **34**

```solidity
    constructor(address _engine) {
        secPerYear = 31536000;
        engine = IMochiEngine(_engine);

        liquidityRequirement = 1000000e18; // 1million dollar
        minimumDebt = 1000e18;
        delay = 3 minutes;
    }

```
