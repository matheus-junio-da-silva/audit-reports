# Context: Exposure.getExactRiskExposure

**Contract:** `Exposure` (Inherits: IExposure, Whitelist, Controllable, Ownable, Context, Constants)
**Signature:** `getExactRiskExposure(SystemState) returns (ExposureState)`
**Method Selector ID:** `0x700a63f9`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** N_COINS, PERCENTAGE_DECIMAL_FACTOR
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IController.TMP_116(address) = HIGH_LEVEL_CALL, dest:TMP_115(IController), function:lifeGuard, arguments:[]  `
- `IBuoy.TMP_123(uint256) = HIGH_LEVEL_CALL, dest:buoy(IBuoy), function:singleStableToUsd, arguments:['assets', 'i']  `
- `IController.TMP_119(address) = HIGH_LEVEL_CALL, dest:TMP_118(IController), function:buoy, arguments:[]  `
- `SafeMath.TMP_125(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_124', 'REF_20'] `
- `SafeMath.TMP_126(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['REF_16', 'TMP_125'] `
- `SafeMath.TMP_124(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['assetsUsd', 'PERCENTAGE_DECIMAL_FACTOR'] `
- `ILifeGuard.TMP_122(uint256) = HIGH_LEVEL_CALL, dest:lifeguard(ILifeGuard), function:assets, arguments:['i']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - expState = _calcRiskExposure(sysState,false)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - lifeguard = ILifeGuard(_controller().lifeGuard())"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - buoy = IBuoy(_controller().buoy())"]
    Node_3 --> Node_6
    Node_4["4: NodeType.STARTLOOP - "]
    Node_4 --> Node_7
    Node_5["5: NodeType.ENDLOOP - "]
    Node_5 --> Node_12
    Node_6["6: NodeType.VARIABLE - i = 0"]
    Node_6 --> Node_4
    Node_7["7: NodeType.IFLOOP - i < N_COINS"]
    Node_7 --> Node_8
    Node_7 --> Node_5
    Node_8["8: NodeType.VARIABLE - assets = lifeguard.assets(i)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.VARIABLE - assetsUsd = buoy.singleStableToUsd(assets,i)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - expState.stablecoinExposure(i) = expState.stablecoinExposure(i).add(assetsUsd.mul(PERCENTAGE_DECIMAL_FACTOR).div(sysState.totalCurrentAssetsUsd))"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - i ++"]
    Node_11 --> Node_7
    Node_12["12: NodeType.RETURN - expState"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/insurance/Exposure.sol` on lines **79** to **95**

```solidity
    function getExactRiskExposure(SystemState calldata sysState)
        external
        view
        override
        returns (ExposureState memory expState)
    {
        expState = _calcRiskExposure(sysState, false);
        ILifeGuard lifeguard = ILifeGuard(_controller().lifeGuard());
        IBuoy buoy = IBuoy(_controller().buoy());
        for (uint256 i = 0; i < N_COINS; i++) {
            uint256 assets = lifeguard.assets(i);
            uint256 assetsUsd = buoy.singleStableToUsd(assets, i);
            expState.stablecoinExposure[i] = expState.stablecoinExposure[i].add(
                assetsUsd.mul(PERCENTAGE_DECIMAL_FACTOR).div(sysState.totalCurrentAssetsUsd)
            );
        }
    }

```
