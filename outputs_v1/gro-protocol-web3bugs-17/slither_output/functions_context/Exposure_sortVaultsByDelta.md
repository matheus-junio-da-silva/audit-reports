# Context: Exposure.sortVaultsByDelta

**Contract:** `Exposure` (Inherits: IExposure, Whitelist, Controllable, Ownable, Context, Constants)
**Signature:** `sortVaultsByDelta(bool,uint256,uint256[3],uint256[3]) returns (uint256[3])`
**Method Selector ID:** `0x72ea0acc`
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
- `SafeMath.TMP_161(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['unifiedTotalAssets', 'REF_57'] `
- `SafeMath.TMP_162(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_161', 'PERCENTAGE_DECIMAL_FACTOR'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - "]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - "]
    Node_4 --> Node_7
    Node_5["5: NodeType.STARTLOOP - "]
    Node_5 --> Node_8
    Node_6["6: NodeType.ENDLOOP - "]
    Node_6 --> Node_19
    Node_7["7: NodeType.VARIABLE - i = 0"]
    Node_7 --> Node_5
    Node_8["8: NodeType.IFLOOP - i < N_COINS"]
    Node_8 --> Node_9
    Node_8 --> Node_6
    Node_9["9: NodeType.VARIABLE - delta = int256(unifiedAssets(i) - unifiedTotalAssets.mul(targetPercents(i)).div(PERCENTAGE_DECIMAL_FACTOR))"]
    Node_9 --> Node_10
    Node_10["10: NodeType.IF - delta > maxDelta"]
    Node_10 --> Node_11
    Node_10 --> Node_13
    Node_11["11: NodeType.EXPRESSION - maxDelta = delta"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - maxIndex = i"]
    Node_12 --> Node_17
    Node_13["13: NodeType.IF - delta < minDelta"]
    Node_13 --> Node_14
    Node_13 --> Node_16
    Node_14["14: NodeType.EXPRESSION - minDelta = delta"]
    Node_14 --> Node_15
    Node_15["15: NodeType.EXPRESSION - minIndex = i"]
    Node_15 --> Node_16
    Node_16["16: NodeType.ENDIF - "]
    Node_16 --> Node_17
    Node_17["17: NodeType.ENDIF - "]
    Node_17 --> Node_18
    Node_18["18: NodeType.EXPRESSION - i ++"]
    Node_18 --> Node_8
    Node_19["19: NodeType.IF - bigFirst"]
    Node_19 --> Node_20
    Node_19 --> Node_22
    Node_20["20: NodeType.EXPRESSION - vaultIndexes(0) = maxIndex"]
    Node_20 --> Node_21
    Node_21["21: NodeType.EXPRESSION - vaultIndexes(2) = minIndex"]
    Node_21 --> Node_24
    Node_22["22: NodeType.EXPRESSION - vaultIndexes(0) = minIndex"]
    Node_22 --> Node_23
    Node_23["23: NodeType.EXPRESSION - vaultIndexes(2) = maxIndex"]
    Node_23 --> Node_24
    Node_24["24: NodeType.ENDIF - "]
    Node_24 --> Node_25
    Node_25["25: NodeType.EXPRESSION - vaultIndexes(1) = N_COINS - maxIndex - minIndex"]
    Node_25 --> Node_26
    Node_26["26: NodeType.RETURN - vaultIndexes"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/insurance/Exposure.sol` on lines **178** to **210**

```solidity
    function sortVaultsByDelta(
        bool bigFirst,
        uint256 unifiedTotalAssets,
        uint256[N_COINS] calldata unifiedAssets,
        uint256[N_COINS] calldata targetPercents
    ) external pure override returns (uint256[N_COINS] memory vaultIndexes) {
        uint256 maxIndex;
        uint256 minIndex;
        int256 maxDelta;
        int256 minDelta;
        for (uint256 i = 0; i < N_COINS; i++) {
            // Get difference between vault current assets and vault target
            int256 delta = int256(
                unifiedAssets[i] - unifiedTotalAssets.mul(targetPercents[i]).div(PERCENTAGE_DECIMAL_FACTOR)
            );
            // Establish order
            if (delta > maxDelta) {
                maxDelta = delta;
                maxIndex = i;
            } else if (delta < minDelta) {
                minDelta = delta;
                minIndex = i;
            }
        }
        if (bigFirst) {
            vaultIndexes[0] = maxIndex;
            vaultIndexes[2] = minIndex;
        } else {
            vaultIndexes[0] = minIndex;
            vaultIndexes[2] = maxIndex;
        }
        vaultIndexes[1] = N_COINS - maxIndex - minIndex;
    }

```
