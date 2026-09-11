# Context: SavingsAccount.getTotalTokens

**Contract:** `SavingsAccount` (Inherits: ReentrancyGuard, OwnableUpgradeable, ContextUpgradeable, Initializable, ISavingsAccount)
**Signature:** `getTotalTokens(address,address) returns (uint256)`
**Method Selector ID:** `0xab608e0b`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** balanceInShares, strategyRegistry
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IYield.TMP_2682(uint256) = HIGH_LEVEL_CALL, dest:TMP_2681(IYield), function:getTokensForShares, arguments:['_liquidityShares', '_token']  `
- `SafeMath.TMP_2683(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['_totalTokens', '_tokenInStrategy'] `
- `IStrategyRegistry.TMP_2676(address[]) = HIGH_LEVEL_CALL, dest:TMP_2675(IStrategyRegistry), function:getStrategies, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - _strategyList = IStrategyRegistry(strategyRegistry).getStrategies()"]
    Node_1 --> Node_4
    Node_2["2: NodeType.STARTLOOP - "]
    Node_2 --> Node_5
    Node_3["3: NodeType.ENDLOOP - "]
    Node_3 --> Node_15
    Node_4["4: NodeType.VARIABLE - i = 0"]
    Node_4 --> Node_2
    Node_5["5: NodeType.IFLOOP - i < _strategyList.length"]
    Node_5 --> Node_6
    Node_5 --> Node_3
    Node_6["6: NodeType.VARIABLE - _liquidityShares = balanceInShares(_user)(_token)(_strategyList(i))"]
    Node_6 --> Node_7
    Node_7["7: NodeType.IF - _liquidityShares != 0"]
    Node_7 --> Node_8
    Node_7 --> Node_13
    Node_8["8: NodeType.VARIABLE - _tokenInStrategy = _liquidityShares"]
    Node_8 --> Node_9
    Node_9["9: NodeType.IF - _strategyList(i) != address(0)"]
    Node_9 --> Node_10
    Node_9 --> Node_11
    Node_10["10: NodeType.EXPRESSION - _tokenInStrategy = IYield(_strategyList(i)).getTokensForShares(_liquidityShares,_token)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.ENDIF - "]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - _totalTokens = _totalTokens.add(_tokenInStrategy)"]
    Node_12 --> Node_13
    Node_13["13: NodeType.ENDIF - "]
    Node_13 --> Node_14
    Node_14["14: NodeType.EXPRESSION - i ++"]
    Node_14 --> Node_5
    Node_15["15: NodeType.RETURN - _totalTokens"]
```

### Source Mapping
Declared in: `contracts/SavingsAccount/SavingsAccount.sol` on lines **464** to **479**

```solidity
    function getTotalTokens(address _user, address _token) external override returns (uint256 _totalTokens) {
        address[] memory _strategyList = IStrategyRegistry(strategyRegistry).getStrategies();

        for (uint256 i = 0; i < _strategyList.length; i++) {
            uint256 _liquidityShares = balanceInShares[_user][_token][_strategyList[i]];

            if (_liquidityShares != 0) {
                uint256 _tokenInStrategy = _liquidityShares;
                if (_strategyList[i] != address(0)) {
                    _tokenInStrategy = IYield(_strategyList[i]).getTokensForShares(_liquidityShares, _token);
                }

                _totalTokens = _totalTokens.add(_tokenInStrategy);
            }
        }
    }

```
