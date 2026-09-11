# Context: CreditLine.request

**Contract:** `CreditLine` (Inherits: OwnableUpgradeable, ContextUpgradeable, Initializable, ReentrancyGuard)
**Signature:** `request(address,uint256,uint256,bool,uint256,address,address,bool) returns (uint256)`
**Method Selector ID:** `0x1c1e0e58`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** priceOracle
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_borrowAsset != _collateralAsset,R: cant borrow lent token)`
- require/assert: `require(bool,string)(IPriceOracle(priceOracle).doesFeedExist(_borrowAsset,_collateralAsset),R: No price feed)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IPriceOracle.TMP_1073(bool) = HIGH_LEVEL_CALL, dest:TMP_1072(IPriceOracle), function:doesFeedExist, arguments:['_borrowAsset', '_collateralAsset']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(_borrowAsset != _collateralAsset,R: cant borrow lent token)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(IPriceOracle(priceOracle).doesFeedExist(_borrowAsset,_collateralAsset),R: No price feed)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - _lender = _requestTo"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - _borrower = msg.sender"]
    Node_4 --> Node_5
    Node_5["5: NodeType.IF - _requestAsLender"]
    Node_5 --> Node_6
    Node_5 --> Node_8
    Node_6["6: NodeType.EXPRESSION - _lender = msg.sender"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - _borrower = _requestTo"]
    Node_7 --> Node_8
    Node_8["8: NodeType.ENDIF - "]
    Node_8 --> Node_9
    Node_9["9: NodeType.VARIABLE - _id = _createRequest(_lender,_borrower,_borrowLimit,_borrowRate,_autoLiquidation,_collateralRatio,_borrowAsset,_collateralAsset,_requestAsLender)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - CreditLineRequested(_id,_lender,_borrower)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.RETURN - _id"]
```

### Source Mapping
Declared in: `contracts/CreditLine/CreditLine.sol` on lines **526** to **560**

```solidity
    function request(
        address _requestTo,
        uint256 _borrowLimit,
        uint256 _borrowRate,
        bool _autoLiquidation,
        uint256 _collateralRatio,
        address _borrowAsset,
        address _collateralAsset,
        bool _requestAsLender
    ) external returns (uint256) {
        require(_borrowAsset != _collateralAsset, 'R: cant borrow lent token');
        require(IPriceOracle(priceOracle).doesFeedExist(_borrowAsset, _collateralAsset), 'R: No price feed');

        address _lender = _requestTo;
        address _borrower = msg.sender;
        if (_requestAsLender) {
            _lender = msg.sender;
            _borrower = _requestTo;
        }

        uint256 _id = _createRequest(
            _lender,
            _borrower,
            _borrowLimit,
            _borrowRate,
            _autoLiquidation,
            _collateralRatio,
            _borrowAsset,
            _collateralAsset,
            _requestAsLender
        );

        emit CreditLineRequested(_id, _lender, _borrower);
        return _id;
    }

```
