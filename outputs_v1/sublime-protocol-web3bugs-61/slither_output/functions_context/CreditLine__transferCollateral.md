# Context: CreditLine._transferCollateral

**Contract:** `CreditLine` (Inherits: OwnableUpgradeable, ContextUpgradeable, Initializable, ReentrancyGuard)
**Signature:** `_transferCollateral(uint256,address,uint256,bool)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** collateralShareInStrategy, savingsAccount, strategyRegistry
- **Writes:** collateralShareInStrategy

### Assertion Checks & Business Requirements
- revert: `revert(string)(insufficient collateral)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_1287(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['_activeAmount', '_tokensToTransfer'] `
- `SafeMath.TMP_1288(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['REF_429', 'liquidityShares'] `
- `SafeMath.TMP_1286(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_1285', '_tokenInStrategy'] `
- `ISavingsAccount.TMP_1292(uint256) = HIGH_LEVEL_CALL, dest:TMP_1291(ISavingsAccount), function:withdraw, arguments:['_tokensToTransfer', '_asset', 'REF_434', 'msg.sender', 'False']  `
- `SafeMath.TMP_1284(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['_amountInTokens', '_activeAmount'] `
- `IYield.TMP_1281(uint256) = HIGH_LEVEL_CALL, dest:TMP_1280(IYield), function:getTokensForShares, arguments:['liquidityShares', '_asset']  `
- `SafeMath.TMP_1285(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['liquidityShares', '_tokensToTransfer'] `
- `IStrategyRegistry.TMP_1274(address[]) = HIGH_LEVEL_CALL, dest:TMP_1273(IStrategyRegistry), function:getStrategies, arguments:[]  `
- `ISavingsAccount.TMP_1290(uint256) = HIGH_LEVEL_CALL, dest:TMP_1289(ISavingsAccount), function:transfer, arguments:['_tokensToTransfer', '_asset', 'REF_432', 'msg.sender']  `
- `SafeMath.TMP_1282(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['_activeAmount', '_tokenInStrategy'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - _strategyList = IStrategyRegistry(strategyRegistry).getStrategies()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - "]
    Node_2 --> Node_5
    Node_3["3: NodeType.STARTLOOP - "]
    Node_3 --> Node_6
    Node_4["4: NodeType.ENDLOOP - "]
    Node_4 --> Node_28
    Node_5["5: NodeType.VARIABLE - index = 0"]
    Node_5 --> Node_3
    Node_6["6: NodeType.IFLOOP - index < _strategyList.length"]
    Node_6 --> Node_7
    Node_6 --> Node_4
    Node_7["7: NodeType.VARIABLE - liquidityShares = collateralShareInStrategy(_id)(_strategyList(index))"]
    Node_7 --> Node_8
    Node_8["8: NodeType.IF - liquidityShares == 0 || _strategyList(index) == address(0)"]
    Node_8 --> Node_9
    Node_8 --> Node_10
    Node_9["9: NodeType.CONTINUE - "]
    Node_9 --> Node_27
    Node_10["10: NodeType.ENDIF - "]
    Node_10 --> Node_11
    Node_11["11: NodeType.VARIABLE - _tokenInStrategy = liquidityShares"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - _tokenInStrategy = IYield(_strategyList(index)).getTokensForShares(liquidityShares,_asset)"]
    Node_12 --> Node_13
    Node_13["13: NodeType.VARIABLE - _tokensToTransfer = _tokenInStrategy"]
    Node_13 --> Node_14
    Node_14["14: NodeType.IF - _activeAmount.add(_tokenInStrategy) > _amountInTokens"]
    Node_14 --> Node_15
    Node_14 --> Node_17
    Node_15["15: NodeType.EXPRESSION - _tokensToTransfer = _amountInTokens.sub(_activeAmount)"]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - liquidityShares = liquidityShares.mul(_tokensToTransfer).div(_tokenInStrategy)"]
    Node_16 --> Node_17
    Node_17["17: NodeType.ENDIF - "]
    Node_17 --> Node_18
    Node_18["18: NodeType.EXPRESSION - _activeAmount = _activeAmount.add(_tokensToTransfer)"]
    Node_18 --> Node_19
    Node_19["19: NodeType.EXPRESSION - collateralShareInStrategy(_id)(_strategyList(index)) = collateralShareInStrategy(_id)(_strategyList(index)).sub(liquidityShares)"]
    Node_19 --> Node_20
    Node_20["20: NodeType.IF - _toSavingsAccount"]
    Node_20 --> Node_21
    Node_20 --> Node_22
    Node_21["21: NodeType.EXPRESSION - ISavingsAccount(savingsAccount).transfer(_tokensToTransfer,_asset,_strategyList(index),msg.sender)"]
    Node_21 --> Node_23
    Node_22["22: NodeType.EXPRESSION - ISavingsAccount(savingsAccount).withdraw(_tokensToTransfer,_asset,_strategyList(index),msg.sender,false)"]
    Node_22 --> Node_23
    Node_23["23: NodeType.ENDIF - "]
    Node_23 --> Node_24
    Node_24["24: NodeType.IF - _activeAmount == _amountInTokens"]
    Node_24 --> Node_25
    Node_24 --> Node_26
    Node_25["25: NodeType.RETURN - "]
    Node_26["26: NodeType.ENDIF - "]
    Node_26 --> Node_27
    Node_27["27: NodeType.EXPRESSION - index ++"]
    Node_27 --> Node_6
    Node_28["28: NodeType.EXPRESSION - revert(string)(insufficient collateral)"]
```

### Source Mapping
Declared in: `contracts/CreditLine/CreditLine.sol` on lines **951** to **986**

```solidity
    function _transferCollateral(
        uint256 _id,
        address _asset,
        uint256 _amountInTokens,
        bool _toSavingsAccount
    ) internal {
        address[] memory _strategyList = IStrategyRegistry(strategyRegistry).getStrategies();
        uint256 _activeAmount;
        for (uint256 index = 0; index < _strategyList.length; index++) {
            uint256 liquidityShares = collateralShareInStrategy[_id][_strategyList[index]];
            if (liquidityShares == 0 || _strategyList[index] == address(0)) {
                continue;
            }
            uint256 _tokenInStrategy = liquidityShares;
            _tokenInStrategy = IYield(_strategyList[index]).getTokensForShares(liquidityShares, _asset);
            uint256 _tokensToTransfer = _tokenInStrategy;
            if (_activeAmount.add(_tokenInStrategy) > _amountInTokens) {
                _tokensToTransfer = _amountInTokens.sub(_activeAmount);
                liquidityShares = liquidityShares.mul(_tokensToTransfer).div(_tokenInStrategy);
            }
            _activeAmount = _activeAmount.add(_tokensToTransfer);
            collateralShareInStrategy[_id][_strategyList[index]] = collateralShareInStrategy[_id][_strategyList[index]].sub(
                liquidityShares
            );
            if (_toSavingsAccount) {
                ISavingsAccount(savingsAccount).transfer(_tokensToTransfer, _asset, _strategyList[index], msg.sender);
            } else {
                ISavingsAccount(savingsAccount).withdraw(_tokensToTransfer, _asset, _strategyList[index], msg.sender, false);
            }

            if (_activeAmount == _amountInTokens) {
                return;
            }
        }
        revert('insufficient collateral');
    }

```
