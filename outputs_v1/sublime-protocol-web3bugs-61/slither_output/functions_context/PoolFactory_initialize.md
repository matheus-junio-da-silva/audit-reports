# Context: PoolFactory.initialize

**Contract:** `PoolFactory` (Inherits: IPoolFactory, OwnableUpgradeable, ContextUpgradeable, Initializable)
**Signature:** `initialize(address,uint256,uint256,uint256,bytes4,uint256,uint256,uint256,uint256,address,address)`
**Method Selector ID:** `0xd3f09658`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `initializer`
  ```solidity
  modifier initializer() {
          require(_initializing || _isConstructor() || !_initialized, "Initializable: contract is already initialized");
  
          bool isTopLevelCall = !_initializing;
          if (isTopLevelCall) {
              _initializing = true;
              _initialized = true;
          }
  
          _;
  
          if (isTopLevelCall) {
              _initializing = false;
          }
      }
  ```

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- None

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_13
    Node_1["1: NodeType.EXPRESSION - OwnableUpgradeable.__Ownable_init()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - OwnableUpgradeable.transferOwnership(_admin)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - _updateCollectionPeriod(_collectionPeriod)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - _updateLoanWithdrawalDuration(_loanWithdrawalDuration)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - _updateMarginCallDuration(_marginCallDuration)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - _updatepoolInitFuncSelector(_poolInitFuncSelector)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - _updateLiquidatorRewardFraction(_liquidatorRewardFraction)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - _updatePoolCancelPenaltyMultiple(_poolCancelPenaltyMultiple)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - _updateMinBorrowFraction(_minBorrowFraction)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - _updateProtocolFeeFraction(_protocolFeeFraction)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - _updateProtocolFeeCollector(_protocolFeeCollector)"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - _updateNoStrategy(_noStrategy)"]
    Node_13["13: NodeType.EXPRESSION - initializer()"]
    Node_13 --> Node_1
```

### Source Mapping
Declared in: `contracts/Pool/PoolFactory.sol` on lines **188** to **215**

```solidity
    function initialize(
        address _admin,
        uint256 _collectionPeriod,
        uint256 _loanWithdrawalDuration,
        uint256 _marginCallDuration,
        bytes4 _poolInitFuncSelector,
        uint256 _liquidatorRewardFraction,
        uint256 _poolCancelPenaltyMultiple,
        uint256 _minBorrowFraction,
        uint256 _protocolFeeFraction,
        address _protocolFeeCollector,
        address _noStrategy
    ) external initializer {
        {
            OwnableUpgradeable.__Ownable_init();
            OwnableUpgradeable.transferOwnership(_admin);
        }
        _updateCollectionPeriod(_collectionPeriod);
        _updateLoanWithdrawalDuration(_loanWithdrawalDuration);
        _updateMarginCallDuration(_marginCallDuration);
        _updatepoolInitFuncSelector(_poolInitFuncSelector);
        _updateLiquidatorRewardFraction(_liquidatorRewardFraction);
        _updatePoolCancelPenaltyMultiple(_poolCancelPenaltyMultiple);
        _updateMinBorrowFraction(_minBorrowFraction);
        _updateProtocolFeeFraction(_protocolFeeFraction);
        _updateProtocolFeeCollector(_protocolFeeCollector);
        _updateNoStrategy(_noStrategy);
    }

```
