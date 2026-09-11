# Context: YUSDToken._requireCallerIsTMLorSP

**Contract:** `YUSDToken` (Inherits: IYUSDToken, IERC2612, IERC20, CheckContract)
**Signature:** `_requireCallerIsTMLorSP()`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** stabilityPoolAddress, troveManagerLiquidationsAddress
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(msg.sender == stabilityPoolAddress || msg.sender == troveManagerLiquidationsAddress,YUSD: Caller is neither TroveManagerLiquidator nor StabilityPool)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(msg.sender == stabilityPoolAddress || msg.sender == troveManagerLiquidationsAddress,YUSD: Caller is neither TroveManagerLiquidator nor StabilityPool)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/YUSDToken.sol` on lines **297** to **301**

```solidity
    function _requireCallerIsTMLorSP() internal view {
        require(
            msg.sender == stabilityPoolAddress || msg.sender == troveManagerLiquidationsAddress,
            "YUSD: Caller is neither TroveManagerLiquidator nor StabilityPool");
    }

```
