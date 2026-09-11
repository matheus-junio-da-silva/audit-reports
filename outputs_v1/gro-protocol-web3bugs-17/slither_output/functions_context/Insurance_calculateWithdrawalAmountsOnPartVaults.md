# Context: Insurance.calculateWithdrawalAmountsOnPartVaults

**Contract:** `Insurance` (Inherits: IInsurance, Whitelist, Controllable, Ownable, Context, Constants)
**Signature:** `calculateWithdrawalAmountsOnPartVaults(uint256,address[3]) returns (uint256, uint256[3])`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `private`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** N_COINS, PERCENTAGE_DECIMAL_FACTOR, exposure, maxPercentForWithdraw
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_253(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['REF_110', 'maxPercentForWithdraw'] `
- `IBuoy.TMP_260(uint256) = HIGH_LEVEL_CALL, dest:buoy(IBuoy), function:singleStableFromUsd, arguments:['leftAmount', 'TMP_259']  `
- `IBuoy.TMP_257(uint256) = HIGH_LEVEL_CALL, dest:buoy(IBuoy), function:singleStableFromUsd, arguments:['maxWithdrawal', 'TMP_256']  `
- `IExposure.TUPLE_4(uint256,uint256[3]) = HIGH_LEVEL_CALL, dest:exposure(IExposure), function:getUnifiedAssets, arguments:['vaults']  `
- `IExposure.TMP_247(uint256[3]) = HIGH_LEVEL_CALL, dest:exposure(IExposure), function:sortVaultsByDelta, arguments:['True', 'totalAssets', 'vaultAssets', 'TMP_246']  `
- `SafeMath.TMP_254(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_253', 'PERCENTAGE_DECIMAL_FACTOR'] `
- `ILifeGuard.TMP_249(address) = HIGH_LEVEL_CALL, dest:TMP_248(ILifeGuard), function:getBuoy, arguments:[]  `
- `SafeMath.TMP_258(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['leftAmount', 'maxWithdrawal'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - "]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - leftAmount = amount"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - (totalAssets,vaultAssets) = exposure.getUnifiedAssets(vaults)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.IF - amount > totalAssets"]
    Node_7 --> Node_8
    Node_7 --> Node_9
    Node_8["8: NodeType.EXPRESSION - withdrawType = 3"]
    Node_8 --> Node_26
    Node_9["9: NodeType.EXPRESSION - withdrawType = 2"]
    Node_9 --> Node_10
    Node_10["10: NodeType.VARIABLE - vaultIndexes = exposure.sortVaultsByDelta(true,totalAssets,vaultAssets,getStablePercents())"]
    Node_10 --> Node_11
    Node_11["11: NodeType.VARIABLE - buoy = IBuoy(getLifeGuard().getBuoy())"]
    Node_11 --> Node_14
    Node_12["12: NodeType.STARTLOOP - "]
    Node_12 --> Node_15
    Node_13["13: NodeType.ENDLOOP - "]
    Node_13 --> Node_26
    Node_14["14: NodeType.VARIABLE - "]
    Node_14 --> Node_12
    Node_15["15: NodeType.IFLOOP - i < N_COINS - 1"]
    Node_15 --> Node_16
    Node_15 --> Node_13
    Node_16["16: NodeType.EXPRESSION - vaultIndex = vaultIndexes(i)"]
    Node_16 --> Node_17
    Node_17["17: NodeType.EXPRESSION - maxWithdrawal = vaultAssets(vaultIndex).mul(maxPercentForWithdraw).div(PERCENTAGE_DECIMAL_FACTOR)"]
    Node_17 --> Node_18
    Node_18["18: NodeType.IF - leftAmount > maxWithdrawal"]
    Node_18 --> Node_19
    Node_18 --> Node_21
    Node_19["19: NodeType.EXPRESSION - withdrawalAmounts(vaultIndex) = buoy.singleStableFromUsd(maxWithdrawal,int128(vaultIndex))"]
    Node_19 --> Node_20
    Node_20["20: NodeType.EXPRESSION - leftAmount = leftAmount.sub(maxWithdrawal)"]
    Node_20 --> Node_24
    Node_21["21: NodeType.EXPRESSION - withdrawType = 1"]
    Node_21 --> Node_22
    Node_22["22: NodeType.EXPRESSION - withdrawalAmounts(vaultIndex) = buoy.singleStableFromUsd(leftAmount,int128(vaultIndex))"]
    Node_22 --> Node_23
    Node_23["23: NodeType.BREAK - "]
    Node_23 --> Node_13
    Node_24["24: NodeType.ENDIF - "]
    Node_24 --> Node_25
    Node_25["25: NodeType.EXPRESSION - i ++"]
    Node_25 --> Node_15
    Node_26["26: NodeType.ENDIF - "]
    Node_26 --> Node_27
    Node_27["27: NodeType.RETURN - (withdrawType,withdrawalAmounts)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/insurance/Insurance.sol` on lines **336** to **376**

```solidity
    function calculateWithdrawalAmountsOnPartVaults(uint256 amount, address[N_COINS] memory vaults)
        private
        view
        returns (uint256 withdrawType, uint256[N_COINS] memory withdrawalAmounts)
    {
        uint256 maxWithdrawal;
        uint256 leftAmount = amount;
        uint256 vaultIndex;
        (uint256 totalAssets, uint256[N_COINS] memory vaultAssets) = exposure.getUnifiedAssets(vaults);
        if (amount > totalAssets) {
            withdrawType = 3;
        } else {
            withdrawType = 2;
            // Get list of vaults order by most exposed => least exposed
            uint256[N_COINS] memory vaultIndexes = exposure.sortVaultsByDelta(
                true,
                totalAssets,
                vaultAssets,
                getStablePercents()
            );

            IBuoy buoy = IBuoy(getLifeGuard().getBuoy());
            // Establish how much needs to be withdrawn from each vault
            for (uint256 i; i < N_COINS - 1; i++) {
                vaultIndex = vaultIndexes[i];
                // Limit of how much can be withdrawn from this vault
                maxWithdrawal = vaultAssets[vaultIndex].mul(maxPercentForWithdraw).div(PERCENTAGE_DECIMAL_FACTOR);
                // If withdraw amount exceeds withdraw capacity, withdraw remainder
                // from next vault in list...
                if (leftAmount > maxWithdrawal) {
                    withdrawalAmounts[vaultIndex] = buoy.singleStableFromUsd(maxWithdrawal, int128(vaultIndex));
                    leftAmount = leftAmount.sub(maxWithdrawal);
                    // ...Else, stop. Withdrawal covered by one vault.
                } else {
                    withdrawType = 1;
                    withdrawalAmounts[vaultIndex] = buoy.singleStableFromUsd(leftAmount, int128(vaultIndex));
                    break;
                }
            }
        }
    }

```
