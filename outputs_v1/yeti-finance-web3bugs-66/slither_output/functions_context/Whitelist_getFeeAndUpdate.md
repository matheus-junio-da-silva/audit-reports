# Context: Whitelist.getFeeAndUpdate

**Contract:** `Whitelist` (Inherits: CheckContract, IBaseOracle, IWhitelist, Ownable)
**Signature:** `getFeeAndUpdate(address,uint256,uint256,uint256,uint256) returns (uint256)`
**Method Selector ID:** `0x8d3f8298`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `exists`
  ```solidity
  modifier exists(address _collateral) {
          _exists(_collateral);
          _;
      }
  ```

### State Variables Interaction
- **Reads:** borrowerOperationsAddress, collateralParams
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(msg.sender == borrowerOperationsAddress,caller must be BO)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IPriceCurve.TMP_361(uint256) = HIGH_LEVEL_CALL, dest:priceCurve(IPriceCurve), function:getFeeAndUpdate, arguments:['_collateralVCInput', '_collateralVCBalancePost', '_totalVCBalancePre', '_totalVCBalancePost']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_4
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(msg.sender == borrowerOperationsAddress,caller must be BO)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - priceCurve = IPriceCurve(collateralParams(_collateral).priceCurve)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.RETURN - priceCurve.getFeeAndUpdate(_collateralVCInput,_collateralVCBalancePost,_totalVCBalancePre,_totalVCBalancePost)"]
    Node_4["4: NodeType.EXPRESSION - exists(_collateral)"]
    Node_4 --> Node_1
    Node_5["5: NodeType.RETURN - fee"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/Dependencies/Whitelist.sol` on lines **327** to **346**

```solidity
    function getFeeAndUpdate(
        address _collateral,
        uint256 _collateralVCInput,
        uint256 _collateralVCBalancePost,
        uint256 _totalVCBalancePre,
        uint256 _totalVCBalancePost
    ) external override exists(_collateral) returns (uint256 fee) {
        require(
            msg.sender == borrowerOperationsAddress,
            "caller must be BO"
        );
        IPriceCurve priceCurve = IPriceCurve(collateralParams[_collateral].priceCurve);
        return
            priceCurve.getFeeAndUpdate(
                _collateralVCInput,
                _collateralVCBalancePost,
                _totalVCBalancePre,
                _totalVCBalancePost
            );
    }

```
