# Context: MochiProfileV0.riskFactor

**Contract:** `MochiProfileV0` (Inherits: IMochiProfile)
**Signature:** `riskFactor(address) returns (uint256)`
**Method Selector ID:** `0x13a475ba`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- revert: `revert(string)(invalid)`

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
    Node_1["1: NodeType.VARIABLE - class = assetClass(_asset)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.IF - class == AssetClass.Stable"]
    Node_2 --> Node_3
    Node_2 --> Node_4
    Node_3["3: NodeType.RETURN - 1"]
    Node_4["4: NodeType.IF - class == AssetClass.Alpha"]
    Node_4 --> Node_5
    Node_4 --> Node_6
    Node_5["5: NodeType.RETURN - 2"]
    Node_6["6: NodeType.IF - class == AssetClass.Gamma"]
    Node_6 --> Node_7
    Node_6 --> Node_8
    Node_7["7: NodeType.RETURN - 3"]
    Node_8["8: NodeType.IF - class == AssetClass.Delta"]
    Node_8 --> Node_9
    Node_8 --> Node_10
    Node_9["9: NodeType.RETURN - 4"]
    Node_10["10: NodeType.IF - class == AssetClass.Zeta"]
    Node_10 --> Node_11
    Node_10 --> Node_12
    Node_11["11: NodeType.RETURN - 5"]
    Node_12["12: NodeType.IF - class == AssetClass.Sigma"]
    Node_12 --> Node_13
    Node_12 --> Node_14
    Node_13["13: NodeType.RETURN - 6"]
    Node_14["14: NodeType.EXPRESSION - revert(string)(invalid)"]
    Node_14 --> Node_15
    Node_15["15: NodeType.ENDIF - "]
    Node_15 --> Node_16
    Node_16["16: NodeType.ENDIF - "]
    Node_16 --> Node_17
    Node_17["17: NodeType.ENDIF - "]
    Node_17 --> Node_18
    Node_18["18: NodeType.ENDIF - "]
    Node_18 --> Node_19
    Node_19["19: NodeType.ENDIF - "]
    Node_19 --> Node_20
    Node_20["20: NodeType.ENDIF - "]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-core/contracts/profile/MochiProfileV0.sol` on lines **129** to **146**

```solidity
    function riskFactor(address _asset) public view returns (uint256) {
        AssetClass class = assetClass(_asset);
        if (class == AssetClass.Stable) {
            return 1;
        } else if (class == AssetClass.Alpha) {
            return 2;
        } else if (class == AssetClass.Gamma) {
            return 3;
        } else if (class == AssetClass.Delta) {
            return 4;
        } else if (class == AssetClass.Zeta) {
            return 5;
        } else if (class == AssetClass.Sigma) {
            return 6;
        } else {
            revert("invalid");
        }
    }

```
