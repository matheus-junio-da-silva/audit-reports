# Context: TroveManagerLiquidations._getTotalsFromBatchLiquidate_NormalMode

**Contract:** `TroveManagerLiquidations` (Inherits: ITroveManagerLiquidations, TroveManagerBase, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `_getTotalsFromBatchLiquidate_NormalMode(IActivePool,IDefaultPool,uint256,address[]) returns (TroveManagerLiquidations.LiquidationTotals)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** MCR, troveManager
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_515(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['REF_654', 'REF_656'] `
- `ITroveManager.TMP_512(uint256) = HIGH_LEVEL_CALL, dest:troveManager(ITroveManager), function:getCurrentICR, arguments:['REF_649']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - "]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - vars.remainingYUSDInStabPool = _YUSDInStabPool"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - troveArrayLen = _troveArray.length"]
    Node_4 --> Node_7
    Node_5["5: NodeType.STARTLOOP - "]
    Node_5 --> Node_8
    Node_6["6: NodeType.ENDLOOP - "]
    Node_6 --> Node_18
    Node_7["7: NodeType.EXPRESSION - vars.i = 0"]
    Node_7 --> Node_5
    Node_8["8: NodeType.IFLOOP - vars.i < troveArrayLen"]
    Node_8 --> Node_9
    Node_8 --> Node_6
    Node_9["9: NodeType.EXPRESSION - vars.user = _troveArray(vars.i)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - vars.ICR = troveManager.getCurrentICR(vars.user)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.IF - vars.ICR < MCR"]
    Node_11 --> Node_12
    Node_11 --> Node_16
    Node_12["12: NodeType.EXPRESSION - singleLiquidation = _liquidateNormalMode(_activePool,_defaultPool,vars.user,vars.remainingYUSDInStabPool)"]
    Node_12 --> Node_13
    Node_13["13: NodeType.EXPRESSION - vars.remainingYUSDInStabPool = vars.remainingYUSDInStabPool.sub(singleLiquidation.debtToOffset)"]
    Node_13 --> Node_14
    Node_14["14: NodeType.EXPRESSION - _updateWAssetsRewardOwner(singleLiquidation.collGasCompensation,vars.user,address(this))"]
    Node_14 --> Node_15
    Node_15["15: NodeType.EXPRESSION - totals = _addLiquidationValuesToTotals(totals,singleLiquidation)"]
    Node_15 --> Node_16
    Node_16["16: NodeType.ENDIF - "]
    Node_16 --> Node_17
    Node_17["17: NodeType.EXPRESSION - ++ vars.i"]
    Node_17 --> Node_8
    Node_18["18: NodeType.RETURN - totals"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TroveManagerLiquidations.sol` on lines **354** to **386**

```solidity
    function _getTotalsFromBatchLiquidate_NormalMode(
        IActivePool _activePool,
        IDefaultPool _defaultPool,
        uint256 _YUSDInStabPool,
        address[] memory _troveArray
    ) internal returns (LiquidationTotals memory totals) {
        LocalVariables_LiquidationSequence memory vars;
        LiquidationValues memory singleLiquidation;

        vars.remainingYUSDInStabPool = _YUSDInStabPool;
        uint256 troveArrayLen = _troveArray.length;
        for (vars.i = 0; vars.i < troveArrayLen; ++vars.i) {
            vars.user = _troveArray[vars.i];
            vars.ICR = troveManager.getCurrentICR(vars.user);
            if (vars.ICR < MCR) {
                singleLiquidation = _liquidateNormalMode(
                    _activePool,
                    _defaultPool,
                    vars.user,
                    vars.remainingYUSDInStabPool
                );
                vars.remainingYUSDInStabPool = vars.remainingYUSDInStabPool.sub(
                    singleLiquidation.debtToOffset
                );

                // If wrapped assets exist then update the reward to this contract temporarily
                _updateWAssetsRewardOwner(singleLiquidation.collGasCompensation, vars.user, address(this));

                // Add liquidation values to their respective running totals
                totals = _addLiquidationValuesToTotals(totals, singleLiquidation);
            }
        }
    }

```
