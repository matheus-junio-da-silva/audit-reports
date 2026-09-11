# Context: TroveManagerTester.getEntireDebtAndColls

**Contract:** `TroveManagerTester` (Inherits: TroveManager, ReentrancyGuard, ITroveManager, TroveManagerBase, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `getEntireDebtAndColls(address) returns (uint256, address[], uint256[], uint256, address[], uint256[])`
**Method Selector ID:** `0x12adf0c2`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** Troves
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_420(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['debt', 'pendingYUSDDebtReward'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - debt = Troves(_borrower).debt"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - colls = Troves(_borrower).colls"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - pendingYUSDDebtReward = getPendingYUSDDebtReward(_borrower)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - pendingCollReward = _getPendingCollRewards(_borrower)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - debt = debt.add(pendingYUSDDebtReward)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - colls = _sumColls(colls,pendingCollReward)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.RETURN - (debt,colls.tokens,colls.amounts,pendingYUSDDebtReward,pendingCollReward.tokens,pendingCollReward.amounts)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TroveManager.sol` on lines **457** to **476**

```solidity
    function getEntireDebtAndColls(
        address _borrower
    )
    public
    view override
    returns (uint, address[] memory, uint[] memory, uint, address[] memory, uint[] memory)
    {
        uint debt = Troves[_borrower].debt;
        newColls memory colls = Troves[_borrower].colls;

        uint pendingYUSDDebtReward = getPendingYUSDDebtReward(_borrower);
        newColls memory pendingCollReward = _getPendingCollRewards(_borrower);

        debt = debt.add(pendingYUSDDebtReward);

        // add in pending rewards to colls
        colls = _sumColls(colls, pendingCollReward);

        return (debt, colls.tokens, colls.amounts, pendingYUSDDebtReward, pendingCollReward.tokens, pendingCollReward.amounts);
    }

```
