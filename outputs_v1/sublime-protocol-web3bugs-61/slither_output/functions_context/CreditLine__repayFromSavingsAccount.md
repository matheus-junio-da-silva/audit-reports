# Context: CreditLine._repayFromSavingsAccount

**Contract:** `CreditLine` (Inherits: OwnableUpgradeable, ContextUpgradeable, Initializable, ReentrancyGuard)
**Signature:** `_repayFromSavingsAccount(uint256,address,address)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** savingsAccount, strategyRegistry
- **Writes:** None

### Assertion Checks & Business Requirements
- revert: `revert(string)(CreditLine::_repayFromSavingsAccount - Insufficient balance)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_1183(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['_activeAmount', '_tokensToTransfer'] `
- `ISavingsAccount.TMP_1176(uint256) = HIGH_LEVEL_CALL, dest:_savingsAccount(ISavingsAccount), function:balanceInShares, arguments:['msg.sender', '_asset', 'REF_309']  `
- `SafeMath.TMP_1182(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['_amount', '_activeAmount'] `
- `ISavingsAccount.TMP_1184(uint256) = HIGH_LEVEL_CALL, dest:_savingsAccount(ISavingsAccount), function:transferFrom, arguments:['_tokensToTransfer', '_asset', 'REF_316', 'msg.sender', '_lender']  `
- `IStrategyRegistry.TMP_1171(address[]) = HIGH_LEVEL_CALL, dest:TMP_1170(IStrategyRegistry), function:getStrategies, arguments:[]  `
- `IYield.TMP_1179(uint256) = HIGH_LEVEL_CALL, dest:TMP_1178(IYield), function:getTokensForShares, arguments:['_liquidityShares', '_asset']  `
- `SafeMath.TMP_1180(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['_activeAmount', '_tokenInStrategy'] `

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
    Node_5 --> Node_27
    Node_6["6: NodeType.VARIABLE - _index = 0"]
    Node_6 --> Node_4
    Node_7["7: NodeType.IFLOOP - _index < _strategyList.length"]
    Node_7 --> Node_8
    Node_7 --> Node_5
    Node_8["8: NodeType.IF - _strategyList(_index) == address(0)"]
    Node_8 --> Node_9
    Node_8 --> Node_10
    Node_9["9: NodeType.CONTINUE - "]
    Node_9 --> Node_26
    Node_10["10: NodeType.ENDIF - "]
    Node_10 --> Node_11
    Node_11["11: NodeType.VARIABLE - _liquidityShares = _savingsAccount.balanceInShares(msg.sender,_asset,_strategyList(_index))"]
    Node_11 --> Node_12
    Node_12["12: NodeType.IF - _liquidityShares == 0"]
    Node_12 --> Node_13
    Node_12 --> Node_14
    Node_13["13: NodeType.CONTINUE - "]
    Node_13 --> Node_26
    Node_14["14: NodeType.ENDIF - "]
    Node_14 --> Node_15
    Node_15["15: NodeType.VARIABLE - _tokenInStrategy = _liquidityShares"]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - _tokenInStrategy = IYield(_strategyList(_index)).getTokensForShares(_liquidityShares,_asset)"]
    Node_16 --> Node_17
    Node_17["17: NodeType.VARIABLE - _tokensToTransfer = _tokenInStrategy"]
    Node_17 --> Node_18
    Node_18["18: NodeType.IF - _activeAmount.add(_tokenInStrategy) >= _amount"]
    Node_18 --> Node_19
    Node_18 --> Node_20
    Node_19["19: NodeType.EXPRESSION - _tokensToTransfer = (_amount.sub(_activeAmount))"]
    Node_19 --> Node_20
    Node_20["20: NodeType.ENDIF - "]
    Node_20 --> Node_21
    Node_21["21: NodeType.EXPRESSION - _activeAmount = _activeAmount.add(_tokensToTransfer)"]
    Node_21 --> Node_22
    Node_22["22: NodeType.EXPRESSION - _savingsAccount.transferFrom(_tokensToTransfer,_asset,_strategyList(_index),msg.sender,_lender)"]
    Node_22 --> Node_23
    Node_23["23: NodeType.IF - _amount == _activeAmount"]
    Node_23 --> Node_24
    Node_23 --> Node_25
    Node_24["24: NodeType.RETURN - "]
    Node_25["25: NodeType.ENDIF - "]
    Node_25 --> Node_26
    Node_26["26: NodeType.EXPRESSION - _index ++"]
    Node_26 --> Node_7
    Node_27["27: NodeType.EXPRESSION - revert(string)(CreditLine::_repayFromSavingsAccount - Insufficient balance)"]
```

### Source Mapping
Declared in: `contracts/CreditLine/CreditLine.sol` on lines **729** to **761**

```solidity
    function _repayFromSavingsAccount(
        uint256 _amount,
        address _asset,
        address _lender
    ) internal {
        address[] memory _strategyList = IStrategyRegistry(strategyRegistry).getStrategies();
        ISavingsAccount _savingsAccount = ISavingsAccount(savingsAccount);
        uint256 _activeAmount;

        for (uint256 _index = 0; _index < _strategyList.length; _index++) {
            if (_strategyList[_index] == address(0)) {
                continue;
            }
            uint256 _liquidityShares = _savingsAccount.balanceInShares(msg.sender, _asset, _strategyList[_index]);
            if (_liquidityShares == 0) {
                continue;
            }
            uint256 _tokenInStrategy = _liquidityShares;
            _tokenInStrategy = IYield(_strategyList[_index]).getTokensForShares(_liquidityShares, _asset);

            uint256 _tokensToTransfer = _tokenInStrategy;
            if (_activeAmount.add(_tokenInStrategy) >= _amount) {
                _tokensToTransfer = (_amount.sub(_activeAmount));
            }
            _activeAmount = _activeAmount.add(_tokensToTransfer);
            _savingsAccount.transferFrom(_tokensToTransfer, _asset, _strategyList[_index], msg.sender, _lender);

            if (_amount == _activeAmount) {
                return;
            }
        }
        revert('CreditLine::_repayFromSavingsAccount - Insufficient balance');
    }

```
