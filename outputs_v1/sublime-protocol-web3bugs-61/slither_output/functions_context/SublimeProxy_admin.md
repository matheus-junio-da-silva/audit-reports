# Context: SublimeProxy.admin

**Contract:** `SublimeProxy` (Inherits: TransparentUpgradeableProxy, UpgradeableProxy, Proxy)
**Signature:** `admin() returns (address)`
**Method Selector ID:** `0xf851a440`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `ifAdmin`
  ```solidity
  modifier ifAdmin() {
          if (msg.sender == _admin()) {
              _;
          } else {
              _fallback();
          }
      }
  ```

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
    Node_0 --> Node_2
    Node_1["1: NodeType.EXPRESSION - admin_ = _admin()"]
    Node_1 --> Node_3
    Node_2["2: NodeType.EXPRESSION - ifAdmin()"]
    Node_2 --> Node_1
    Node_3["3: NodeType.RETURN - admin_"]
```

### Source Mapping
Declared in: `node_modules/@openzeppelin/contracts/proxy/TransparentUpgradeableProxy.sol` on lines **70** to **72**

```solidity
    function admin() external ifAdmin returns (address admin_) {
        admin_ = _admin();
    }

```
