# Context: BorrowerOperationsScript.adjustTrove

**Contract:** `BorrowerOperationsScript` (Inherits: CheckContract)
**Signature:** `adjustTrove(address[],uint256[],address[],uint256[],uint256,bool,address,address,uint256)`
**Method Selector ID:** `0xc49f843a`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** borrowerOperations
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IBorrowerOperations.HIGH_LEVEL_CALL, dest:borrowerOperations(IBorrowerOperations), function:adjustTrove, arguments:['_collsIn', '_amountsIn', '_collsOut', '_amountsOut', '_YUSDChange', '_isDebtIncrease', '_upperHint', '_lowerHint', '_maxFeePercentage']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - borrowerOperations.adjustTrove(_collsIn,_amountsIn,_collsOut,_amountsOut,_YUSDChange,_isDebtIncrease,_upperHint,_lowerHint,_maxFeePercentage)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/Proxy/BorrowerOperationsScript.sol` on lines **47** to **59**

```solidity
    function adjustTrove(address[] memory _collsIn,
        uint[] memory _amountsIn,
        address[] memory _collsOut,
        uint[] memory _amountsOut,
        uint _YUSDChange,
        bool _isDebtIncrease,
        address _upperHint,
        address _lowerHint,
        uint _maxFeePercentage) external payable {
        borrowerOperations.adjustTrove(_collsIn,
            _amountsIn,
            _collsOut, _amountsOut, _YUSDChange, _isDebtIncrease, _upperHint, _lowerHint, _maxFeePercentage);
    }

```
