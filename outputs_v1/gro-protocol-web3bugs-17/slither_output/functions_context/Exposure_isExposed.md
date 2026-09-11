# Context: Exposure.isExposed

**Contract:** `Exposure` (Inherits: IExposure, Whitelist, Controllable, Ownable, Context, Constants)
**Signature:** `isExposed(uint256,uint256[3],uint256[],uint256) returns (bool, bool)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `private`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** N_COINS
- **Writes:** None

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
    Node_0 --> Node_3
    Node_1["1: NodeType.STARTLOOP - "]
    Node_1 --> Node_4
    Node_2["2: NodeType.ENDLOOP - "]
    Node_2 --> Node_12
    Node_3["3: NodeType.VARIABLE - i = 0"]
    Node_3 --> Node_1
    Node_4["4: NodeType.IFLOOP - i < N_COINS"]
    Node_4 --> Node_5
    Node_4 --> Node_2
    Node_5["5: NodeType.IF - stableCoinExposure(i) > rebalanceThreshold"]
    Node_5 --> Node_6
    Node_5 --> Node_8
    Node_6["6: NodeType.EXPRESSION - stablecoinExposed = true"]
    Node_6 --> Node_7
    Node_7["7: NodeType.BREAK - "]
    Node_7 --> Node_2
    Node_8["8: NodeType.ENDIF - "]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - i ++"]
    Node_9 --> Node_4
    Node_10["10: NodeType.STARTLOOP - "]
    Node_10 --> Node_13
    Node_11["11: NodeType.ENDLOOP - "]
    Node_11 --> Node_19
    Node_12["12: NodeType.VARIABLE - i_scope_0 = 0"]
    Node_12 --> Node_10
    Node_13["13: NodeType.IFLOOP - i_scope_0 < protocolExposure.length"]
    Node_13 --> Node_14
    Node_13 --> Node_11
    Node_14["14: NodeType.IF - protocolExposure(i_scope_0) > rebalanceThreshold"]
    Node_14 --> Node_15
    Node_14 --> Node_17
    Node_15["15: NodeType.EXPRESSION - protocolExposed = true"]
    Node_15 --> Node_16
    Node_16["16: NodeType.BREAK - "]
    Node_16 --> Node_11
    Node_17["17: NodeType.ENDIF - "]
    Node_17 --> Node_18
    Node_18["18: NodeType.EXPRESSION - i_scope_0 ++"]
    Node_18 --> Node_13
    Node_19["19: NodeType.IF - ! protocolExposed && curveExposure > rebalanceThreshold"]
    Node_19 --> Node_20
    Node_19 --> Node_21
    Node_20["20: NodeType.EXPRESSION - protocolExposed = true"]
    Node_20 --> Node_21
    Node_21["21: NodeType.ENDIF - "]
    Node_21 --> Node_22
    Node_22["22: NodeType.RETURN - (stablecoinExposed,protocolExposed)"]
    Node_23["23: NodeType.RETURN - (stablecoinExposed,protocolExposed)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/insurance/Exposure.sol` on lines **254** to **274**

```solidity
    function isExposed(
        uint256 rebalanceThreshold,
        uint256[N_COINS] memory stableCoinExposure,
        uint256[] memory protocolExposure,
        uint256 curveExposure
    ) private pure returns (bool stablecoinExposed, bool protocolExposed) {
        for (uint256 i = 0; i < N_COINS; i++) {
            if (stableCoinExposure[i] > rebalanceThreshold) {
                stablecoinExposed = true;
                break;
            }
        }
        for (uint256 i = 0; i < protocolExposure.length; i++) {
            if (protocolExposure[i] > rebalanceThreshold) {
                protocolExposed = true;
                break;
            }
        }
        if (!protocolExposed && curveExposure > rebalanceThreshold) protocolExposed = true;
        return (stablecoinExposed, protocolExposed);
    }

```
