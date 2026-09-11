# Context: TroveManager._applyPendingRewards

**Contract:** `TroveManager` (Inherits: ReentrancyGuard, ITroveManager, TroveManagerBase, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `_applyPendingRewards(IActivePool,IDefaultPool,address)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** Troves
- **Writes:** Troves

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_488(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['REF_565', 'pendingYUSDDebtReward'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.IF - hasPendingRewards(_borrower)"]
    Node_1 --> Node_2
    Node_1 --> Node_10
    Node_2["2: NodeType.EXPRESSION - _requireTroveIsActive(_borrower)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - pendingCollReward = _getPendingCollRewards(_borrower)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - pendingYUSDDebtReward = getPendingYUSDDebtReward(_borrower)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - Troves(_borrower).colls = _sumColls(Troves(_borrower).colls,pendingCollReward)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - Troves(_borrower).debt = Troves(_borrower).debt.add(pendingYUSDDebtReward)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - _updateTroveRewardSnapshots(_borrower)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - _movePendingTroveRewardsToActivePool(_activePool,_defaultPool,pendingYUSDDebtReward,pendingCollReward.tokens,pendingCollReward.amounts,_borrower)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - TroveUpdated(_borrower,Troves(_borrower).debt,Troves(_borrower).colls.tokens,Troves(_borrower).colls.amounts,TroveManagerOperation.applyPendingRewards)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.ENDIF - "]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TroveManager.sol` on lines **339** to **364**

```solidity
    function _applyPendingRewards(IActivePool _activePool, IDefaultPool _defaultPool, address _borrower) internal {
        if (hasPendingRewards(_borrower)) {
            _requireTroveIsActive(_borrower);

            // Compute pending collateral rewards
            newColls memory pendingCollReward = _getPendingCollRewards(_borrower);
            uint pendingYUSDDebtReward = getPendingYUSDDebtReward(_borrower);

            // Apply pending rewards to trove's state
            Troves[_borrower].colls = _sumColls(Troves[_borrower].colls, pendingCollReward);
            Troves[_borrower].debt = Troves[_borrower].debt.add(pendingYUSDDebtReward);

            _updateTroveRewardSnapshots(_borrower);

            // Transfer from DefaultPool to ActivePool
            _movePendingTroveRewardsToActivePool(_activePool, _defaultPool, pendingYUSDDebtReward, pendingCollReward.tokens, pendingCollReward.amounts, _borrower);

            emit TroveUpdated(
                _borrower,
                Troves[_borrower].debt,
                Troves[_borrower].colls.tokens,
                Troves[_borrower].colls.amounts,
                TroveManagerOperation.applyPendingRewards
            );
        }
    }

```
