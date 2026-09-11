# Context: MochiProfileV0.maxFee

**Contract:** `MochiProfileV0` (Inherits: IMochiProfile)
**Signature:** `maxFee(AssetClass) returns (float)`
**Method Selector ID:** `0xfa6a5f2c`
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
    Node_1["1: NodeType.IF - _class == AssetClass.Stable"]
    Node_1 --> Node_2
    Node_1 --> Node_3
    Node_2["2: NodeType.RETURN - float((numerator:10,denominator:1000))"]
    Node_3["3: NodeType.IF - _class == AssetClass.Alpha"]
    Node_3 --> Node_4
    Node_3 --> Node_5
    Node_4["4: NodeType.RETURN - float((numerator:15,denominator:1000))"]
    Node_5["5: NodeType.IF - _class == AssetClass.Gamma"]
    Node_5 --> Node_6
    Node_5 --> Node_7
    Node_6["6: NodeType.RETURN - float((numerator:20,denominator:1000))"]
    Node_7["7: NodeType.IF - _class == AssetClass.Delta"]
    Node_7 --> Node_8
    Node_7 --> Node_9
    Node_8["8: NodeType.RETURN - float((numerator:21,denominator:1000))"]
    Node_9["9: NodeType.IF - _class == AssetClass.Zeta"]
    Node_9 --> Node_10
    Node_9 --> Node_11
    Node_10["10: NodeType.RETURN - float((numerator:22,denominator:1000))"]
    Node_11["11: NodeType.IF - _class == AssetClass.Sigma"]
    Node_11 --> Node_12
    Node_11 --> Node_13
    Node_12["12: NodeType.RETURN - float((numerator:23,denominator:1000))"]
    Node_13["13: NodeType.EXPRESSION - revert(string)(invalid)"]
    Node_13 --> Node_14
    Node_14["14: NodeType.ENDIF - "]
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
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-core/contracts/profile/MochiProfileV0.sol` on lines **224** to **240**

```solidity
    function maxFee(AssetClass _class) public pure returns (float memory) {
        if (_class == AssetClass.Stable) {
            return float({numerator: 10, denominator: 1000});
        } else if (_class == AssetClass.Alpha) {
            return float({numerator: 15, denominator: 1000});
        } else if (_class == AssetClass.Gamma) {
            return float({numerator: 20, denominator: 1000});
        } else if (_class == AssetClass.Delta) {
            return float({numerator: 21, denominator: 1000});
        } else if (_class == AssetClass.Zeta) {
            return float({numerator: 22, denominator: 1000});
        } else if (_class == AssetClass.Sigma) {
            return float({numerator: 23, denominator: 1000});
        } else {
            revert("invalid");
        }
    }

```
