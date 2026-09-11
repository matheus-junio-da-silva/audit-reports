# Context: EchidnaProxy.decreaseAllowancePrx

**Contract:** `EchidnaProxy` (Inherits: None)
**Signature:** `decreaseAllowancePrx(address,uint256) returns (bool)`
**Method Selector ID:** `0xd466e4eb`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** yusdToken
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `YUSDToken.TMP_2030(bool) = HIGH_LEVEL_CALL, dest:yusdToken(YUSDToken), function:decreaseAllowance, arguments:['spender', 'subtractedValue']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.RETURN - yusdToken.decreaseAllowance(spender,subtractedValue)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TestContracts/EchidnaProxy.sol` on lines **147** to **149**

```solidity
    function decreaseAllowancePrx(address spender, uint256 subtractedValue) external returns (bool) {
        return yusdToken.decreaseAllowance(spender, subtractedValue);
    }

```
