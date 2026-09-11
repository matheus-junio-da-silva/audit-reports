# Context: EchidnaProxy.withdrawFromSPPrx

**Contract:** `EchidnaProxy` (Inherits: None)
**Signature:** `withdrawFromSPPrx(uint256)`
**Method Selector ID:** `0x641b09b6`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** stabilityPool
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `StabilityPool.HIGH_LEVEL_CALL, dest:stabilityPool(StabilityPool), function:withdrawFromSP, arguments:['_amount']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - stabilityPool.withdrawFromSP(_amount)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TestContracts/EchidnaProxy.sol` on lines **124** to **126**

```solidity
    function withdrawFromSPPrx(uint _amount) external {
        stabilityPool.withdrawFromSP(_amount);
    }

```
