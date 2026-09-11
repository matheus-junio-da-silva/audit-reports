# Context: TroveManagerTester.callInternalRemoveTroveOwner

**Contract:** `TroveManagerTester` (Inherits: TroveManager, ReentrancyGuard, ITroveManager, TroveManagerBase, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `callInternalRemoveTroveOwner(address)`
**Method Selector ID:** `0xdc62a702`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

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
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TestContracts/CDPManagerTester.sol` on lines **64** to **67**

```solidity
    function callInternalRemoveTroveOwner(address _troveOwner) external {
        // uint troveOwnersArrayLength = getTroveOwnersCount();
        // _removeTroveOwner(_troveOwner, troveOwnersArrayLength);
    }

```
