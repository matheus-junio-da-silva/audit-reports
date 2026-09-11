# Context: StabilityPoolScript.constructor

**Contract:** `StabilityPoolScript` (Inherits: CheckContract)
**Signature:** `constructor(IStabilityPool)`
**Method Selector ID:** `0xf8a6c595`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** stabilityPool

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
    Node_1["1: NodeType.EXPRESSION - checkContract(address(_stabilityPool))"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - stabilityPool = _stabilityPool"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/Proxy/StabilityPoolScript.sol` on lines **14** to **17**

```solidity
    constructor(IStabilityPool _stabilityPool) public {
        checkContract(address(_stabilityPool));
        stabilityPool = _stabilityPool;
    }

```
