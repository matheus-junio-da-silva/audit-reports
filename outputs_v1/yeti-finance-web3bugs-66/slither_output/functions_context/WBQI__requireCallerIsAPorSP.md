# Context: WBQI._requireCallerIsAPorSP

**Contract:** `WBQI` (Inherits: IWAsset, ERC20_8, IERC20)
**Signature:** `_requireCallerIsAPorSP()`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** activePool, stabilityPool
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)((msg.sender == activePool || msg.sender == stabilityPool),Caller is not active pool or stability pool)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool,string)((msg.sender == activePool || msg.sender == stabilityPool),Caller is not active pool or stability pool)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/AssetWrappers/WBQI.sol` on lines **271** to **275**

```solidity
    function _requireCallerIsAPorSP() internal view {
        require((msg.sender == activePool || msg.sender == stabilityPool),
            "Caller is not active pool or stability pool"
        );
    }

```
