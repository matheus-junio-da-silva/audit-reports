# Context: BorrowerOperations.withdrawCollUnleverUp

**Contract:** `BorrowerOperations` (Inherits: ReentrancyGuard, IBorrowerOperations, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `withdrawCollUnleverUp(address[],uint256[],uint256[],uint256,address,address)`
**Method Selector ID:** `0xe449ca80`
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
- None

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_13
    Node_1["1: NodeType.EXPRESSION - _requireValidDepositCollateral(_collsOut,_amountsOut)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - _requireNoDuplicateColls(_collsOut)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - _requireLengthsEqual(_amountsOut.length,_maxSlippages.length)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - params._collsOut = _collsOut"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - params._amountsOut = _amountsOut"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - params._maxSlippages = _maxSlippages"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - params._YUSDChange = _YUSDAmount"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - params._upperHint = _upperHint"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - params._lowerHint = _lowerHint"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - params._isUnlever = true"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - _adjustTrove(params)"]
    Node_13["13: NodeType.EXPRESSION - nonReentrant()"]
    Node_13 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/BorrowerOperations.sol` on lines **856** to **879**

```solidity
    function withdrawCollUnleverUp(
        address[] calldata _collsOut,
        uint256[] calldata _amountsOut,
        uint256[] calldata _maxSlippages,
        uint256 _YUSDAmount,
        address _upperHint,
        address _lowerHint
        ) external override nonReentrant {
        // check that all _collsOut collateral types are in the whitelist
        _requireValidDepositCollateral(_collsOut, _amountsOut);
        _requireNoDuplicateColls(_collsOut); // Check that there is no overlap with out in itself
        _requireLengthsEqual(_amountsOut.length, _maxSlippages.length);

        AdjustTrove_Params memory params; 
        params._collsOut = _collsOut;
        params._amountsOut = _amountsOut;
        params._maxSlippages = _maxSlippages;
        params._YUSDChange = _YUSDAmount;
        params._upperHint = _upperHint;
        params._lowerHint = _lowerHint;
        params._isUnlever = true;

        _adjustTrove(params);
    }

```
