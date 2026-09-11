# Context: BoringERC20.safeDecimals

**Contract:** `BoringERC20` (Inherits: None)
**Signature:** `safeDecimals(IERC20) returns (uint8)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** SIG_DECIMALS
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `low-level-call`

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - "]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - (success,data) = address(token).staticcall(abi.encodeWithSelector(SIG_DECIMALS))"]
    Node_3 --> Node_5
    Node_5["5: NodeType.IF - success && data.length == 32"]
    Node_5 --> Node_6
    Node_5 --> Node_7
    Node_6["6: NodeType.RETURN - abi.decode(data,(uint8))"]
    Node_7["7: NodeType.RETURN - 18"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/YETI/BoringCrypto/BoringERC20.sol` on lines **52** to **55**

```solidity
    function safeDecimals(IERC20 token) internal view returns (uint8) {
        (bool success, bytes memory data) = address(token).staticcall(abi.encodeWithSelector(SIG_DECIMALS));
        return success && data.length == 32 ? abi.decode(data, (uint8)) : 18;
    }

```
