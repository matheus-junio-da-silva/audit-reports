# Context: TroveManager.updateSystemSnapshots_excludeCollRemainder

**Contract:** `TroveManager` (Inherits: ReentrancyGuard, ITroveManager, TroveManagerBase, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `updateSystemSnapshots_excludeCollRemainder(IActivePool,address[],uint256[])`
**Method Selector ID:** `0xe1f18250`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** defaultPool, totalStakes
- **Writes:** totalCollateralSnapshot, totalStakesSnapshot

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_597(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['TMP_596', 'liquidatedColl'] `
- `IDefaultPool.TMP_595(uint256) = HIGH_LEVEL_CALL, dest:defaultPool(IDefaultPool), function:getCollateral, arguments:['token']  `
- `IActivePool.TMP_594(uint256) = HIGH_LEVEL_CALL, dest:_activePool(IActivePool), function:getCollateral, arguments:['token']  `
- `SafeMath.TMP_596(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['activeColl', '_tokenRemainder'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - _requireCallerIsTML()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - tokensLen = _tokens.length"]
    Node_2 --> Node_5
    Node_3["3: NodeType.STARTLOOP - "]
    Node_3 --> Node_6
    Node_4["4: NodeType.ENDLOOP - "]
    Node_4 --> Node_14
    Node_5["5: NodeType.VARIABLE - "]
    Node_5 --> Node_3
    Node_6["6: NodeType.IFLOOP - i < tokensLen"]
    Node_6 --> Node_7
    Node_6 --> Node_4
    Node_7["7: NodeType.VARIABLE - token = _tokens(i)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - totalStakesSnapshot(token) = totalStakes(token)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.VARIABLE - _tokenRemainder = _amounts(i)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.VARIABLE - activeColl = _activePool.getCollateral(token)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.VARIABLE - liquidatedColl = defaultPool.getCollateral(token)"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - totalCollateralSnapshot(token) = activeColl.sub(_tokenRemainder).add(liquidatedColl)"]
    Node_12 --> Node_13
    Node_13["13: NodeType.EXPRESSION - ++ i"]
    Node_13 --> Node_6
    Node_14["14: NodeType.EXPRESSION - SystemSnapshotsUpdated(block.timestamp)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TroveManager.sol` on lines **635** to **648**

```solidity
    function updateSystemSnapshots_excludeCollRemainder(IActivePool _activePool, address[] memory _tokens, uint[] memory _amounts) external override {
        _requireCallerIsTML();
        uint256 tokensLen = _tokens.length;
        for (uint256 i; i < tokensLen; ++i) {
            address token = _tokens[i];
            totalStakesSnapshot[token] = totalStakes[token];

            uint _tokenRemainder = _amounts[i];
            uint activeColl = _activePool.getCollateral(token);
            uint liquidatedColl = defaultPool.getCollateral(token);
            totalCollateralSnapshot[token] = activeColl.sub(_tokenRemainder).add(liquidatedColl);
        }
        emit SystemSnapshotsUpdated(block.timestamp);
    }

```
