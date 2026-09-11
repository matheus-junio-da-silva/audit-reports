# Context: YearnYield.initialize

**Contract:** `YearnYield` (Inherits: ReentrancyGuard, OwnableUpgradeable, ContextUpgradeable, Initializable, IYield)
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
    Node_1["1: NodeType.EXPRESSION - __Ownable_init()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - super.transferOwnership(_owner)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - _updateSavingsAccount(_savingsAccount)"]
    Node_4["4: NodeType.EXPRESSION - initializer()"]
    Node_4 --> Node_1
```

### Source Mapping
Declared in: `contracts/yield/YearnYield.sol` on lines **52** to **57**

```solidity
    function initialize(address _owner, address payable _savingsAccount) external initializer {
        __Ownable_init();
        super.transferOwnership(_owner);

        _updateSavingsAccount(_savingsAccount);
    }

```
