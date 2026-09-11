# Context: MochiProfileV0.stabilityFee

**Contract:** `MochiProfileV0` (Inherits: IMochiProfile)
**Signature:** `stabilityFee(address) returns (float)`
**Method Selector ID:** `0x997a2572`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `Float.TMP_105(float) = LIBRARY_CALL, dest:Float, function:Float.sub(float,float), arguments:['max', 'base'] `
- `Float.TMP_104(bool) = LIBRARY_CALL, dest:Float, function:Float.gt(float,float), arguments:['u', 'TMP_103'] `
- `Float.TMP_106(float) = LIBRARY_CALL, dest:Float, function:Float.mul(float,float), arguments:['TMP_105', 'u'] `
- `Float.TMP_107(float) = LIBRARY_CALL, dest:Float, function:Float.add(float,float), arguments:['base', 'TMP_106'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - base = baseFee()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - class = assetClass(_asset)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - max = maxFee(class)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - u = utilizationRatio(_asset)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.IF - u.gt(float((numerator:1,denominator:1)))"]
    Node_5 --> Node_6
    Node_5 --> Node_7
    Node_6["6: NodeType.RETURN - max"]
    Node_7["7: NodeType.ENDIF - "]
    Node_7 --> Node_8
    Node_8["8: NodeType.RETURN - base.add(max.sub(base).mul(u))"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-core/contracts/profile/MochiProfileV0.sol` on lines **242** to **256**

```solidity
    function stabilityFee(address _asset)
        public
        view
        override
        returns (float memory)
    {
        float memory base = baseFee();
        AssetClass class = assetClass(_asset);
        float memory max = maxFee(class);
        float memory u = utilizationRatio(_asset);
        if (u.gt(float({numerator: 1, denominator: 1}))) {
            return max;
        }
        return base.add(max.sub(base).mul(u));
    }

```
