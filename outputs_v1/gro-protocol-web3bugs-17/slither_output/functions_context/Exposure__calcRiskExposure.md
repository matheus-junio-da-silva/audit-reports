# Context: Exposure._calcRiskExposure

**Contract:** `Exposure` (Inherits: IExposure, Whitelist, Controllable, Ownable, Context, Constants)
**Signature:** `_calcRiskExposure(SystemState,bool) returns (ExposureState)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `private`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** N_COINS, PERCENTAGE_DECIMAL_FACTOR, protocolCount
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IController.TMP_194(address[3]) = HIGH_LEVEL_CALL, dest:TMP_193(IController), function:vaults, arguments:[]  `
- `SafeMath.TMP_200(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_199', 'REF_86'] `
- `SafeMath.TMP_199(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['REF_83', 'PERCENTAGE_DECIMAL_FACTOR'] `
- `SafeMath.TMP_208(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_207', 'REF_107'] `
- `SafeMath.TMP_206(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['REF_98', 'REF_100'] `
- `SafeMath.TMP_203(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['REF_95', 'percentOfSystem'] `
- `SafeMath.TMP_207(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['REF_104', 'PERCENTAGE_DECIMAL_FACTOR'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - vaults = _controller().vaults()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - pCount = protocolCount"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - expState.protocolExposure = new uint256()(pCount)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.IF - sysState.totalCurrentAssetsUsd == 0"]
    Node_4 --> Node_5
    Node_4 --> Node_6
    Node_5["5: NodeType.RETURN - expState"]
    Node_6["6: NodeType.ENDIF - "]
    Node_6 --> Node_9
    Node_7["7: NodeType.STARTLOOP - "]
    Node_7 --> Node_10
    Node_8["8: NodeType.ENDLOOP - "]
    Node_8 --> Node_21
    Node_9["9: NodeType.VARIABLE - i = 0"]
    Node_9 --> Node_7
    Node_10["10: NodeType.IFLOOP - i < N_COINS"]
    Node_10 --> Node_11
    Node_10 --> Node_8
    Node_11["11: NodeType.VARIABLE - vaultAssetsPercent = sysState.vaultCurrentAssetsUsd(i).mul(PERCENTAGE_DECIMAL_FACTOR).div(sysState.totalCurrentAssetsUsd)"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - expState.stablecoinExposure(i) = vaultAssetsPercent"]
    Node_12 --> Node_15
    Node_13["13: NodeType.STARTLOOP - "]
    Node_13 --> Node_16
    Node_14["14: NodeType.ENDLOOP - "]
    Node_14 --> Node_20
    Node_15["15: NodeType.VARIABLE - j = 0"]
    Node_15 --> Node_13
    Node_16["16: NodeType.IFLOOP - j < pCount"]
    Node_16 --> Node_17
    Node_16 --> Node_14
    Node_17["17: NodeType.VARIABLE - percentOfSystem = calculatePercentOfSystem(vaults(i),j,vaultAssetsPercent,sysState.vaultCurrentAssets(i))"]
    Node_17 --> Node_18
    Node_18["18: NodeType.EXPRESSION - expState.protocolExposure(j) = expState.protocolExposure(j).add(percentOfSystem)"]
    Node_18 --> Node_19
    Node_19["19: NodeType.EXPRESSION - j ++"]
    Node_19 --> Node_16
    Node_20["20: NodeType.EXPRESSION - i ++"]
    Node_20 --> Node_10
    Node_21["21: NodeType.IF - treatLifeguardAsCurve"]
    Node_21 --> Node_22
    Node_21 --> Node_23
    Node_22["22: NodeType.EXPRESSION - expState.curveExposure = sysState.curveCurrentAssetsUsd.add(sysState.lifeguardCurrentAssetsUsd)"]
    Node_22 --> Node_24
    Node_23["23: NodeType.EXPRESSION - expState.curveExposure = sysState.curveCurrentAssetsUsd"]
    Node_23 --> Node_24
    Node_24["24: NodeType.ENDIF - "]
    Node_24 --> Node_25
    Node_25["25: NodeType.EXPRESSION - expState.curveExposure = expState.curveExposure.mul(PERCENTAGE_DECIMAL_FACTOR).div(sysState.totalCurrentAssetsUsd)"]
    Node_25 --> Node_26
    Node_26["26: NodeType.EXPRESSION - expState.stablecoinExposure = calculateStableCoinExposure(expState.stablecoinExposure,expState.curveExposure)"]
    Node_26 --> Node_27
    Node_27["27: NodeType.RETURN - expState"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/insurance/Exposure.sol` on lines **276** to **317**

```solidity
    function _calcRiskExposure(SystemState memory sysState, bool treatLifeguardAsCurve)
        private
        view
        returns (ExposureState memory expState)
    {
        address[N_COINS] memory vaults = _controller().vaults();
        uint256 pCount = protocolCount;
        expState.protocolExposure = new uint256[](pCount);
        if (sysState.totalCurrentAssetsUsd == 0) {
            return expState;
        }
        // Stablecoin exposure
        for (uint256 i = 0; i < N_COINS; i++) {
            uint256 vaultAssetsPercent = sysState.vaultCurrentAssetsUsd[i].mul(PERCENTAGE_DECIMAL_FACTOR).div(
                sysState.totalCurrentAssetsUsd
            );
            expState.stablecoinExposure[i] = vaultAssetsPercent;
            // Protocol exposure
            for (uint256 j = 0; j < pCount; j++) {
                uint256 percentOfSystem = calculatePercentOfSystem(
                    vaults[i],
                    j,
                    vaultAssetsPercent,
                    sysState.vaultCurrentAssets[i]
                );
                expState.protocolExposure[j] = expState.protocolExposure[j].add(percentOfSystem);
            }
        }
        if (treatLifeguardAsCurve) {
            // Curve exposure is calculated by adding the Curve vaults total assets and any
            // assets in the lifeguard which are poised to be invested into the Curve vault
            expState.curveExposure = sysState.curveCurrentAssetsUsd.add(sysState.lifeguardCurrentAssetsUsd);
        } else {
            expState.curveExposure = sysState.curveCurrentAssetsUsd;
        }
        expState.curveExposure = expState.curveExposure.mul(PERCENTAGE_DECIMAL_FACTOR).div(
            sysState.totalCurrentAssetsUsd
        );

        // Calculate stablecoin exposures
        expState.stablecoinExposure = calculateStableCoinExposure(expState.stablecoinExposure, expState.curveExposure);
    }

```
