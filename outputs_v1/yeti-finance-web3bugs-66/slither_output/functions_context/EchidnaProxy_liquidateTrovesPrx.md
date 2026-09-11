# Context: EchidnaProxy.liquidateTrovesPrx

**Contract:** `EchidnaProxy` (Inherits: None)
**Signature:** `liquidateTrovesPrx(uint256)`
**Method Selector ID:** `0xf47a1ea7`
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
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TestContracts/EchidnaProxy.sol` on lines **38** to **42**

```solidity
    function liquidateTrovesPrx(uint _n) external {
        // pass
        // @KingYeti: we no longer have this function
//        troveManager.liquidateTroves(_n);
    }

```
