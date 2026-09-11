# Context: CreditLine._depositCollateralFromSavingsAccount

**Contract:** `CreditLine` (Inherits: OwnableUpgradeable, ContextUpgradeable, Initializable, ReentrancyGuard)
**Signature:** `_depositCollateralFromSavingsAccount(uint256,uint256,address)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** collateralShareInStrategy, creditLineConstants, savingsAccount, strategyRegistry
- **Writes:** collateralShareInStrategy

### Assertion Checks & Business Requirements
- revert: `revert(string)(CreditLine::_depositCollateralFromSavingsAccount - Insufficient balance)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_1060(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['_amount', '_activeAmount'] `
- `SafeMath.TMP_1064(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['_liquidityShares', '_tokensToTransfer'] `
- `ISavingsAccount.TMP_1051(uint256) = HIGH_LEVEL_CALL, dest:_savingsAccount(ISavingsAccount), function:balanceInShares, arguments:['_sender', '_collateralAsset', '_strategy']  `
- `SafeMath.TMP_1058(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['_activeAmount', '_tokenInStrategy'] `
- `SafeMath.TMP_1066(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['REF_215', 'TMP_1065'] `
- `IStrategyRegistry.TMP_1048(address[]) = HIGH_LEVEL_CALL, dest:TMP_1047(IStrategyRegistry), function:getStrategies, arguments:[]  `
- `SafeMath.TMP_1065(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_1064', '_tokenInStrategy'] `
- `SafeMath.TMP_1061(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['_activeAmount', '_tokensToTransfer'] `
- `ISavingsAccount.TMP_1063(uint256) = HIGH_LEVEL_CALL, dest:_savingsAccount(ISavingsAccount), function:transferFrom, arguments:['_tokensToTransfer', '_collateralAsset', '_strategy', '_sender', 'TMP_1062']  `
- `IYield.TMP_1057(uint256) = HIGH_LEVEL_CALL, dest:TMP_1056(IYield), function:getTokensForShares, arguments:['_liquidityShares', '_collateralAsset']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - _collateralAsset = creditLineConstants(_id).collateralAsset"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - _strategyList = IStrategyRegistry(strategyRegistry).getStrategies()"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - _savingsAccount = ISavingsAccount(savingsAccount)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - "]
    Node_4 --> Node_7
    Node_5["5: NodeType.STARTLOOP - "]
    Node_5 --> Node_8
    Node_6["6: NodeType.ENDLOOP - "]
    Node_6 --> Node_27
    Node_7["7: NodeType.VARIABLE - _index = 0"]
    Node_7 --> Node_5
    Node_8["8: NodeType.IFLOOP - _index < _strategyList.length"]
    Node_8 --> Node_9
    Node_8 --> Node_6
    Node_9["9: NodeType.VARIABLE - _strategy = _strategyList(_index)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.VARIABLE - _liquidityShares = _savingsAccount.balanceInShares(_sender,_collateralAsset,_strategy)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.IF - _liquidityShares == 0 || _strategyList(_index) == address(0)"]
    Node_11 --> Node_12
    Node_11 --> Node_13
    Node_12["12: NodeType.CONTINUE - "]
    Node_12 --> Node_26
    Node_13["13: NodeType.ENDIF - "]
    Node_13 --> Node_14
    Node_14["14: NodeType.VARIABLE - _tokenInStrategy = _liquidityShares"]
    Node_14 --> Node_15
    Node_15["15: NodeType.EXPRESSION - _tokenInStrategy = IYield(_strategy).getTokensForShares(_liquidityShares,_collateralAsset)"]
    Node_15 --> Node_16
    Node_16["16: NodeType.VARIABLE - _tokensToTransfer = _tokenInStrategy"]
    Node_16 --> Node_17
    Node_17["17: NodeType.IF - _activeAmount.add(_tokenInStrategy) >= _amount"]
    Node_17 --> Node_18
    Node_17 --> Node_19
    Node_18["18: NodeType.EXPRESSION - _tokensToTransfer = (_amount.sub(_activeAmount))"]
    Node_18 --> Node_19
    Node_19["19: NodeType.ENDIF - "]
    Node_19 --> Node_20
    Node_20["20: NodeType.EXPRESSION - _activeAmount = _activeAmount.add(_tokensToTransfer)"]
    Node_20 --> Node_21
    Node_21["21: NodeType.EXPRESSION - _savingsAccount.transferFrom(_tokensToTransfer,_collateralAsset,_strategy,_sender,address(this))"]
    Node_21 --> Node_22
    Node_22["22: NodeType.EXPRESSION - collateralShareInStrategy(_id)(_strategy) = collateralShareInStrategy(_id)(_strategy).add(_liquidityShares.mul(_tokensToTransfer).div(_tokenInStrategy))"]
    Node_22 --> Node_23
    Node_23["23: NodeType.IF - _amount == _activeAmount"]
    Node_23 --> Node_24
    Node_23 --> Node_25
    Node_24["24: NodeType.RETURN - "]
    Node_25["25: NodeType.ENDIF - "]
    Node_25 --> Node_26
    Node_26["26: NodeType.EXPRESSION - _index ++"]
    Node_26 --> Node_8
    Node_27["27: NodeType.EXPRESSION - revert(string)(CreditLine::_depositCollateralFromSavingsAccount - Insufficient balance)"]
```

### Source Mapping
Declared in: `contracts/CreditLine/CreditLine.sol` on lines **474** to **509**

```solidity
    function _depositCollateralFromSavingsAccount(
        uint256 _id,
        uint256 _amount,
        address _sender
    ) internal {
        address _collateralAsset = creditLineConstants[_id].collateralAsset;
        address[] memory _strategyList = IStrategyRegistry(strategyRegistry).getStrategies();
        ISavingsAccount _savingsAccount = ISavingsAccount(savingsAccount);
        uint256 _activeAmount;

        for (uint256 _index = 0; _index < _strategyList.length; _index++) {
            address _strategy = _strategyList[_index];
            uint256 _liquidityShares = _savingsAccount.balanceInShares(_sender, _collateralAsset, _strategy);
            if (_liquidityShares == 0 || _strategyList[_index] == address(0)) {
                continue;
            }
            uint256 _tokenInStrategy = _liquidityShares;
            _tokenInStrategy = IYield(_strategy).getTokensForShares(_liquidityShares, _collateralAsset);

            uint256 _tokensToTransfer = _tokenInStrategy;
            if (_activeAmount.add(_tokenInStrategy) >= _amount) {
                _tokensToTransfer = (_amount.sub(_activeAmount));
            }
            _activeAmount = _activeAmount.add(_tokensToTransfer);
            _savingsAccount.transferFrom(_tokensToTransfer, _collateralAsset, _strategy, _sender, address(this));

            collateralShareInStrategy[_id][_strategy] = collateralShareInStrategy[_id][_strategy].add(
                _liquidityShares.mul(_tokensToTransfer).div(_tokenInStrategy)
            );

            if (_amount == _activeAmount) {
                return;
            }
        }
        revert('CreditLine::_depositCollateralFromSavingsAccount - Insufficient balance');
    }

```
