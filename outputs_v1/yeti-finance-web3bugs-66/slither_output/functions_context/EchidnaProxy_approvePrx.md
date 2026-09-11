# Context: EchidnaProxy.approvePrx

**Contract:** `EchidnaProxy` (Inherits: None)
**Signature:** `approvePrx(address,uint256) returns (bool)`
**Method Selector ID:** `0xcf83544f`
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
- `YUSDToken.TMP_2025(bool) = HIGH_LEVEL_CALL, dest:yusdToken(YUSDToken), function:increaseAllowance, arguments:['spender', 'amount']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.RETURN - yusdToken.increaseAllowance(spender,amount)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TestContracts/EchidnaProxy.sol` on lines **134** to **136**

```solidity
    function approvePrx(address spender, uint256 amount) external returns (bool) {
        return yusdToken.increaseAllowance(spender, amount);
    }

```
