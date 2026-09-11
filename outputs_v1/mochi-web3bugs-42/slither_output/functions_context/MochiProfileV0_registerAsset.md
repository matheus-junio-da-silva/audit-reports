# Context: MochiProfileV0.registerAsset

**Contract:** `MochiProfileV0` (Inherits: IMochiProfile)
**Signature:** `registerAsset(address)`
**Method Selector ID:** `0xd312998f`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** engine, liquidityRequirement
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(liq >= liquidityRequirement,<liquidity)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `ICSSRRouter.TMP_3(uint256) = HIGH_LEVEL_CALL, dest:TMP_2(ICSSRRouter), function:getLiquidity, arguments:['_asset']  `
- `IMochiEngine.TMP_2(ICSSRRouter) = HIGH_LEVEL_CALL, dest:engine(IMochiEngine), function:cssr, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - liq = engine.cssr().getLiquidity(_asset)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(liq >= liquidityRequirement,<liquidity)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - _register(_asset,AssetClass.Sigma)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-core/contracts/profile/MochiProfileV0.sol` on lines **58** to **62**

```solidity
    function registerAsset(address _asset) external {
        uint256 liq = engine.cssr().getLiquidity(_asset);
        require(liq >= liquidityRequirement, "<liquidity");
        _register(_asset, AssetClass.Sigma);
    }

```
