# Context: SortedTrovesBOTester.addCollLeverUp

**Contract:** `SortedTrovesBOTester` (Inherits: BorrowerOperations, ReentrancyGuard, IBorrowerOperations, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `addCollLeverUp(address[],uint256[],uint256[],uint256[],uint256,address,address,uint256)`
**Method Selector ID:** `0xf7f7b912`
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
- `SafeMath.TMP_848(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['totalYUSDDebtFromLever', 'additionalYUSDDebt'] `
- `SafeMath.TMP_847(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['additionalTokenAmount', 'REF_977'] `
- `SafeMath.TMP_850(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['_YUSDAmount', 'totalYUSDDebtFromLever'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_32
    Node_1["1: NodeType.VARIABLE - "]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - params._upperHint = _upperHint"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - params._lowerHint = _lowerHint"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - params._maxFeePercentage = _maxFeePercentage"]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - collsLen = _collsIn.length"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - _requireValidDepositCollateral(_collsIn,_amountsIn)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - _requireLengthsEqual(collsLen,_leverages.length)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - _requireLengthsEqual(collsLen,_maxSlippages.length)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - _requireNoDuplicateColls(params._collsIn)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.VARIABLE - "]
    Node_10 --> Node_11
    Node_11["11: NodeType.VARIABLE - "]
    Node_11 --> Node_12
    Node_12["12: NodeType.VARIABLE - "]
    Node_12 --> Node_15
    Node_13["13: NodeType.STARTLOOP - "]
    Node_13 --> Node_16
    Node_14["14: NodeType.ENDLOOP - "]
    Node_14 --> Node_25
    Node_15["15: NodeType.VARIABLE - "]
    Node_15 --> Node_13
    Node_16["16: NodeType.IFLOOP - i < collsLen"]
    Node_16 --> Node_17
    Node_16 --> Node_14
    Node_17["17: NodeType.IF - _leverages(i) != 0"]
    Node_17 --> Node_18
    Node_17 --> Node_22
    Node_18["18: NodeType.EXPRESSION - (additionalTokenAmount,additionalYUSDDebt) = _singleLeverUp(_collsIn(i),_amountsIn(i),_leverages(i),_maxSlippages(i))"]
    Node_18 --> Node_19
    Node_19["19: NodeType.EXPRESSION - _singleTransferCollateralIntoActivePool(msg.sender,_collsIn(i),_amountsIn(i))"]
    Node_19 --> Node_20
    Node_20["20: NodeType.EXPRESSION - _amountsIn(i) = additionalTokenAmount.add(_amountsIn(i))"]
    Node_20 --> Node_21
    Node_21["21: NodeType.EXPRESSION - totalYUSDDebtFromLever = totalYUSDDebtFromLever.add(additionalYUSDDebt)"]
    Node_21 --> Node_23
    Node_22["22: NodeType.EXPRESSION - _singleTransferCollateralIntoActivePool(msg.sender,_collsIn(i),_amountsIn(i))"]
    Node_22 --> Node_23
    Node_23["23: NodeType.ENDIF - "]
    Node_23 --> Node_24
    Node_24["24: NodeType.EXPRESSION - ++ i"]
    Node_24 --> Node_16
    Node_25["25: NodeType.EXPRESSION - _YUSDAmount = _YUSDAmount.add(totalYUSDDebtFromLever)"]
    Node_25 --> Node_26
    Node_26["26: NodeType.EXPRESSION - params._totalYUSDDebtFromLever = totalYUSDDebtFromLever"]
    Node_26 --> Node_27
    Node_27["27: NodeType.EXPRESSION - params._YUSDChange = _YUSDAmount"]
    Node_27 --> Node_28
    Node_28["28: NodeType.EXPRESSION - params._isDebtIncrease = true"]
    Node_28 --> Node_29
    Node_29["29: NodeType.EXPRESSION - params._collsIn = _collsIn"]
    Node_29 --> Node_30
    Node_30["30: NodeType.EXPRESSION - params._amountsIn = _amountsIn"]
    Node_30 --> Node_31
    Node_31["31: NodeType.EXPRESSION - _adjustTrove(params)"]
    Node_32["32: NodeType.EXPRESSION - nonReentrant()"]
    Node_32 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/BorrowerOperations.sol` on lines **481** to **534**

```solidity
    function addCollLeverUp(
        address[] memory _collsIn,
        uint256[] memory _amountsIn,
        uint256[] memory _leverages,
        uint256[] memory _maxSlippages,
        uint256 _YUSDAmount,
        address _upperHint,
        address _lowerHint, 
        uint256 _maxFeePercentage
    ) external override nonReentrant {
        AdjustTrove_Params memory params;
        params._upperHint = _upperHint;
        params._lowerHint = _lowerHint;
        params._maxFeePercentage = _maxFeePercentage;
        uint256 collsLen = _collsIn.length;

        // check that all _collsIn collateral types are in the whitelist
        _requireValidDepositCollateral(_collsIn, _amountsIn);
        // Must check that other passed in arrays are correct length
        _requireLengthsEqual(collsLen, _leverages.length);
        _requireLengthsEqual(collsLen, _maxSlippages.length);
        _requireNoDuplicateColls(params._collsIn); // Check that there is no overlap with in or out in itself

        uint additionalTokenAmount;
        uint additionalYUSDDebt;
        uint totalYUSDDebtFromLever;
        for (uint256 i; i < collsLen; ++i) {
            if (_leverages[i] != 0) {
                (additionalTokenAmount, additionalYUSDDebt) = _singleLeverUp(
                    _collsIn[i],
                    _amountsIn[i],
                    _leverages[i],
                    _maxSlippages[i]
                );
                // Transfer into active pool, non levered amount. 
                _singleTransferCollateralIntoActivePool(msg.sender, _collsIn[i], _amountsIn[i]);
                // additional token amount was set to the original amount * leverage. 
                _amountsIn[i] = additionalTokenAmount.add(_amountsIn[i]);
                totalYUSDDebtFromLever = totalYUSDDebtFromLever.add(additionalYUSDDebt);
            } else {
                // Otherwise skip and do normal transfer that amount into active pool. 
                _singleTransferCollateralIntoActivePool(msg.sender, _collsIn[i], _amountsIn[i]);
            }
        }
        _YUSDAmount = _YUSDAmount.add(totalYUSDDebtFromLever);
        params._totalYUSDDebtFromLever = totalYUSDDebtFromLever;

        params._YUSDChange = _YUSDAmount;
        params._isDebtIncrease = true;

        params._collsIn = _collsIn;
        params._amountsIn = _amountsIn;
        _adjustTrove(params);
    }

```
