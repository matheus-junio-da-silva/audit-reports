# Context: TroveManager._removeStake

**Contract:** `TroveManager` (Inherits: ReentrancyGuard, ITroveManager, TroveManagerBase, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `_removeStake(address)`
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
- `SafeMath.TMP_528(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['REF_663', 'stake'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - borrowerColls = Troves(_borrower).colls.tokens"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - borrowerCollsLen = borrowerColls.length"]
    Node_2 --> Node_5
    Node_3["3: NodeType.STARTLOOP - "]
    Node_3 --> Node_6
    Node_4["4: NodeType.ENDLOOP - "]
    Node_5["5: NodeType.VARIABLE - "]
    Node_5 --> Node_3
    Node_6["6: NodeType.IFLOOP - i < borrowerCollsLen"]
    Node_6 --> Node_7
    Node_6 --> Node_4
    Node_7["7: NodeType.VARIABLE - coll = borrowerColls(i)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.VARIABLE - stake = Troves(_borrower).stakes(coll)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - totalStakes(coll) = totalStakes(coll).sub(stake)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - Troves(_borrower).stakes(coll) = 0"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - ++ i"]
    Node_11 --> Node_6
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TroveManager.sol` on lines **485** to **494**

```solidity
    function _removeStake(address _borrower) internal {
        address[] memory borrowerColls = Troves[_borrower].colls.tokens;
        uint256 borrowerCollsLen = borrowerColls.length;
        for (uint256 i; i < borrowerCollsLen; ++i) {
            address coll = borrowerColls[i];
            uint stake = Troves[_borrower].stakes[coll];
            totalStakes[coll] = totalStakes[coll].sub(stake);
            Troves[_borrower].stakes[coll] = 0;
        }
    }

```
