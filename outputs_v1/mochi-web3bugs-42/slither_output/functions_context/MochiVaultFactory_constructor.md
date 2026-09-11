# Context: MochiVaultFactory.constructor

**Contract:** `MochiVaultFactory` (Inherits: IMochiVaultFactory)
**Signature:** `constructor(address)`
**Method Selector ID:** `0xf8a6c595`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** beacon, engine

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
    Node_1["1: NodeType.EXPRESSION - beacon = new Beacon(address(0))"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - engine = IMochiEngine(_engine)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-core/contracts/vault/MochiVaultFactory.sol` on lines **15** to **18**

```solidity
    constructor(address _engine) {
        beacon = new Beacon(address(0));
        engine = IMochiEngine(_engine);
    }

```
