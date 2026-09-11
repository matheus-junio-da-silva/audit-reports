# Context: AdminVerifier.initialize

**Contract:** `AdminVerifier` (Inherits: OwnableUpgradeable, ContextUpgradeable, IVerifier, Initializable)
**Signature:** `initialize(address,address)`
**Method Selector ID:** `0x485cc955`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `initializer`
  ```solidity
  modifier initializer() {
          require(_initializing || _isConstructor() || !_initialized, "Initializable: contract is already initialized");
  
          bool isTopLevelCall = !_initializing;
          if (isTopLevelCall) {
              _initializing = true;
              _initialized = true;
          }
  
          _;
  
          if (isTopLevelCall) {
              _initializing = false;
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
    Node_0 --> Node_4
    Node_1["1: NodeType.EXPRESSION - super.__Ownable_init()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - super.transferOwnership(_admin)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - _updateVerification(_verification)"]
    Node_4["4: NodeType.EXPRESSION - initializer()"]
    Node_4 --> Node_1
```

### Source Mapping
Declared in: `contracts/Verification/adminVerifier.sol` on lines **28** to **32**

```solidity
    function initialize(address _admin, address _verification) external initializer {
        super.__Ownable_init();
        super.transferOwnership(_admin);
        _updateVerification(_verification);
    }

```
