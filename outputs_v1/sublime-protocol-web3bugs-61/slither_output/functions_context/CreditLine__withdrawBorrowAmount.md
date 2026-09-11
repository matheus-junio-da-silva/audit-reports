# Context: CreditLine._withdrawBorrowAmount

**Contract:** `CreditLine` (Inherits: OwnableUpgradeable, ContextUpgradeable, Initializable, ReentrancyGuard)
**Signature:** `_withdrawBorrowAmount(address,uint256,address)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** savingsAccount, strategyRegistry
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_activeAmount == _amountInTokens,insufficient balance)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `ISavingsAccount.TMP_1118(uint256) = HIGH_LEVEL_CALL, dest:_savingsAccount(ISavingsAccount), function:balanceInShares, arguments:['_lender', '_asset', 'REF_272']  `
- `IYield.TMP_1121(uint256) = HIGH_LEVEL_CALL, dest:TMP_1120(IYield), function:getTokensForShares, arguments:['_liquidityShares', '_asset']  `
- `ISavingsAccount.TMP_1127(uint256) = HIGH_LEVEL_CALL, dest:_savingsAccount(ISavingsAccount), function:withdrawFrom, arguments:['_tokensToTransfer', '_asset', 'REF_279', '_lender', 'TMP_1126', 'False']  `
- `SafeMath.TMP_1125(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['_activeAmount', '_tokensToTransfer'] `
- `IStrategyRegistry.TMP_1113(address[]) = HIGH_LEVEL_CALL, dest:TMP_1112(IStrategyRegistry), function:getStrategies, arguments:[]  `
- `SafeMath.TMP_1124(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['_amountInTokens', '_activeAmount'] `
- `SafeMath.TMP_1122(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['_activeAmount', 'tokenInStrategy'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - _strategyList = IStrategyRegistry(strategyRegistry).getStrategies()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - _savingsAccount = ISavingsAccount(savingsAccount)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - "]
    Node_3 --> Node_6
    Node_4["4: NodeType.STARTLOOP - "]
    Node_4 --> Node_7
    Node_5["5: NodeType.ENDLOOP - "]
    Node_5 --> Node_26
    Node_6["6: NodeType.VARIABLE - _index = 0"]
    Node_6 --> Node_4
    Node_7["7: NodeType.IFLOOP - _index < _strategyList.length"]
    Node_7 --> Node_8
    Node_7 --> Node_5
    Node_8["8: NodeType.IF - _strategyList(_index) == address(0)"]
    Node_8 --> Node_9
    Node_8 --> Node_10
    Node_9["9: NodeType.CONTINUE - "]
    Node_9 --> Node_25
    Node_10["10: NodeType.ENDIF - "]
    Node_10 --> Node_11
    Node_11["11: NodeType.VARIABLE - _liquidityShares = _savingsAccount.balanceInShares(_lender,_asset,_strategyList(_index))"]
    Node_11 --> Node_12
    Node_12["12: NodeType.IF - _liquidityShares != 0"]
    Node_12 --> Node_13
    Node_12 --> Node_24
    Node_13["13: NodeType.VARIABLE - tokenInStrategy = _liquidityShares"]
    Node_13 --> Node_14
    Node_14["14: NodeType.EXPRESSION - tokenInStrategy = IYield(_strategyList(_index)).getTokensForShares(_liquidityShares,_asset)"]
    Node_14 --> Node_15
    Node_15["15: NodeType.VARIABLE - _tokensToTransfer = tokenInStrategy"]
    Node_15 --> Node_16
    Node_16["16: NodeType.IF - _activeAmount.add(tokenInStrategy) >= _amountInTokens"]
    Node_16 --> Node_17
    Node_16 --> Node_18
    Node_17["17: NodeType.EXPRESSION - _tokensToTransfer = (_amountInTokens.sub(_activeAmount))"]
    Node_17 --> Node_18
    Node_18["18: NodeType.ENDIF - "]
    Node_18 --> Node_19
    Node_19["19: NodeType.EXPRESSION - _activeAmount = _activeAmount.add(_tokensToTransfer)"]
    Node_19 --> Node_20
    Node_20["20: NodeType.EXPRESSION - _savingsAccount.withdrawFrom(_tokensToTransfer,_asset,_strategyList(_index),_lender,address(this),false)"]
    Node_20 --> Node_21
    Node_21["21: NodeType.IF - _activeAmount == _amountInTokens"]
    Node_21 --> Node_22
    Node_21 --> Node_23
    Node_22["22: NodeType.RETURN - "]
    Node_23["23: NodeType.ENDIF - "]
    Node_23 --> Node_24
    Node_24["24: NodeType.ENDIF - "]
    Node_24 --> Node_25
    Node_25["25: NodeType.EXPRESSION - _index ++"]
    Node_25 --> Node_7
    Node_26["26: NodeType.EXPRESSION - require(bool,string)(_activeAmount == _amountInTokens,insufficient balance)"]
```

### Source Mapping
Declared in: `contracts/CreditLine/CreditLine.sol` on lines **654** to **682**

```solidity
    function _withdrawBorrowAmount(
        address _asset,
        uint256 _amountInTokens,
        address _lender
    ) internal {
        address[] memory _strategyList = IStrategyRegistry(strategyRegistry).getStrategies();
        ISavingsAccount _savingsAccount = ISavingsAccount(savingsAccount);
        uint256 _activeAmount;
        for (uint256 _index = 0; _index < _strategyList.length; _index++) {
            if (_strategyList[_index] == address(0)) {
                continue;
            }
            uint256 _liquidityShares = _savingsAccount.balanceInShares(_lender, _asset, _strategyList[_index]);
            if (_liquidityShares != 0) {
                uint256 tokenInStrategy = _liquidityShares;
                tokenInStrategy = IYield(_strategyList[_index]).getTokensForShares(_liquidityShares, _asset);
                uint256 _tokensToTransfer = tokenInStrategy;
                if (_activeAmount.add(tokenInStrategy) >= _amountInTokens) {
                    _tokensToTransfer = (_amountInTokens.sub(_activeAmount));
                }
                _activeAmount = _activeAmount.add(_tokensToTransfer);
                _savingsAccount.withdrawFrom(_tokensToTransfer, _asset, _strategyList[_index], _lender, address(this), false);
                if (_activeAmount == _amountInTokens) {
                    return;
                }
            }
        }
        require(_activeAmount == _amountInTokens, 'insufficient balance');
    }

```
