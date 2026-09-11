# Context: MochiProfileV0.maxCollateralFactor

**Contract:** `MochiProfileV0` (Inherits: IMochiProfile)
**Signature:** `maxCollateralFactor(address) returns (float)`
**Method Selector ID:** `0x733a71ff`
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
    Node_3["3: NodeType.RETURN - float((numerator:90,denominator:100))"]
    Node_4["4: NodeType.IF - class == AssetClass.Alpha"]
    Node_4 --> Node_5
    Node_4 --> Node_6
    Node_5["5: NodeType.RETURN - float((numerator:80,denominator:100))"]
    Node_6["6: NodeType.IF - class == AssetClass.Gamma"]
    Node_6 --> Node_7
    Node_6 --> Node_8
    Node_7["7: NodeType.RETURN - float((numerator:75,denominator:100))"]
    Node_8["8: NodeType.IF - class == AssetClass.Delta"]
    Node_8 --> Node_9
    Node_8 --> Node_10
    Node_9["9: NodeType.RETURN - float((numerator:65,denominator:100))"]
    Node_10["10: NodeType.IF - class == AssetClass.Zeta"]
    Node_10 --> Node_11
    Node_10 --> Node_12
    Node_11["11: NodeType.RETURN - float((numerator:55,denominator:100))"]
    Node_12["12: NodeType.IF - class == AssetClass.Sigma"]
    Node_12 --> Node_13
    Node_12 --> Node_14
    Node_13["13: NodeType.RETURN - float((numerator:45,denominator:100))"]
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
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-core/contracts/profile/MochiProfileV0.sol` on lines **148** to **170**

```solidity
    function maxCollateralFactor(address _asset)
        public
        view
        override
        returns (float memory)
    {
        AssetClass class = assetClass(_asset);
        if (class == AssetClass.Stable) {
            return float({numerator: 90, denominator: 100});
        } else if (class == AssetClass.Alpha) {
            return float({numerator: 80, denominator: 100});
        } else if (class == AssetClass.Gamma) {
            return float({numerator: 75, denominator: 100});
        } else if (class == AssetClass.Delta) {
            return float({numerator: 65, denominator: 100});
        } else if (class == AssetClass.Zeta) {
            return float({numerator: 55, denominator: 100});
        } else if (class == AssetClass.Sigma) {
            return float({numerator: 45, denominator: 100});
        } else {
            revert("invalid");
        }
    }

```
