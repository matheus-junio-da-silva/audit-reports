# Context: MochiTreasuryV0.veCRVlock

**Contract:** `MochiTreasuryV0` (Inherits: None)
**Signature:** `veCRVlock()`
**Method Selector ID:** `0x73e5ec06`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** lockCrv
- **Writes:** veCRVShare

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(lockCrv,!lock)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(lockCrv,!lock)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - updateFee()"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - _buyCRV()"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - _lockCRV()"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - veCRVShare = 0"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-core/contracts/treasury/MochiTreasuryV0.sol` on lines **73** to **79**

```solidity
    function veCRVlock() external {
        require(lockCrv, "!lock");
        updateFee();
        _buyCRV();
        _lockCRV();
        veCRVShare = 0;
    }

```
