# Context: SortedTrovesBOTester._triggerBorrowingFee

**Contract:** `SortedTrovesBOTester` (Inherits: BorrowerOperations, ReentrancyGuard, IBorrowerOperations, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `_triggerBorrowingFee(ITroveManager,IYUSDToken,uint256,uint256,uint256) returns (uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** sYETIAddress
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `ITroveManager.HIGH_LEVEL_CALL, dest:_troveManager(ITroveManager), function:decayBaseRateFromBorrowing, arguments:[]  `
- `IYUSDToken.HIGH_LEVEL_CALL, dest:_yusdToken(IYUSDToken), function:mint, arguments:['sYETIAddress', 'YUSDFee']  `
- `ITroveManager.TMP_1016(uint256) = HIGH_LEVEL_CALL, dest:_troveManager(ITroveManager), function:getBorrowingFee, arguments:['_YUSDAmount']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - _troveManager.decayBaseRateFromBorrowing()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - YUSDFee = _troveManager.getBorrowingFee(_YUSDAmount)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - _requireUserAcceptsFee(YUSDFee,_maxFeePercentageFactor,_maxFeePercentage)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - _yusdToken.mint(sYETIAddress,YUSDFee)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.RETURN - YUSDFee"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/BorrowerOperations.sol` on lines **1059** to **1074**

```solidity
    function _triggerBorrowingFee(
        ITroveManager _troveManager,
        IYUSDToken _yusdToken,
        uint256 _YUSDAmount,
        uint256 _maxFeePercentageFactor,
        uint256 _maxFeePercentage
    ) internal returns (uint256) {
        _troveManager.decayBaseRateFromBorrowing(); // decay the baseRate state variable
        uint256 YUSDFee = _troveManager.getBorrowingFee(_YUSDAmount);

        _requireUserAcceptsFee(YUSDFee, _maxFeePercentageFactor, _maxFeePercentage);

        // Send fee to sYETI contract
        _yusdToken.mint(sYETIAddress, YUSDFee);
        return YUSDFee;
    }

```
