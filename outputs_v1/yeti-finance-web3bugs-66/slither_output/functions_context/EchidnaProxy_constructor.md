# Context: EchidnaProxy.constructor

**Contract:** `EchidnaProxy` (Inherits: None)
**Signature:** `constructor(TroveManager,BorrowerOperations,StabilityPool,YUSDToken)`
**Method Selector ID:** `0xb0647061`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** borrowerOperations, stabilityPool, troveManager, yusdToken

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
    Node_1["1: NodeType.EXPRESSION - troveManager = _troveManager"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - borrowerOperations = _borrowerOperations"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - stabilityPool = _stabilityPool"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - yusdToken = _yusdToken"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TestContracts/EchidnaProxy.sol` on lines **16** to **26**

```solidity
    constructor(
        TroveManager _troveManager,
        BorrowerOperations _borrowerOperations,
        StabilityPool _stabilityPool,
        YUSDToken _yusdToken
    ) public {
        troveManager = _troveManager;
        borrowerOperations = _borrowerOperations;
        stabilityPool = _stabilityPool;
        yusdToken = _yusdToken;
    }

```
