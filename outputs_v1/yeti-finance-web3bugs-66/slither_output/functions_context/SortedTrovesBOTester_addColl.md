# Context: SortedTrovesBOTester.addColl

**Contract:** `SortedTrovesBOTester` (Inherits: BorrowerOperations, ReentrancyGuard, IBorrowerOperations, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `addColl(address[],uint256[],address,address,uint256)`
**Method Selector ID:** `0xe63ce3c0`
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
    Node_0 --> Node_11
    Node_1["1: NodeType.VARIABLE - "]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - params._collsIn = _collsIn"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - params._amountsIn = _amountsIn"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - params._upperHint = _upperHint"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - params._lowerHint = _lowerHint"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - params._maxFeePercentage = _maxFeePercentage"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - _requireValidDepositCollateral(_collsIn,params._amountsIn)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - _requireNoDuplicateColls(_collsIn)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - _transferCollateralsIntoActivePool(msg.sender,params._collsIn,params._amountsIn)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - _adjustTrove(params)"]
    Node_11["11: NodeType.EXPRESSION - nonReentrant()"]
    Node_11 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/BorrowerOperations.sol` on lines **456** to **477**

```solidity
    function addColl(
        address[] calldata _collsIn,
        uint256[] calldata _amountsIn,
        address _upperHint,
        address _lowerHint, 
        uint256 _maxFeePercentage
    ) external override nonReentrant {
        AdjustTrove_Params memory params;
        params._collsIn = _collsIn;
        params._amountsIn = _amountsIn;
        params._upperHint = _upperHint;
        params._lowerHint = _lowerHint;
        params._maxFeePercentage = _maxFeePercentage;

        // check that all _collsIn collateral types are in the whitelist
        _requireValidDepositCollateral(_collsIn, params._amountsIn);
        _requireNoDuplicateColls(_collsIn); // Check that there is no overlap with in or out in itself

        // pull in deposit collateral
        _transferCollateralsIntoActivePool(msg.sender, params._collsIn, params._amountsIn);
        _adjustTrove(params);
    }

```
