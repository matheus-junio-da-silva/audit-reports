# Context: SublimeProxy.changeAdmin

**Contract:** `SublimeProxy` (Inherits: TransparentUpgradeableProxy, UpgradeableProxy, Proxy)
**Signature:** `changeAdmin(address)`
**Method Selector ID:** `0x8f283970`
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

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(newAdmin != address(0),TransparentUpgradeableProxy: new admin is the zero address)`

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
    Node_0 --> Node_4
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(newAdmin != address(0),TransparentUpgradeableProxy: new admin is the zero address)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - AdminChanged(_admin(),newAdmin)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - _setAdmin(newAdmin)"]
    Node_4["4: NodeType.EXPRESSION - ifAdmin()"]
    Node_4 --> Node_1
```

### Source Mapping
Declared in: `node_modules/@openzeppelin/contracts/proxy/TransparentUpgradeableProxy.sol` on lines **94** to **98**

```solidity
    function changeAdmin(address newAdmin) external virtual ifAdmin {
        require(newAdmin != address(0), "TransparentUpgradeableProxy: new admin is the zero address");
        emit AdminChanged(_admin(), newAdmin);
        _setAdmin(newAdmin);
    }

```
