# Context: CreditLine.calculateBorrowableAmount

**Contract:** `CreditLine` (Inherits: OwnableUpgradeable, ContextUpgradeable, Initializable, ReentrancyGuard)
**Signature:** `calculateBorrowableAmount(uint256) returns (uint256)`
**Method Selector ID:** `0x6a46c1e1`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** creditLineConstants, creditLineVariables, priceOracle
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_status == CreditLineStatus.ACTIVE || _status == CreditLineStatus.REQUESTED,CreditLine: Cannot only if credit line ACTIVE or REQUESTED)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_1042(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['_maxPossible', '_currentDebt'] `
- `SafeMath.TMP_1035(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_1034', 'REF_186'] `
- `SafeMath.TMP_1037(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['TMP_1035', 'TMP_1036'] `
- `SafeMath.TMP_1034(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['_totalCollateralToken', '_ratioOfPrices'] `
- `IPriceOracle.TUPLE_8(uint256,uint256) = HIGH_LEVEL_CALL, dest:TMP_1031(IPriceOracle), function:getLatestPrice, arguments:['REF_180', 'REF_182']  `
- `SafeMath.TMP_1039(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_1037', 'TMP_1038'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - _status = creditLineVariables(_id).status"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(_status == CreditLineStatus.ACTIVE || _status == CreditLineStatus.REQUESTED,CreditLine: Cannot only if credit line ACTIVE or REQUESTED)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - (_ratioOfPrices,_decimals) = IPriceOracle(priceOracle).getLatestPrice(creditLineConstants(_id).collateralAsset,creditLineConstants(_id).borrowAsset)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - _totalCollateralToken = calculateTotalCollateralTokens(_id)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - _currentDebt = calculateCurrentDebt(_id)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.VARIABLE - _maxPossible = _totalCollateralToken.mul(_ratioOfPrices).div(creditLineConstants(_id).idealCollateralRatio).mul(10 ** 30).div(10 ** _decimals)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.VARIABLE - _borrowLimit = creditLineConstants(_id).borrowLimit"]
    Node_9 --> Node_10
    Node_10["10: NodeType.IF - _maxPossible > _borrowLimit"]
    Node_10 --> Node_11
    Node_10 --> Node_12
    Node_11["11: NodeType.EXPRESSION - _maxPossible = _borrowLimit"]
    Node_11 --> Node_12
    Node_12["12: NodeType.ENDIF - "]
    Node_12 --> Node_13
    Node_13["13: NodeType.IF - _maxPossible > _currentDebt"]
    Node_13 --> Node_14
    Node_13 --> Node_15
    Node_14["14: NodeType.RETURN - _maxPossible.sub(_currentDebt)"]
    Node_15["15: NodeType.ENDIF - "]
    Node_15 --> Node_16
    Node_16["16: NodeType.RETURN - 0"]
```

### Source Mapping
Declared in: `contracts/CreditLine/CreditLine.sol` on lines **436** to **464**

```solidity
    function calculateBorrowableAmount(uint256 _id) public returns (uint256) {
        CreditLineStatus _status = creditLineVariables[_id].status;
        require(
            _status == CreditLineStatus.ACTIVE || _status == CreditLineStatus.REQUESTED,
            'CreditLine: Cannot only if credit line ACTIVE or REQUESTED'
        );
        (uint256 _ratioOfPrices, uint256 _decimals) = IPriceOracle(priceOracle).getLatestPrice(
            creditLineConstants[_id].collateralAsset,
            creditLineConstants[_id].borrowAsset
        );

        uint256 _totalCollateralToken = calculateTotalCollateralTokens(_id);

        uint256 _currentDebt = calculateCurrentDebt(_id);

        uint256 _maxPossible = _totalCollateralToken.mul(_ratioOfPrices).div(creditLineConstants[_id].idealCollateralRatio).mul(10**30).div(
            10**_decimals
        );

        uint256 _borrowLimit = creditLineConstants[_id].borrowLimit;

        if (_maxPossible > _borrowLimit) {
            _maxPossible = _borrowLimit;
        }
        if (_maxPossible > _currentDebt) {
            return _maxPossible.sub(_currentDebt);
        }
        return 0;
    }

```
