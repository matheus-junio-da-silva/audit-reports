# Context: BridgeMockup.setProxyL1Address

**Contract:** `BridgeMockup` (Inherits: None)
**Signature:** `setProxyL1Address(address)`
**Method Selector ID:** `0x7e3bcaab`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** oracleProxyMainnetAddress

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
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - oracleProxyMainnetAddress = _newAddress"]
```

### Source Mapping
Declared in: `contracts/mockups/BridgeMockup.sol` on lines **38** to **40**

```solidity
    function setProxyL1Address(address _newAddress) external {
        oracleProxyMainnetAddress = _newAddress;
    }

```
