# Context: Insurance.prepareCalculation

**Contract:** `Insurance` (Inherits: IInsurance, Whitelist, Controllable, Ownable, Context, Constants)
**Signature:** `prepareCalculation() returns (SystemState)`
**Method Selector ID:** `0x6c61169a`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** N_COINS, curveVaultPercent
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool)(buoy.safetyCheck())`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_204(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['REF_68', 'REF_70'] `
- `IVault.TMP_209(uint256) = HIGH_LEVEL_CALL, dest:vault(IVault), function:totalAssets, arguments:[]  `
- `IController.TMP_199(address) = HIGH_LEVEL_CALL, dest:TMP_198(IController), function:curveVault, arguments:[]  `
- `IBuoy.TMP_210(uint256) = HIGH_LEVEL_CALL, dest:buoy(IBuoy), function:singleStableToUsd, arguments:['vaultAssets', 'i']  `
- `SafeMath.TMP_211(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['REF_77', 'vaultAssetsUsd'] `
- `ILifeGuard.TMP_194(address) = HIGH_LEVEL_CALL, dest:lg(ILifeGuard), function:getBuoy, arguments:[]  `
- `IBuoy.TMP_203(uint256) = HIGH_LEVEL_CALL, dest:buoy(IBuoy), function:lpToUsd, arguments:['TMP_202']  `
- `IVault.TMP_202(uint256) = HIGH_LEVEL_CALL, dest:curve(IVault), function:totalAssets, arguments:[]  `
- `IController.TMP_206(address[3]) = HIGH_LEVEL_CALL, dest:TMP_205(IController), function:vaults, arguments:[]  `
- `ILifeGuard.TMP_201(uint256) = HIGH_LEVEL_CALL, dest:lg(ILifeGuard), function:totalAssetsUsd, arguments:[]  `
- `IBuoy.TMP_196(bool) = HIGH_LEVEL_CALL, dest:buoy(IBuoy), function:safetyCheck, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - lg = getLifeGuard()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - buoy = IBuoy(lg.getBuoy())"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - require(bool)(buoy.safetyCheck())"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - curve = IVault(_controller().curveVault())"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - systemState.lifeguardCurrentAssetsUsd = lg.totalAssetsUsd()"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - systemState.curveCurrentAssetsUsd = buoy.lpToUsd(curve.totalAssets())"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - systemState.totalCurrentAssetsUsd = systemState.lifeguardCurrentAssetsUsd.add(systemState.curveCurrentAssetsUsd)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - systemState.curvePercent = curveVaultPercent"]
    Node_8 --> Node_9
    Node_9["9: NodeType.VARIABLE - vaults = _controller().vaults()"]
    Node_9 --> Node_12
    Node_10["10: NodeType.STARTLOOP - "]
    Node_10 --> Node_13
    Node_11["11: NodeType.ENDLOOP - "]
    Node_11 --> Node_21
    Node_12["12: NodeType.VARIABLE - i = 0"]
    Node_12 --> Node_10
    Node_13["13: NodeType.IFLOOP - i < N_COINS"]
    Node_13 --> Node_14
    Node_13 --> Node_11
    Node_14["14: NodeType.VARIABLE - vault = IVault(vaults(i))"]
    Node_14 --> Node_15
    Node_15["15: NodeType.VARIABLE - vaultAssets = vault.totalAssets()"]
    Node_15 --> Node_16
    Node_16["16: NodeType.VARIABLE - vaultAssetsUsd = buoy.singleStableToUsd(vaultAssets,i)"]
    Node_16 --> Node_17
    Node_17["17: NodeType.EXPRESSION - systemState.totalCurrentAssetsUsd = systemState.totalCurrentAssetsUsd.add(vaultAssetsUsd)"]
    Node_17 --> Node_18
    Node_18["18: NodeType.EXPRESSION - systemState.vaultCurrentAssets(i) = vaultAssets"]
    Node_18 --> Node_19
    Node_19["19: NodeType.EXPRESSION - systemState.vaultCurrentAssetsUsd(i) = vaultAssetsUsd"]
    Node_19 --> Node_20
    Node_20["20: NodeType.EXPRESSION - i ++"]
    Node_20 --> Node_13
    Node_21["21: NodeType.EXPRESSION - systemState.stablePercents = getStablePercents()"]
    Node_21 --> Node_22
    Node_22["22: NodeType.RETURN - systemState"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/insurance/Insurance.sol` on lines **247** to **269**

```solidity
    function prepareCalculation() public view returns (SystemState memory systemState) {
        ILifeGuard lg = getLifeGuard();
        IBuoy buoy = IBuoy(lg.getBuoy());
        require(buoy.safetyCheck());
        IVault curve = IVault(_controller().curveVault());
        systemState.lifeguardCurrentAssetsUsd = lg.totalAssetsUsd();
        systemState.curveCurrentAssetsUsd = buoy.lpToUsd(curve.totalAssets());
        systemState.totalCurrentAssetsUsd = systemState.lifeguardCurrentAssetsUsd.add(
            systemState.curveCurrentAssetsUsd
        );
        systemState.curvePercent = curveVaultPercent;
        address[N_COINS] memory vaults = _controller().vaults();
        // Stablecoin total assets
        for (uint256 i = 0; i < N_COINS; i++) {
            IVault vault = IVault(vaults[i]);
            uint256 vaultAssets = vault.totalAssets();
            uint256 vaultAssetsUsd = buoy.singleStableToUsd(vaultAssets, i);
            systemState.totalCurrentAssetsUsd = systemState.totalCurrentAssetsUsd.add(vaultAssetsUsd);
            systemState.vaultCurrentAssets[i] = vaultAssets;
            systemState.vaultCurrentAssetsUsd[i] = vaultAssetsUsd;
        }
        systemState.stablePercents = getStablePercents();
    }

```
