# Context: TroveManagerTester._closeTrove

**Contract:** `TroveManagerTester` (Inherits: TroveManager, ReentrancyGuard, ITroveManager, TroveManagerBase, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `_closeTrove(address,TroveManagerBase.Status)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** TroveOwners, Troves, rewardSnapshots, sortedTroves, whitelist
- **Writes:** Troves, rewardSnapshots

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(closedStatus != Status.nonExistent && closedStatus != Status.active,Status must be active and exists)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `ISortedTroves.HIGH_LEVEL_CALL, dest:sortedTroves(ISortedTroves), function:remove, arguments:['_borrower']  `
- `IWhitelist.TMP_485(address[]) = HIGH_LEVEL_CALL, dest:whitelist(IWhitelist), function:getValidCollateral, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(closedStatus != Status.nonExistent && closedStatus != Status.active,Status must be active and exists)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - TroveOwnersArrayLength = TroveOwners.length"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - _requireMoreThanOneTroveInSystem(TroveOwnersArrayLength)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - Troves(_borrower).status = closedStatus"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - Troves(_borrower).colls = emptyColls"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - Troves(_borrower).debt = 0"]
    Node_7 --> Node_8
    Node_8["8: NodeType.VARIABLE - allColls = whitelist.getValidCollateral()"]
    Node_8 --> Node_9
    Node_9["9: NodeType.VARIABLE - allCollsLen = allColls.length"]
    Node_9 --> Node_10
    Node_10["10: NodeType.VARIABLE - "]
    Node_10 --> Node_13
    Node_11["11: NodeType.STARTLOOP - "]
    Node_11 --> Node_14
    Node_12["12: NodeType.ENDLOOP - "]
    Node_12 --> Node_19
    Node_13["13: NodeType.VARIABLE - "]
    Node_13 --> Node_11
    Node_14["14: NodeType.IFLOOP - i < allCollsLen"]
    Node_14 --> Node_15
    Node_14 --> Node_12
    Node_15["15: NodeType.EXPRESSION - thisAllColls = allColls(i)"]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - rewardSnapshots(_borrower).CollRewards(thisAllColls) = 0"]
    Node_16 --> Node_17
    Node_17["17: NodeType.EXPRESSION - rewardSnapshots(_borrower).YUSDDebts(thisAllColls) = 0"]
    Node_17 --> Node_18
    Node_18["18: NodeType.EXPRESSION - ++ i"]
    Node_18 --> Node_14
    Node_19["19: NodeType.EXPRESSION - _removeTroveOwner(_borrower,TroveOwnersArrayLength)"]
    Node_19 --> Node_20
    Node_20["20: NodeType.EXPRESSION - sortedTroves.remove(_borrower)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TroveManager.sol` on lines **601** to **623**

```solidity
    function _closeTrove(address _borrower, Status closedStatus) internal {
        require(closedStatus != Status.nonExistent && closedStatus != Status.active, "Status must be active and exists");

        uint TroveOwnersArrayLength = TroveOwners.length;
        _requireMoreThanOneTroveInSystem(TroveOwnersArrayLength);
        newColls memory emptyColls;

        Troves[_borrower].status = closedStatus;
        Troves[_borrower].colls = emptyColls;
        Troves[_borrower].debt = 0;

        address[] memory allColls = whitelist.getValidCollateral();
        uint allCollsLen = allColls.length;
        address thisAllColls;
        for (uint256 i; i < allCollsLen; ++i) {
            thisAllColls = allColls[i];
            rewardSnapshots[_borrower].CollRewards[thisAllColls] = 0;
            rewardSnapshots[_borrower].YUSDDebts[thisAllColls] = 0;
        }

        _removeTroveOwner(_borrower, TroveOwnersArrayLength);
        sortedTroves.remove(_borrower);
    }

```
