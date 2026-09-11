# Context: EchidnaProxy.withdrawCollPrx

**Contract:** `EchidnaProxy` (Inherits: None)
**Signature:** `withdrawCollPrx(address[],uint256[],address,address)`
**Method Selector ID:** `0x4c1cce2f`
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
- `BorrowerOperations.HIGH_LEVEL_CALL, dest:borrowerOperations(BorrowerOperations), function:withdrawColl, arguments:['_collsOut', '_amountsOut', '_upperHint', '_lowerHint']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - borrowerOperations.withdrawColl(_collsOut,_amountsOut,_upperHint,_lowerHint)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TestContracts/EchidnaProxy.sol` on lines **86** to **88**

```solidity
    function withdrawCollPrx(address[] memory _collsOut, uint[] memory _amountsOut, address _upperHint, address _lowerHint) external {
        borrowerOperations.withdrawColl(_collsOut, _amountsOut, _upperHint, _lowerHint);
    }

```
