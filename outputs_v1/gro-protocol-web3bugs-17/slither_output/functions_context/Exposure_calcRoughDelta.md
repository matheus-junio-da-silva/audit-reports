# Context: Exposure.calcRoughDelta

**Contract:** `Exposure` (Inherits: IExposure, Whitelist, Controllable, Ownable, Context, Constants)
**Signature:** `calcRoughDelta(uint256[3],address[3],uint256) returns (uint256[3])`
**Method Selector ID:** `0xfe11df06`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** N_COINS, PERCENTAGE_DECIMAL_FACTOR
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(totalAssets > withdrawUsd,totalAssets < withdrawalUsd)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_144(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['totalAssets', 'withdrawUsd'] `
- `SafeMath.TMP_150(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['totalDelta', 'REF_46'] `
- `SafeMath.TMP_155(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['REF_49', 'PERCENTAGE_DECIMAL_FACTOR'] `
- `SafeMath.TMP_156(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_155', 'totalDelta'] `
- `SafeMath.TMP_149(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['REF_43', 'target'] `
- `SafeMath.TMP_147(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_146', 'PERCENTAGE_DECIMAL_FACTOR'] `
- `SafeMath.TMP_146(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['totalAssets', 'REF_39'] `
- `SafeMath.TMP_157(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['percent', 'REF_53'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - "]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - (totalAssets,vaultTotalAssets) = getUnifiedAssets(vaults)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - require(bool,string)(totalAssets > withdrawUsd,totalAssets < withdrawalUsd)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - totalAssets = totalAssets.sub(withdrawUsd)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - "]
    Node_6 --> Node_9
    Node_7["7: NodeType.STARTLOOP - "]
    Node_7 --> Node_10
    Node_8["8: NodeType.ENDLOOP - "]
    Node_8 --> Node_17
    Node_9["9: NodeType.VARIABLE - "]
    Node_9 --> Node_7
    Node_10["10: NodeType.IFLOOP - i < N_COINS"]
    Node_10 --> Node_11
    Node_10 --> Node_8
    Node_11["11: NodeType.VARIABLE - target = totalAssets.mul(targets(i)).div(PERCENTAGE_DECIMAL_FACTOR)"]
    Node_11 --> Node_12
    Node_12["12: NodeType.IF - vaultTotalAssets(i) > target"]
    Node_12 --> Node_13
    Node_12 --> Node_15
    Node_13["13: NodeType.EXPRESSION - delta(i) = vaultTotalAssets(i).sub(target)"]
    Node_13 --> Node_14
    Node_14["14: NodeType.EXPRESSION - totalDelta = totalDelta.add(delta(i))"]
    Node_14 --> Node_15
    Node_15["15: NodeType.ENDIF - "]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - i ++"]
    Node_16 --> Node_10
    Node_17["17: NodeType.VARIABLE - percent = PERCENTAGE_DECIMAL_FACTOR"]
    Node_17 --> Node_20
    Node_18["18: NodeType.STARTLOOP - "]
    Node_18 --> Node_21
    Node_19["19: NodeType.ENDLOOP - "]
    Node_19 --> Node_27
    Node_20["20: NodeType.VARIABLE - "]
    Node_20 --> Node_18
    Node_21["21: NodeType.IFLOOP - i_scope_0 < N_COINS - 1"]
    Node_21 --> Node_22
    Node_21 --> Node_19
    Node_22["22: NodeType.IF - delta(i_scope_0) > 0"]
    Node_22 --> Node_23
    Node_22 --> Node_25
    Node_23["23: NodeType.EXPRESSION - delta(i_scope_0) = delta(i_scope_0).mul(PERCENTAGE_DECIMAL_FACTOR).div(totalDelta)"]
    Node_23 --> Node_24
    Node_24["24: NodeType.EXPRESSION - percent = percent.sub(delta(i_scope_0))"]
    Node_24 --> Node_25
    Node_25["25: NodeType.ENDIF - "]
    Node_25 --> Node_26
    Node_26["26: NodeType.EXPRESSION - i_scope_0 ++"]
    Node_26 --> Node_21
    Node_27["27: NodeType.EXPRESSION - delta(N_COINS - 1) = percent"]
    Node_27 --> Node_28
    Node_28["28: NodeType.RETURN - delta"]
    Node_29["29: NodeType.RETURN - delta"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/insurance/Exposure.sol` on lines **144** to **170**

```solidity
    function calcRoughDelta(
        uint256[N_COINS] calldata targets,
        address[N_COINS] calldata vaults,
        uint256 withdrawUsd
    ) external view override returns (uint256[N_COINS] memory delta) {
        (uint256 totalAssets, uint256[N_COINS] memory vaultTotalAssets) = getUnifiedAssets(vaults);

        require(totalAssets > withdrawUsd, "totalAssets < withdrawalUsd");
        totalAssets = totalAssets.sub(withdrawUsd);
        uint256 totalDelta;
        for (uint256 i; i < N_COINS; i++) {
            uint256 target = totalAssets.mul(targets[i]).div(PERCENTAGE_DECIMAL_FACTOR);
            if (vaultTotalAssets[i] > target) {
                delta[i] = vaultTotalAssets[i].sub(target);
                totalDelta = totalDelta.add(delta[i]);
            }
        }
        uint256 percent = PERCENTAGE_DECIMAL_FACTOR;
        for (uint256 i; i < N_COINS - 1; i++) {
            if (delta[i] > 0) {
                delta[i] = delta[i].mul(PERCENTAGE_DECIMAL_FACTOR).div(totalDelta);
                percent = percent.sub(delta[i]);
            }
        }
        delta[N_COINS - 1] = percent;
        return delta;
    }

```
