# Context: Pool.addCollateralInMarginCall

**Contract:** `Pool` (Inherits: ReentrancyGuard, IPool, ERC20PausableUpgradeable, PausableUpgradeable, ERC20Upgradeable, IERC20Upgradeable, ContextUpgradeable, Initializable)
**Signature:** `addCollateralInMarginCall(address,uint256,bool)`
**Method Selector ID:** `0xc145fe69`
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
- **Reads:** lenders, poolConstants, poolVariables
- **Writes:** lenders, poolVariables

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(poolVariables.loanStatus == LoanStatus.ACTIVE,ACMC1)`
- require/assert: `require(bool,string)(balanceOf(msg.sender) == 0,ACMC2)`
- require/assert: `require(bool,string)(getMarginCallEndTime(_lender) >= block.timestamp,ACMC3)`
- require/assert: `require(bool,string)(_amount != 0,ACMC4)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMathUpgradeable.TMP_1547(uint256) = LIBRARY_CALL, dest:SafeMathUpgradeable, function:SafeMathUpgradeable.add(uint256,uint256), arguments:['REF_602', '_sharesReceived'] `
- `SafeMathUpgradeable.TMP_1548(uint256) = LIBRARY_CALL, dest:SafeMathUpgradeable, function:SafeMathUpgradeable.add(uint256,uint256), arguments:['REF_607', '_sharesReceived'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_12
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(poolVariables.loanStatus == LoanStatus.ACTIVE,ACMC1)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(balanceOf(msg.sender) == 0,ACMC2)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - require(bool,string)(getMarginCallEndTime(_lender) >= block.timestamp,ACMC3)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - require(bool,string)(_amount != 0,ACMC4)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - _sharesReceived = _deposit(_transferFromSavingsAccount,true,poolConstants.collateralAsset,_amount,poolConstants.poolSavingsStrategy,msg.sender,address(this))"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - poolVariables.extraLiquidityShares = poolVariables.extraLiquidityShares.add(_sharesReceived)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - lenders(_lender).extraLiquidityShares = lenders(_lender).extraLiquidityShares.add(_sharesReceived)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.IF - getCurrentCollateralRatio(_lender) >= poolConstants.idealCollateralRatio"]
    Node_8 --> Node_9
    Node_8 --> Node_10
    Node_9["9: NodeType.EXPRESSION - delete lenders(_lender).marginCallEndTime"]
    Node_9 --> Node_10
    Node_10["10: NodeType.ENDIF - "]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - MarginCallCollateralAdded(msg.sender,_lender,_amount,_sharesReceived)"]
    Node_12["12: NodeType.EXPRESSION - nonReentrant()"]
    Node_12 --> Node_1
```

### Source Mapping
Declared in: `contracts/Pool/Pool.sol` on lines **275** to **305**

```solidity
    function addCollateralInMarginCall(
        address _lender,
        uint256 _amount,
        bool _transferFromSavingsAccount
    ) external payable override nonReentrant {
        require(poolVariables.loanStatus == LoanStatus.ACTIVE, 'ACMC1');
        require(balanceOf(msg.sender) == 0, 'ACMC2');
        require(getMarginCallEndTime(_lender) >= block.timestamp, 'ACMC3');

        require(_amount != 0, 'ACMC4');

        uint256 _sharesReceived = _deposit(
            _transferFromSavingsAccount,
            true,
            poolConstants.collateralAsset,
            _amount,
            poolConstants.poolSavingsStrategy,
            msg.sender,
            address(this)
        );

        poolVariables.extraLiquidityShares = poolVariables.extraLiquidityShares.add(_sharesReceived);

        lenders[_lender].extraLiquidityShares = lenders[_lender].extraLiquidityShares.add(_sharesReceived);

        if (getCurrentCollateralRatio(_lender) >= poolConstants.idealCollateralRatio) {
            delete lenders[_lender].marginCallEndTime;
        }

        emit MarginCallCollateralAdded(msg.sender, _lender, _amount, _sharesReceived);
    }

```
