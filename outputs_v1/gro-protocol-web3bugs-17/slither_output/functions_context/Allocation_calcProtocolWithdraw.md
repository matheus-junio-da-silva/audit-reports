# Context: Allocation.calcProtocolWithdraw

**Contract:** `Allocation` (Inherits: IAllocation, Whitelist, Controllable, Ownable, Context, Constants)
**Signature:** `calcProtocolWithdraw(AllocationState,uint256) returns (uint256[3])`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `private`
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
- `IController.TMP_120(address[3]) = HIGH_LEVEL_CALL, dest:TMP_119(IController), function:vaults, arguments:[]  `
- `IBuoy.TMP_130(uint256) = HIGH_LEVEL_CALL, dest:buoy(IBuoy), function:singleStableToUsd, arguments:['strategyAssets', 'i']  `
- `IController.TMP_122(address) = HIGH_LEVEL_CALL, dest:TMP_121(IController), function:lifeGuard, arguments:[]  `
- `ILifeGuard.TMP_124(address) = HIGH_LEVEL_CALL, dest:lg(ILifeGuard), function:getBuoy, arguments:[]  `
- `SafeMath.TMP_131(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['REF_26', 'REF_29'] `
- `IVault.TMP_128(uint256) = HIGH_LEVEL_CALL, dest:TMP_127(IVault), function:getStrategyAssets, arguments:['protocolExposedIndex']  `
- `SafeMath.TMP_134(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['strategyCurrentUsd', 'strategyTargetUsd'] `
- `SafeMath.TMP_132(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_131', 'PERCENTAGE_DECIMAL_FACTOR'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - vaults = _controller().vaults()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - lg = ILifeGuard(_controller().lifeGuard())"]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - buoy = IBuoy(lg.getBuoy())"]
    Node_5 --> Node_8
    Node_6["6: NodeType.STARTLOOP - "]
    Node_6 --> Node_9
    Node_7["7: NodeType.ENDLOOP - "]
    Node_7 --> Node_22
    Node_8["8: NodeType.VARIABLE - i = 0"]
    Node_8 --> Node_6
    Node_9["9: NodeType.IFLOOP - i < N_COINS"]
    Node_9 --> Node_10
    Node_9 --> Node_7
    Node_10["10: NodeType.VARIABLE - strategyAssets = IVault(vaults(i)).getStrategyAssets(protocolExposedIndex)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.IF - strategyAssets > 0"]
    Node_11 --> Node_12
    Node_11 --> Node_13
    Node_12["12: NodeType.EXPRESSION - strategyCurrentUsd = buoy.singleStableToUsd(strategyAssets,i)"]
    Node_12 --> Node_13
    Node_13["13: NodeType.ENDIF - "]
    Node_13 --> Node_14
    Node_14["14: NodeType.EXPRESSION - strategyTargetUsd = allState.stableState.vaultsTargetUsd(i).mul(allState.strategyTargetRatio(protocolExposedIndex)).div(PERCENTAGE_DECIMAL_FACTOR)"]
    Node_14 --> Node_15
    Node_15["15: NodeType.IF - strategyCurrentUsd > strategyTargetUsd"]
    Node_15 --> Node_16
    Node_15 --> Node_17
    Node_16["16: NodeType.EXPRESSION - protocolWithdrawalUsd(i) = strategyCurrentUsd.sub(strategyTargetUsd)"]
    Node_16 --> Node_17
    Node_17["17: NodeType.ENDIF - "]
    Node_17 --> Node_18
    Node_18["18: NodeType.IF - protocolWithdrawalUsd(i) > 0 && protocolWithdrawalUsd(i) < allState.stableState.swapInAmountsUsd(i)"]
    Node_18 --> Node_19
    Node_18 --> Node_20
    Node_19["19: NodeType.EXPRESSION - protocolWithdrawalUsd(i) = allState.stableState.swapInAmountsUsd(i)"]
    Node_19 --> Node_20
    Node_20["20: NodeType.ENDIF - "]
    Node_20 --> Node_21
    Node_21["21: NodeType.EXPRESSION - i ++"]
    Node_21 --> Node_9
    Node_22["22: NodeType.RETURN - protocolWithdrawalUsd"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/insurance/Allocation.sol` on lines **126** to **159**

```solidity
    function calcProtocolWithdraw(AllocationState memory allState, uint256 protocolExposedIndex)
        private
        view
        returns (uint256[N_COINS] memory protocolWithdrawalUsd)
    {
        address[N_COINS] memory vaults = _controller().vaults();
        // How much to withdraw from each protocol
        uint256 strategyCurrentUsd;
        uint256 strategyTargetUsd;
        ILifeGuard lg = ILifeGuard(_controller().lifeGuard());
        IBuoy buoy = IBuoy(lg.getBuoy());
        // Loop over each vault
        for (uint256 i = 0; i < N_COINS; i++) {
            uint256 strategyAssets = IVault(vaults[i]).getStrategyAssets(protocolExposedIndex);
            // If the strategy has assets, determine the USD value of the asset
            if (strategyAssets > 0) {
                strategyCurrentUsd = buoy.singleStableToUsd(strategyAssets, i);
            }
            // Determine the USD value of the strategy asset target
            strategyTargetUsd = allState
            .stableState
            .vaultsTargetUsd[i]
            .mul(allState.strategyTargetRatio[protocolExposedIndex])
            .div(PERCENTAGE_DECIMAL_FACTOR);
            // If the strategy is over exposed, assets can be removed
            if (strategyCurrentUsd > strategyTargetUsd) {
                protocolWithdrawalUsd[i] = strategyCurrentUsd.sub(strategyTargetUsd);
            }
            // If the strategy is empty or under exposed, assets can be added
            if (protocolWithdrawalUsd[i] > 0 && protocolWithdrawalUsd[i] < allState.stableState.swapInAmountsUsd[i]) {
                protocolWithdrawalUsd[i] = allState.stableState.swapInAmountsUsd[i];
            }
        }
    }

```
