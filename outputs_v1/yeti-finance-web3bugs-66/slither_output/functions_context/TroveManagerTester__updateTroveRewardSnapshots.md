# Context: TroveManagerTester._updateTroveRewardSnapshots

**Contract:** `TroveManagerTester` (Inherits: TroveManager, ReentrancyGuard, ITroveManager, TroveManagerBase, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `_updateTroveRewardSnapshots(address)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** L_Coll, L_YUSDDebt, rewardSnapshots, whitelist
- **Writes:** rewardSnapshots

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IWhitelist.TMP_391(address[]) = HIGH_LEVEL_CALL, dest:whitelist(IWhitelist), function:getValidCollateral, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - allColls = whitelist.getValidCollateral()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - allCollsLen = allColls.length"]
    Node_2 --> Node_5
    Node_3["3: NodeType.STARTLOOP - "]
    Node_3 --> Node_6
    Node_4["4: NodeType.ENDLOOP - "]
    Node_4 --> Node_11
    Node_5["5: NodeType.VARIABLE - "]
    Node_5 --> Node_3
    Node_6["6: NodeType.IFLOOP - i < allCollsLen"]
    Node_6 --> Node_7
    Node_6 --> Node_4
    Node_7["7: NodeType.VARIABLE - asset = allColls(i)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - rewardSnapshots(_borrower).CollRewards(asset) = L_Coll(asset)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - rewardSnapshots(_borrower).YUSDDebts(asset) = L_YUSDDebt(asset)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - ++ i"]
    Node_10 --> Node_6
    Node_11["11: NodeType.EXPRESSION - TroveSnapshotsUpdated(block.timestamp)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TroveManager.sol` on lines **372** to **381**

```solidity
    function _updateTroveRewardSnapshots(address _borrower) internal {
        address[] memory allColls = whitelist.getValidCollateral();
        uint256 allCollsLen = allColls.length;
        for (uint256 i; i < allCollsLen; ++i) {
            address asset = allColls[i];
            rewardSnapshots[_borrower].CollRewards[asset] = L_Coll[asset];
            rewardSnapshots[_borrower].YUSDDebts[asset] = L_YUSDDebt[asset];
        }
        emit TroveSnapshotsUpdated(block.timestamp);
    }

```
