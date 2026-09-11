# Context: CreditLine._createRequest

**Contract:** `CreditLine` (Inherits: OwnableUpgradeable, ContextUpgradeable, Initializable, ReentrancyGuard)
**Signature:** `_createRequest(address,address,uint256,uint256,bool,uint256,address,address,bool) returns (uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** creditLineConstants, creditLineCounter, creditLineVariables
- **Writes:** creditLineConstants, creditLineCounter, creditLineVariables

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_lender != _borrower,Lender and Borrower cannot be same addresses)`

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
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(_lender != _borrower,Lender and Borrower cannot be same addresses)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - _id = creditLineCounter + 1"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - creditLineCounter = _id"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - creditLineVariables(_id).status = CreditLineStatus.REQUESTED"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - creditLineConstants(_id).borrower = _borrower"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - creditLineConstants(_id).lender = _lender"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - creditLineConstants(_id).borrowLimit = _borrowLimit"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - creditLineConstants(_id).autoLiquidation = _autoLiquidation"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - creditLineConstants(_id).idealCollateralRatio = _collateralRatio"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - creditLineConstants(_id).borrowRate = _borrowRate"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - creditLineConstants(_id).borrowAsset = _borrowAsset"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - creditLineConstants(_id).collateralAsset = _collateralAsset"]
    Node_12 --> Node_13
    Node_13["13: NodeType.EXPRESSION - creditLineConstants(_id).requestByLender = _requestByLender"]
    Node_13 --> Node_14
    Node_14["14: NodeType.RETURN - _id"]
```

### Source Mapping
Declared in: `contracts/CreditLine/CreditLine.sol` on lines **562** to **587**

```solidity
    function _createRequest(
        address _lender,
        address _borrower,
        uint256 _borrowLimit,
        uint256 _borrowRate,
        bool _autoLiquidation,
        uint256 _collateralRatio,
        address _borrowAsset,
        address _collateralAsset,
        bool _requestByLender
    ) internal returns (uint256) {
        require(_lender != _borrower, 'Lender and Borrower cannot be same addresses');
        uint256 _id = creditLineCounter + 1;
        creditLineCounter = _id;
        creditLineVariables[_id].status = CreditLineStatus.REQUESTED;
        creditLineConstants[_id].borrower = _borrower;
        creditLineConstants[_id].lender = _lender;
        creditLineConstants[_id].borrowLimit = _borrowLimit;
        creditLineConstants[_id].autoLiquidation = _autoLiquidation;
        creditLineConstants[_id].idealCollateralRatio = _collateralRatio;
        creditLineConstants[_id].borrowRate = _borrowRate;
        creditLineConstants[_id].borrowAsset = _borrowAsset;
        creditLineConstants[_id].collateralAsset = _collateralAsset;
        creditLineConstants[_id].requestByLender = _requestByLender;
        return _id;
    }

```
