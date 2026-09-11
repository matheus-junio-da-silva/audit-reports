# Context: Pool.liquidateForLender

**Contract:** `Pool` (Inherits: ReentrancyGuard, IPool, ERC20PausableUpgradeable, PausableUpgradeable, ERC20Upgradeable, IERC20Upgradeable, ContextUpgradeable, Initializable)
**Signature:** `liquidateForLender(address,bool,bool,bool)`
**Method Selector ID:** `0xbde5ef32`
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
- **Reads:** lenders, poolConstants
- **Writes:** lenders

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IYield.TMP_1879(uint256) = HIGH_LEVEL_CALL, dest:TMP_1878(IYield), function:getTokensForShares, arguments:['_lenderCollateralLPShare', 'REF_843']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_13
    Node_1["1: NodeType.EXPRESSION - _canLenderBeLiquidated(_lender)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - _poolSavingsStrategy = poolConstants.poolSavingsStrategy"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - (_lenderCollateralLPShare,_lenderBalance) = _updateLenderSharesDuringLiquidation(_lender)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - _lenderCollateralTokens = _lenderCollateralLPShare"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - _lenderCollateralTokens = IYield(_poolSavingsStrategy).getTokensForShares(_lenderCollateralLPShare,poolConstants.collateralAsset)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - _liquidateForLender(_fromSavingsAccount,_lender,_lenderCollateralTokens)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.VARIABLE - _amountReceived = _withdraw(_toSavingsAccount,_recieveLiquidityShare,poolConstants.collateralAsset,_poolSavingsStrategy,_lenderCollateralTokens)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - _burn(_lender,_lenderBalance)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - delete lenders(_lender)"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - LenderLiquidated(msg.sender,_lender,_amountReceived)"]
    Node_13["13: NodeType.EXPRESSION - nonReentrant()"]
    Node_13 --> Node_1
```

### Source Mapping
Declared in: `contracts/Pool/Pool.sol` on lines **864** to **890**

```solidity
    function liquidateForLender(
        address _lender,
        bool _fromSavingsAccount,
        bool _toSavingsAccount,
        bool _recieveLiquidityShare
    ) external payable nonReentrant {
        _canLenderBeLiquidated(_lender);

        address _poolSavingsStrategy = poolConstants.poolSavingsStrategy;
        (uint256 _lenderCollateralLPShare, uint256 _lenderBalance) = _updateLenderSharesDuringLiquidation(_lender);

        uint256 _lenderCollateralTokens = _lenderCollateralLPShare;
        _lenderCollateralTokens = IYield(_poolSavingsStrategy).getTokensForShares(_lenderCollateralLPShare, poolConstants.collateralAsset);

        _liquidateForLender(_fromSavingsAccount, _lender, _lenderCollateralTokens);

        uint256 _amountReceived = _withdraw(
            _toSavingsAccount,
            _recieveLiquidityShare,
            poolConstants.collateralAsset,
            _poolSavingsStrategy,
            _lenderCollateralTokens
        );
        _burn(_lender, _lenderBalance);
        delete lenders[_lender];
        emit LenderLiquidated(msg.sender, _lender, _amountReceived);
    }

```
