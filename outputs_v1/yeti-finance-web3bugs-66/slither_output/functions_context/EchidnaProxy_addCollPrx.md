# Context: EchidnaProxy.addCollPrx

**Contract:** `EchidnaProxy` (Inherits: None)
**Signature:** `addCollPrx(address[],uint256[],address,address,uint256)`
**Method Selector ID:** `0xaf7902b1`
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
- `BorrowerOperations.HIGH_LEVEL_CALL, dest:borrowerOperations(BorrowerOperations), function:addColl, arguments:['_collsIn', '_amountsIn', '_upperHint', '_lowerHint', '_maxFeePercentage']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - borrowerOperations.addColl(_collsIn,_amountsIn,_upperHint,_lowerHint,_maxFeePercentage)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TestContracts/EchidnaProxy.sol` on lines **82** to **84**

```solidity
    function addCollPrx(address[] memory _collsIn, uint[] memory _amountsIn, address _upperHint, address _lowerHint, uint _maxFeePercentage) external payable {
        borrowerOperations.addColl(_collsIn, _amountsIn, _upperHint, _lowerHint, _maxFeePercentage);
    }

```
