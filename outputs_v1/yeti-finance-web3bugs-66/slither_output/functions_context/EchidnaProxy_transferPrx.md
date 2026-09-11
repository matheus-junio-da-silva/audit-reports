# Context: EchidnaProxy.transferPrx

**Contract:** `EchidnaProxy` (Inherits: None)
**Signature:** `transferPrx(address,uint256) returns (bool)`
**Method Selector ID:** `0x390b5f27`
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
- `YUSDToken.TMP_2024(bool) = HIGH_LEVEL_CALL, dest:yusdToken(YUSDToken), function:transfer, arguments:['recipient', 'amount']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.RETURN - yusdToken.transfer(recipient,amount)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TestContracts/EchidnaProxy.sol` on lines **130** to **132**

```solidity
    function transferPrx(address recipient, uint256 amount) external returns (bool) {
        return yusdToken.transfer(recipient, amount);
    }

```
