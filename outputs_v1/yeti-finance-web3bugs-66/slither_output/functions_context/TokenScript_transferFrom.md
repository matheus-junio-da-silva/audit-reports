# Context: TokenScript.transferFrom

**Contract:** `TokenScript` (Inherits: CheckContract)
**Signature:** `transferFrom(address,address,uint256) returns (bool)`
**Method Selector ID:** `0x23b872dd`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** token
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IERC20.TMP_15(bool) = HIGH_LEVEL_CALL, dest:token(IERC20), function:transferFrom, arguments:['sender', 'recipient', 'amount']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - token.transferFrom(sender,recipient,amount)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/Proxy/TokenScript.sol` on lines **31** to **33**

```solidity
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool) {
        token.transferFrom(sender, recipient, amount);
    }

```
