# Context: AaveYield.initialize

**Contract:** `AaveYield` (Inherits: ReentrancyGuard, OwnableUpgradeable, ContextUpgradeable, Initializable, IYield)
**Signature:** `initialize(address,address,address,address,address)`
**Method Selector ID:** `0x1459457a`
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
    Node_0 --> Node_5
    Node_1["1: NodeType.EXPRESSION - __Ownable_init()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - super.transferOwnership(_owner)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - _updateSavingsAccount(_savingsAccount)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - _updateAaveAddresses(_wethGateway,_protocolDataProvider,_lendingPoolAddressesProvider)"]
    Node_5["5: NodeType.EXPRESSION - initializer()"]
    Node_5 --> Node_1
```

### Source Mapping
Declared in: `contracts/yield/AaveYield.sol` on lines **84** to **96**

```solidity
    function initialize(
        address _owner,
        address payable _savingsAccount,
        address _wethGateway,
        address _protocolDataProvider,
        address _lendingPoolAddressesProvider
    ) external initializer {
        __Ownable_init();
        super.transferOwnership(_owner);

        _updateSavingsAccount(_savingsAccount);
        _updateAaveAddresses(_wethGateway, _protocolDataProvider, _lendingPoolAddressesProvider);
    }

```
