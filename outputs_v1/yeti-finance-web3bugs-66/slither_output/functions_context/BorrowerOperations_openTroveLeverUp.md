# Context: BorrowerOperations.openTroveLeverUp

**Contract:** `BorrowerOperations` (Inherits: ReentrancyGuard, IBorrowerOperations, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `openTroveLeverUp(uint256,uint256,address,address,address[],uint256[],uint256[],uint256[])`
**Method Selector ID:** `0x2eb5c5e4`
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
- **Reads:** None
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_147(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['additionalTokenAmount', 'REF_154'] `
- `SafeMath.TMP_150(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['_YUSDAmount', 'totalYUSDDebtFromLever'] `
- `SafeMath.TMP_148(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['totalYUSDDebtFromLever', 'additionalYUSDDebt'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_24
    Node_1["1: NodeType.VARIABLE - collsLen = _colls.length"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - _requireLengthNonzero(collsLen)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - _requireValidDepositCollateral(_colls,_amounts)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - _requireLengthsEqual(collsLen,_leverages.length)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - _requireLengthsEqual(collsLen,_maxSlippages.length)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - _requireNoDuplicateColls(_colls)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - "]
    Node_7 --> Node_8
    Node_8["8: NodeType.VARIABLE - "]
    Node_8 --> Node_9
    Node_9["9: NodeType.VARIABLE - "]
    Node_9 --> Node_12
    Node_10["10: NodeType.STARTLOOP - "]
    Node_10 --> Node_13
    Node_11["11: NodeType.ENDLOOP - "]
    Node_11 --> Node_22
    Node_12["12: NodeType.VARIABLE - "]
    Node_12 --> Node_10
    Node_13["13: NodeType.IFLOOP - i < collsLen"]
    Node_13 --> Node_14
    Node_13 --> Node_11
    Node_14["14: NodeType.IF - _leverages(i) != 0"]
    Node_14 --> Node_15
    Node_14 --> Node_19
    Node_15["15: NodeType.EXPRESSION - (additionalTokenAmount,additionalYUSDDebt) = _singleLeverUp(_colls(i),_amounts(i),_leverages(i),_maxSlippages(i))"]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - _singleTransferCollateralIntoActivePool(msg.sender,_colls(i),_amounts(i))"]
    Node_16 --> Node_17
    Node_17["17: NodeType.EXPRESSION - _amounts(i) = additionalTokenAmount.add(_amounts(i))"]
    Node_17 --> Node_18
    Node_18["18: NodeType.EXPRESSION - totalYUSDDebtFromLever = totalYUSDDebtFromLever.add(additionalYUSDDebt)"]
    Node_18 --> Node_20
    Node_19["19: NodeType.EXPRESSION - _singleTransferCollateralIntoActivePool(msg.sender,_colls(i),_amounts(i))"]
    Node_19 --> Node_20
    Node_20["20: NodeType.ENDIF - "]
    Node_20 --> Node_21
    Node_21["21: NodeType.EXPRESSION - ++ i"]
    Node_21 --> Node_13
    Node_22["22: NodeType.EXPRESSION - _YUSDAmount = _YUSDAmount.add(totalYUSDDebtFromLever)"]
    Node_22 --> Node_23
    Node_23["23: NodeType.EXPRESSION - _openTroveInternal(msg.sender,_maxFeePercentage,_YUSDAmount,totalYUSDDebtFromLever,_upperHint,_lowerHint,_colls,_amounts)"]
    Node_24["24: NodeType.EXPRESSION - nonReentrant()"]
    Node_24 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/BorrowerOperations.sol` on lines **261** to **311**

```solidity
    function openTroveLeverUp(
        uint256 _maxFeePercentage,
        uint256 _YUSDAmount,
        address _upperHint,
        address _lowerHint,
        address[] memory _colls,
        uint256[] memory _amounts, 
        uint256[] memory _leverages,
        uint256[] calldata _maxSlippages
    ) external override nonReentrant{
        uint256 collsLen = _colls.length;
        _requireLengthNonzero(collsLen);
        _requireValidDepositCollateral(_colls, _amounts);
        // Must check additional passed in arrays
        _requireLengthsEqual(collsLen, _leverages.length);
        _requireLengthsEqual(collsLen, _maxSlippages.length);
        _requireNoDuplicateColls(_colls);
        uint additionalTokenAmount;
        uint additionalYUSDDebt;
        uint totalYUSDDebtFromLever;
        for (uint256 i; i < collsLen; ++i) {
            if (_leverages[i] != 0) {
                (additionalTokenAmount, additionalYUSDDebt) = _singleLeverUp(
                    _colls[i],
                    _amounts[i],
                    _leverages[i],
                    _maxSlippages[i]
                );
                // Transfer into active pool, non levered amount. 
                _singleTransferCollateralIntoActivePool(msg.sender, _colls[i], _amounts[i]);
                // additional token amount was set to the original amount * leverage. 
                _amounts[i] = additionalTokenAmount.add(_amounts[i]);
                totalYUSDDebtFromLever = totalYUSDDebtFromLever.add(additionalYUSDDebt);
            } else {
                // Otherwise skip and do normal transfer that amount into active pool. 
                _singleTransferCollateralIntoActivePool(msg.sender, _colls[i], _amounts[i]);
            }
        }
        _YUSDAmount = _YUSDAmount.add(totalYUSDDebtFromLever);
        
        _openTroveInternal(
            msg.sender,
            _maxFeePercentage,
            _YUSDAmount,
            totalYUSDDebtFromLever,
            _upperHint,
            _lowerHint,
            _colls,
            _amounts
        );
    }

```
