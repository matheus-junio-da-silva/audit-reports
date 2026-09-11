# Context: TroveManager._updateStakeAndTotalStakes

**Contract:** `TroveManager` (Inherits: ReentrancyGuard, ITroveManager, TroveManagerBase, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `_updateStakeAndTotalStakes(address)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** Troves, totalStakes
- **Writes:** Troves, totalStakes

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_534(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['TMP_533', 'newStake'] `
- `SafeMath.TMP_533(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['REF_687', 'oldStake'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - troveOwnerLen = Troves(_borrower).colls.tokens.length"]
    Node_1 --> Node_4
    Node_2["2: NodeType.STARTLOOP - "]
    Node_2 --> Node_5
    Node_3["3: NodeType.ENDLOOP - "]
    Node_4["4: NodeType.VARIABLE - "]
    Node_4 --> Node_2
    Node_5["5: NodeType.IFLOOP - i < troveOwnerLen"]
    Node_5 --> Node_6
    Node_5 --> Node_3
    Node_6["6: NodeType.VARIABLE - token = Troves(_borrower).colls.tokens(i)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - amount = Troves(_borrower).colls.amounts(i)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.VARIABLE - newStake = _computeNewStake(token,amount)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.VARIABLE - oldStake = Troves(_borrower).stakes(token)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - Troves(_borrower).stakes(token) = newStake"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - totalStakes(token) = totalStakes(token).sub(oldStake).add(newStake)"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - TotalStakesUpdated(token,totalStakes(token))"]
    Node_12 --> Node_13
    Node_13["13: NodeType.EXPRESSION - ++ i"]
    Node_13 --> Node_5
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TroveManager.sol` on lines **503** to **517**

```solidity
    function _updateStakeAndTotalStakes(address _borrower) internal {
        uint256 troveOwnerLen = Troves[_borrower].colls.tokens.length;
        for (uint256 i; i < troveOwnerLen; ++i) {
            address token = Troves[_borrower].colls.tokens[i];
            uint amount = Troves[_borrower].colls.amounts[i];

            uint newStake = _computeNewStake(token, amount);
            uint oldStake = Troves[_borrower].stakes[token];

            Troves[_borrower].stakes[token] = newStake;
            totalStakes[token] = totalStakes[token].sub(oldStake).add(newStake);

            emit TotalStakesUpdated(token, totalStakes[token]);
        }
    }

```
