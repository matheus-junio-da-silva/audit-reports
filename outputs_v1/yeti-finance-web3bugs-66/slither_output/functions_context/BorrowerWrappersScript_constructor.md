# Context: BorrowerWrappersScript.constructor

**Contract:** `BorrowerWrappersScript` (Inherits: SYETIScript, ETHTransferScript, BorrowerOperationsScript, CheckContract)
**Signature:** `constructor(address)`
**Method Selector ID:** `0xf8a6c595`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** SYETI

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
    Node_1["1: NodeType.EXPRESSION - checkContract(_sYETIAddress)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - SYETI = ISYETI(_sYETIAddress)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/Proxy/SYETIScript.sol` on lines **12** to **15**

```solidity
    constructor(address _sYETIAddress) public {
        checkContract(_sYETIAddress);
        SYETI = ISYETI(_sYETIAddress);
    }

```
