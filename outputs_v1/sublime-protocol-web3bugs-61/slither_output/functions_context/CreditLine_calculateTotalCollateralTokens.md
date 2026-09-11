# Context: CreditLine.calculateTotalCollateralTokens

**Contract:** `CreditLine` (Inherits: OwnableUpgradeable, ContextUpgradeable, Initializable, ReentrancyGuard)
**Signature:** `calculateTotalCollateralTokens(uint256) returns (uint256)`
**Method Selector ID:** `0x8878e26c`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** collateralShareInStrategy, creditLineConstants, strategyRegistry
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IYield.TMP_1252(uint256) = HIGH_LEVEL_CALL, dest:TMP_1251(IYield), function:getTokensForShares, arguments:['_liquidityShares', '_collateralAsset']  `
- `SafeMath.TMP_1253(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['_amount', '_tokenInStrategy'] `
- `IStrategyRegistry.TMP_1247(address[]) = HIGH_LEVEL_CALL, dest:TMP_1246(IStrategyRegistry), function:getStrategies, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - _collateralAsset = creditLineConstants(_id).collateralAsset"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - _strategyList = IStrategyRegistry(strategyRegistry).getStrategies()"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - "]
    Node_3 --> Node_6
    Node_4["4: NodeType.STARTLOOP - "]
    Node_4 --> Node_7
    Node_5["5: NodeType.ENDLOOP - "]
    Node_5 --> Node_16
    Node_6["6: NodeType.VARIABLE - index = 0"]
    Node_6 --> Node_4
    Node_7["7: NodeType.IFLOOP - index < _strategyList.length"]
    Node_7 --> Node_8
    Node_7 --> Node_5
    Node_8["8: NodeType.IF - _strategyList(index) == address(0)"]
    Node_8 --> Node_9
    Node_8 --> Node_10
    Node_9["9: NodeType.CONTINUE - "]
    Node_9 --> Node_15
    Node_10["10: NodeType.ENDIF - "]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - _liquidityShares = collateralShareInStrategy(_id)(_strategyList(index))"]
    Node_11 --> Node_12
    Node_12["12: NodeType.VARIABLE - _tokenInStrategy = _liquidityShares"]
    Node_12 --> Node_13
    Node_13["13: NodeType.EXPRESSION - _tokenInStrategy = IYield(_strategyList(index)).getTokensForShares(_liquidityShares,_collateralAsset)"]
    Node_13 --> Node_14
    Node_14["14: NodeType.EXPRESSION - _amount = _amount.add(_tokenInStrategy)"]
    Node_14 --> Node_15
    Node_15["15: NodeType.EXPRESSION - index ++"]
    Node_15 --> Node_7
    Node_16["16: NodeType.RETURN - _amount"]
```

### Source Mapping
Declared in: `contracts/CreditLine/CreditLine.sol` on lines **888** to **902**

```solidity
    function calculateTotalCollateralTokens(uint256 _id) public returns (uint256 _amount) {
        address _collateralAsset = creditLineConstants[_id].collateralAsset;
        address[] memory _strategyList = IStrategyRegistry(strategyRegistry).getStrategies();
        uint256 _liquidityShares;
        for (uint256 index = 0; index < _strategyList.length; index++) {
            if (_strategyList[index] == address(0)) {
                continue;
            }
            _liquidityShares = collateralShareInStrategy[_id][_strategyList[index]];
            uint256 _tokenInStrategy = _liquidityShares;
            _tokenInStrategy = IYield(_strategyList[index]).getTokensForShares(_liquidityShares, _collateralAsset);

            _amount = _amount.add(_tokenInStrategy);
        }
    }

```
