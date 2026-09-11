# Context: StabilityPoolTester.addCollateralType

**Contract:** `StabilityPoolTester` (Inherits: StabilityPool, IStabilityPool, ICollateralReceiver, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `addCollateralType(address)`
**Method Selector ID:** `0xec0d5e0c`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** lastAssetError_Offset, totalColl
- **Writes:** lastAssetError_Offset, totalColl

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
    Node_1["1: NodeType.EXPRESSION - _requireCallerIsWhitelist()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - lastAssetError_Offset.push(0)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - totalColl.tokens.push(_collateral)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - totalColl.amounts.push(0)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/StabilityPool.sol` on lines **1161** to **1166**

```solidity
    function addCollateralType(address _collateral) external override {
        _requireCallerIsWhitelist();
        lastAssetError_Offset.push(0);
        totalColl.tokens.push(_collateral);
        totalColl.amounts.push(0);
    }

```
