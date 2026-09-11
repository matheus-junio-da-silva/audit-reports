# Context: CreditLine.liquidate

**Contract:** `CreditLine` (Inherits: OwnableUpgradeable, ContextUpgradeable, Initializable, ReentrancyGuard)
**Signature:** `liquidate(uint256,bool)`
**Method Selector ID:** `0x2758db0c`
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
- **Reads:** creditLineConstants, creditLineVariables
- **Writes:** creditLineVariables

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(creditLineVariables[_id].status == CreditLineStatus.ACTIVE,CreditLine: Credit line should be active.)`
- require/assert: `require(bool,string)(creditLineVariables[_id].principal != 0,CreditLine: cannot liquidate if principal is 0)`
- require/assert: `require(bool,string)(currentCollateralRatio < creditLineConstants[_id].idealCollateralRatio,CreditLine: Collateral ratio is higher than ideal value)`
- require/assert: `require(bool,string)(success,Transfer fail)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_1309(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256,string), arguments:['msg.value', '_borrowTokens', 'Insufficient ETH to liquidate'] `
- `SafeERC20.LIBRARY_CALL, dest:SafeERC20, function:SafeERC20.safeTransferFrom(IERC20,address,address,uint256), arguments:['TMP_1312', 'msg.sender', '_lender', '_borrowTokens'] `
- `low-level-call`

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_24
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(creditLineVariables(_id).status == CreditLineStatus.ACTIVE,CreditLine: Credit line should be active.)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(creditLineVariables(_id).principal != 0,CreditLine: cannot liquidate if principal is 0)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - currentCollateralRatio = calculateCurrentCollateralRatio(_id)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - require(bool,string)(currentCollateralRatio < creditLineConstants(_id).idealCollateralRatio,CreditLine: Collateral ratio is higher than ideal value)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - _collateralAsset = creditLineConstants(_id).collateralAsset"]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - _lender = creditLineConstants(_id).lender"]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - _totalCollateralTokens = calculateTotalCollateralTokens(_id)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.VARIABLE - _borrowAsset = creditLineConstants(_id).borrowAsset"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - creditLineVariables(_id).status = CreditLineStatus.LIQUIDATED"]
    Node_9 --> Node_10
    Node_10["10: NodeType.IF - creditLineConstants(_id).autoLiquidation && _lender != msg.sender"]
    Node_10 --> Node_11
    Node_10 --> Node_21
    Node_11["11: NodeType.VARIABLE - _borrowTokens = _borrowTokensToLiquidate(_borrowAsset,_collateralAsset,_totalCollateralTokens)"]
    Node_11 --> Node_12
    Node_12["12: NodeType.IF - _borrowAsset == address(0)"]
    Node_12 --> Node_13
    Node_12 --> Node_19
    Node_13["13: NodeType.VARIABLE - _returnETH = msg.value.sub(_borrowTokens,Insufficient ETH to liquidate)"]
    Node_13 --> Node_14
    Node_14["14: NodeType.IF - _returnETH != 0"]
    Node_14 --> Node_15
    Node_14 --> Node_18
    Node_15["15: NodeType.VARIABLE - "]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - (success,None) = msg.sender.call(value: _returnETH)()"]
    Node_16 --> Node_17
    Node_17["17: NodeType.EXPRESSION - require(bool,string)(success,Transfer fail)"]
    Node_17 --> Node_18
    Node_18["18: NodeType.ENDIF - "]
    Node_18 --> Node_20
    Node_19["19: NodeType.EXPRESSION - IERC20(_borrowAsset).safeTransferFrom(msg.sender,_lender,_borrowTokens)"]
    Node_19 --> Node_20
    Node_20["20: NodeType.ENDIF - "]
    Node_20 --> Node_21
    Node_21["21: NodeType.ENDIF - "]
    Node_21 --> Node_22
    Node_22["22: NodeType.EXPRESSION - _transferCollateral(_id,_collateralAsset,_totalCollateralTokens,_toSavingsAccount)"]
    Node_22 --> Node_23
    Node_23["23: NodeType.EXPRESSION - CreditLineLiquidated(_id,msg.sender)"]
    Node_24["24: NodeType.EXPRESSION - nonReentrant()"]
    Node_24 --> Node_1
```

### Source Mapping
Declared in: `contracts/CreditLine/CreditLine.sol` on lines **996** to **1029**

```solidity
    function liquidate(uint256 _id, bool _toSavingsAccount) external payable nonReentrant {
        require(creditLineVariables[_id].status == CreditLineStatus.ACTIVE, 'CreditLine: Credit line should be active.');
        require(creditLineVariables[_id].principal != 0, 'CreditLine: cannot liquidate if principal is 0');

        uint256 currentCollateralRatio = calculateCurrentCollateralRatio(_id);
        require(
            currentCollateralRatio < creditLineConstants[_id].idealCollateralRatio,
            'CreditLine: Collateral ratio is higher than ideal value'
        );

        address _collateralAsset = creditLineConstants[_id].collateralAsset;
        address _lender = creditLineConstants[_id].lender;
        uint256 _totalCollateralTokens = calculateTotalCollateralTokens(_id);
        address _borrowAsset = creditLineConstants[_id].borrowAsset;

        creditLineVariables[_id].status = CreditLineStatus.LIQUIDATED;

        if (creditLineConstants[_id].autoLiquidation && _lender != msg.sender) {
            uint256 _borrowTokens = _borrowTokensToLiquidate(_borrowAsset, _collateralAsset, _totalCollateralTokens);
            if (_borrowAsset == address(0)) {
                uint256 _returnETH = msg.value.sub(_borrowTokens, 'Insufficient ETH to liquidate');
                if (_returnETH != 0) {
                    (bool success, ) = msg.sender.call{value: _returnETH}('');
                    require(success, 'Transfer fail');
                }
            } else {
                IERC20(_borrowAsset).safeTransferFrom(msg.sender, _lender, _borrowTokens);
            }
        }

        _transferCollateral(_id, _collateralAsset, _totalCollateralTokens, _toSavingsAccount);

        emit CreditLineLiquidated(_id, msg.sender);
    }

```
