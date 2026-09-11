# Context: MochiProfileV0.utilizationRatio

**Contract:** `MochiProfileV0` (Inherits: IMochiProfile)
**Signature:** `utilizationRatio(address) returns (float)`
**Method Selector ID:** `0x8dd20d28`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** creditCap, engine
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IMochiVaultFactory.TMP_115(IMochiVault) = HIGH_LEVEL_CALL, dest:TMP_114(IMochiVaultFactory), function:getVault, arguments:['_asset']  `
- `IMochiEngine.TMP_114(IMochiVaultFactory) = HIGH_LEVEL_CALL, dest:engine(IMochiEngine), function:vaultFactory, arguments:[]  `
- `IMochiVault.TMP_116(uint256) = HIGH_LEVEL_CALL, dest:vault(IMochiVault), function:debts, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - vault = engine.vaultFactory().getVault(_asset)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - debts = vault.debts()"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - cap = creditCap(_asset)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.RETURN - float((numerator:debts,denominator:cap))"]
    Node_5["5: NodeType.RETURN - ratio"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-core/contracts/profile/MochiProfileV0.sol` on lines **272** to **282**

```solidity
    function utilizationRatio(address _asset)
        public
        view
        override
        returns (float memory ratio)
    {
        IMochiVault vault = engine.vaultFactory().getVault(_asset);
        uint256 debts = vault.debts();
        uint256 cap = creditCap[_asset];
        return float({numerator: debts, denominator: cap});
    }

```
