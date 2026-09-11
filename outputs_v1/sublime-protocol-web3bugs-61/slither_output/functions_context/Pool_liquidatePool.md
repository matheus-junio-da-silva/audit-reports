# Context: Pool.liquidatePool

**Contract:** `Pool` (Inherits: ReentrancyGuard, IPool, ERC20PausableUpgradeable, PausableUpgradeable, ERC20Upgradeable, IERC20Upgradeable, ContextUpgradeable, Initializable)
**Signature:** `liquidatePool(bool,bool,bool)`
**Method Selector ID:** `0x7729886f`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `nonReentrant`
  ```solidity
  modifier nonReentrant() {
          // On the first call to nonReentrant, _notEntered will be true
          require(_status != _ENTERED, "ReentrancyGuard: reentrant call");
  
          // Any calls to nonReentrant after this point will fail
          _status = _ENTERED;
  
          _;
  
          // By storing the original value once again, a refund is triggered (see
          // https://eips.ethereum.org/EIPS/eip-2200)
          _status = _NOT_ENTERED;
      }
  ```

### State Variables Interaction
- **Reads:** poolConstants, poolFactory, poolVariables
- **Writes:** poolVariables

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_currentPoolStatus == LoanStatus.ACTIVE,LP1)`
- require/assert: `require(bool,string)(IRepayment(_poolFactory.repaymentImpl()).didBorrowerDefault(address(this)),LP2)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IRepayment.TMP_1830(bool) = HIGH_LEVEL_CALL, dest:TMP_1828(IRepayment), function:didBorrowerDefault, arguments:['TMP_1829']  `
- `IPoolFactory.TMP_1827(address) = HIGH_LEVEL_CALL, dest:_poolFactory(IPoolFactory), function:repaymentImpl, arguments:[]  `
- `SafeMathUpgradeable.TMP_1832(uint256) = LIBRARY_CALL, dest:SafeMathUpgradeable, function:SafeMathUpgradeable.add(uint256,uint256), arguments:['REF_808', 'REF_810'] `
- `IYield.TMP_1834(uint256) = HIGH_LEVEL_CALL, dest:TMP_1833(IYield), function:getTokensForShares, arguments:['_collateralLiquidityShare', '_collateralAsset']  `
- `IPoolFactory.TMP_1835(address) = HIGH_LEVEL_CALL, dest:_poolFactory(IPoolFactory), function:priceOracle, arguments:[]  `
- `IPoolFactory.TMP_1838(address) = HIGH_LEVEL_CALL, dest:_poolFactory(IPoolFactory), function:noStrategyAddress, arguments:[]  `
- `IPoolFactory.TMP_1836(uint256) = HIGH_LEVEL_CALL, dest:_poolFactory(IPoolFactory), function:liquidatorRewardFraction, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_18
    Node_1["1: NodeType.VARIABLE - _currentPoolStatus = poolVariables.loanStatus"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - _poolFactory = IPoolFactory(poolFactory)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - require(bool,string)(_currentPoolStatus == LoanStatus.ACTIVE,LP1)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - require(bool,string)(IRepayment(_poolFactory.repaymentImpl()).didBorrowerDefault(address(this)),LP2)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - poolVariables.loanStatus = LoanStatus.DEFAULTED"]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - _collateralAsset = poolConstants.collateralAsset"]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - _borrowAsset = poolConstants.borrowAsset"]
    Node_7 --> Node_8
    Node_8["8: NodeType.VARIABLE - _collateralLiquidityShare = poolVariables.baseLiquidityShares.add(poolVariables.extraLiquidityShares)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.VARIABLE - _poolSavingsStrategy = poolConstants.poolSavingsStrategy"]
    Node_9 --> Node_10
    Node_10["10: NodeType.VARIABLE - _collateralTokens = _collateralLiquidityShare"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - _collateralTokens = IYield(_poolSavingsStrategy).getTokensForShares(_collateralLiquidityShare,_collateralAsset)"]
    Node_11 --> Node_12
    Node_12["12: NodeType.VARIABLE - _poolBorrowTokens = correspondingBorrowTokens(_collateralTokens,_poolFactory.priceOracle(),_poolFactory.liquidatorRewardFraction())"]
    Node_12 --> Node_13
    Node_13["13: NodeType.EXPRESSION - delete poolVariables.extraLiquidityShares"]
    Node_13 --> Node_14
    Node_14["14: NodeType.EXPRESSION - delete poolVariables.baseLiquidityShares"]
    Node_14 --> Node_15
    Node_15["15: NodeType.EXPRESSION - _deposit(_fromSavingsAccount,false,_borrowAsset,_poolBorrowTokens,_poolFactory.noStrategyAddress(),msg.sender,address(this))"]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - _withdraw(_toSavingsAccount,_recieveLiquidityShare,_collateralAsset,_poolSavingsStrategy,_collateralTokens)"]
    Node_16 --> Node_17
    Node_17["17: NodeType.EXPRESSION - PoolLiquidated(msg.sender)"]
    Node_18["18: NodeType.EXPRESSION - nonReentrant()"]
    Node_18 --> Node_1
```

### Source Mapping
Declared in: `contracts/Pool/Pool.sol` on lines **735** to **765**

```solidity
    function liquidatePool(
        bool _fromSavingsAccount,
        bool _toSavingsAccount,
        bool _recieveLiquidityShare
    ) external payable nonReentrant {
        LoanStatus _currentPoolStatus = poolVariables.loanStatus;
        IPoolFactory _poolFactory = IPoolFactory(poolFactory);
        require(_currentPoolStatus == LoanStatus.ACTIVE, 'LP1');
        require(IRepayment(_poolFactory.repaymentImpl()).didBorrowerDefault(address(this)), 'LP2');
        poolVariables.loanStatus = LoanStatus.DEFAULTED;

        address _collateralAsset = poolConstants.collateralAsset;
        address _borrowAsset = poolConstants.borrowAsset;
        uint256 _collateralLiquidityShare = poolVariables.baseLiquidityShares.add(poolVariables.extraLiquidityShares);
        address _poolSavingsStrategy = poolConstants.poolSavingsStrategy;

        uint256 _collateralTokens = _collateralLiquidityShare;
        _collateralTokens = IYield(_poolSavingsStrategy).getTokensForShares(_collateralLiquidityShare, _collateralAsset);

        uint256 _poolBorrowTokens = correspondingBorrowTokens(
            _collateralTokens,
            _poolFactory.priceOracle(),
            _poolFactory.liquidatorRewardFraction()
        );
        delete poolVariables.extraLiquidityShares;
        delete poolVariables.baseLiquidityShares;

        _deposit(_fromSavingsAccount, false, _borrowAsset, _poolBorrowTokens, _poolFactory.noStrategyAddress(), msg.sender, address(this));
        _withdraw(_toSavingsAccount, _recieveLiquidityShare, _collateralAsset, _poolSavingsStrategy, _collateralTokens);
        emit PoolLiquidated(msg.sender);
    }

```
