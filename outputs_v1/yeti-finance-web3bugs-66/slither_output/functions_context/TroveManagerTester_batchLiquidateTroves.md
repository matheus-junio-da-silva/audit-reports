# Context: TroveManagerTester.batchLiquidateTroves

**Contract:** `TroveManagerTester` (Inherits: TroveManager, ReentrancyGuard, ITroveManager, TroveManagerBase, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `batchLiquidateTroves(address[],address)`
**Method Selector ID:** `0xe369e4ab`
**Visibility:** `external`
**Environment-Free:** `Yes`
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
- **Reads:** troveManagerLiquidations
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `ITroveManagerLiquidations.HIGH_LEVEL_CALL, dest:troveManagerLiquidations(ITroveManagerLiquidations), function:batchLiquidateTroves, arguments:['_troveArray', '_liquidator']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_2
    Node_1["1: NodeType.EXPRESSION - troveManagerLiquidations.batchLiquidateTroves(_troveArray,_liquidator)"]
    Node_2["2: NodeType.EXPRESSION - nonReentrant()"]
    Node_2 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TroveManager.sol` on lines **213** to **215**

```solidity
    function batchLiquidateTroves(address[] memory _troveArray, address _liquidator) external override nonReentrant {
        troveManagerLiquidations.batchLiquidateTroves(_troveArray, _liquidator);
    }

```
