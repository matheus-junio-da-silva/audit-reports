# Context: Insurance.moveAssetsFromVaultsToLifeguard

**Contract:** `Insurance` (Inherits: IInsurance, Whitelist, Controllable, Ownable, Context, Constants)
**Signature:** `moveAssetsFromVaultsToLifeguard(address[3],uint256[3],ILifeGuard,uint256,uint256[]) returns (bool)`
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
- `IVault.HIGH_LEVEL_CALL, dest:vault(IVault), function:withdrawByStrategyIndex, arguments:['REF_189', 'TMP_328', 'strategyIndex']  `
- `IVault.HIGH_LEVEL_CALL, dest:vault(IVault), function:updateStrategyRatio, arguments:['strategyTargetRatio']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - moved = false"]
    Node_1 --> Node_4
    Node_2["2: NodeType.STARTLOOP - "]
    Node_2 --> Node_5
    Node_3["3: NodeType.ENDLOOP - "]
    Node_3 --> Node_13
    Node_4["4: NodeType.VARIABLE - i = 0"]
    Node_4 --> Node_2
    Node_5["5: NodeType.IFLOOP - i < N_COINS"]
    Node_5 --> Node_6
    Node_5 --> Node_3
    Node_6["6: NodeType.VARIABLE - vault = IVault(vaults(i))"]
    Node_6 --> Node_7
    Node_7["7: NodeType.IF - swapInAmounts(i) > 0"]
    Node_7 --> Node_8
    Node_7 --> Node_10
    Node_8["8: NodeType.EXPRESSION - moved = true"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - vault.withdrawByStrategyIndex(swapInAmounts(i),address(lg),strategyIndex)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.ENDIF - "]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - vault.updateStrategyRatio(strategyTargetRatio)"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - i ++"]
    Node_12 --> Node_5
    Node_13["13: NodeType.RETURN - moved"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/insurance/Insurance.sol` on lines **508** to **527**

```solidity
    function moveAssetsFromVaultsToLifeguard(
        address[N_COINS] memory vaults,
        uint256[N_COINS] memory swapInAmounts,
        ILifeGuard lg,
        uint256 strategyIndex,
        uint256[] memory strategyTargetRatio
    ) private returns (bool) {
        bool moved = false;

        for (uint256 i = 0; i < N_COINS; i++) {
            IVault vault = IVault(vaults[i]);
            if (swapInAmounts[i] > 0) {
                moved = true;
                vault.withdrawByStrategyIndex(swapInAmounts[i], address(lg), strategyIndex);
            }
            vault.updateStrategyRatio(strategyTargetRatio);
        }

        return moved;
    }

```
