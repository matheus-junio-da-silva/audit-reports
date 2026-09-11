# Context: MultiTroveGetter._getCombinedTroveData

**Contract:** `MultiTroveGetter` (Inherits: None)
**Signature:** `_getCombinedTroveData(address) returns (MultiTroveGetter.CombinedTroveData)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** troveManager, whitelist
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IWhitelist.TMP_469(address[]) = HIGH_LEVEL_CALL, dest:whitelist(IWhitelist), function:getValidCollateral, arguments:[]  `
- `TroveManager.TMP_476(uint256) = HIGH_LEVEL_CALL, dest:troveManager(TroveManager), function:getRewardSnapshotColl, arguments:['_troveOwner', 'token']  `
- `TroveManager.TUPLE_1(address[],uint256[]) = HIGH_LEVEL_CALL, dest:troveManager(TroveManager), function:getTroveColls, arguments:['_troveOwner']  `
- `TroveManager.TMP_475(uint256) = HIGH_LEVEL_CALL, dest:troveManager(TroveManager), function:getTroveStake, arguments:['_troveOwner', 'token']  `
- `TroveManager.TMP_468(uint256) = HIGH_LEVEL_CALL, dest:troveManager(TroveManager), function:getTroveDebt, arguments:['_troveOwner']  `
- `TroveManager.TMP_477(uint256) = HIGH_LEVEL_CALL, dest:troveManager(TroveManager), function:getRewardSnapshotYUSD, arguments:['_troveOwner', 'token']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - data.owner = _troveOwner"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - data.debt = troveManager.getTroveDebt(_troveOwner)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - (data.colls,data.amounts) = troveManager.getTroveColls(_troveOwner)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - data.allColls = whitelist.getValidCollateral()"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - data.stakeAmounts = new uint256()(data.allColls.length)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - data.snapshotAmounts = new uint256()(data.allColls.length)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - collsLen = data.allColls.length"]
    Node_7 --> Node_10
    Node_8["8: NodeType.STARTLOOP - "]
    Node_8 --> Node_11
    Node_9["9: NodeType.ENDLOOP - "]
    Node_9 --> Node_17
    Node_10["10: NodeType.VARIABLE - "]
    Node_10 --> Node_8
    Node_11["11: NodeType.IFLOOP - i < collsLen"]
    Node_11 --> Node_12
    Node_11 --> Node_9
    Node_12["12: NodeType.VARIABLE - token = data.allColls(i)"]
    Node_12 --> Node_13
    Node_13["13: NodeType.EXPRESSION - data.stakeAmounts(i) = troveManager.getTroveStake(_troveOwner,token)"]
    Node_13 --> Node_14
    Node_14["14: NodeType.EXPRESSION - data.snapshotAmounts(i) = troveManager.getRewardSnapshotColl(_troveOwner,token)"]
    Node_14 --> Node_15
    Node_15["15: NodeType.EXPRESSION - data.snapshotYUSDDebts(i) = troveManager.getRewardSnapshotYUSD(_troveOwner,token)"]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - ++ i"]
    Node_16 --> Node_11
    Node_17["17: NodeType.RETURN - data"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/MultiTroveGetter.sol` on lines **102** to **118**

```solidity
    function _getCombinedTroveData(address _troveOwner) internal view returns (CombinedTroveData memory data) {
        data.owner = _troveOwner;
        data.debt = troveManager.getTroveDebt(_troveOwner);
        (data.colls, data.amounts) = troveManager.getTroveColls(_troveOwner);

        data.allColls = whitelist.getValidCollateral();
        data.stakeAmounts = new uint[](data.allColls.length);
        data.snapshotAmounts = new uint[](data.allColls.length);
        uint256 collsLen = data.allColls.length;
        for (uint256 i; i < collsLen; ++i) {
            address token = data.allColls[i];

            data.stakeAmounts[i] = troveManager.getTroveStake(_troveOwner, token);
            data.snapshotAmounts[i] = troveManager.getRewardSnapshotColl(_troveOwner, token);
            data.snapshotYUSDDebts[i] = troveManager.getRewardSnapshotYUSD(_troveOwner, token);
        }
    }

```
