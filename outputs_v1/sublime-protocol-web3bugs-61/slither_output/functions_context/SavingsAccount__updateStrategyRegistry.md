# Context: SavingsAccount._updateStrategyRegistry

**Contract:** `SavingsAccount` (Inherits: ReentrancyGuard, OwnableUpgradeable, ContextUpgradeable, Initializable, ISavingsAccount)
**Signature:** `_updateStrategyRegistry(address)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** strategyRegistry

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_strategyRegistry != address(0),SavingsAccount::updateStrategyRegistry zero address)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(_strategyRegistry != address(0),SavingsAccount::updateStrategyRegistry zero address)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - strategyRegistry = _strategyRegistry"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - StrategyRegistryUpdated(_strategyRegistry)"]
```

### Source Mapping
Declared in: `contracts/SavingsAccount/SavingsAccount.sol` on lines **94** to **98**

```solidity
    function _updateStrategyRegistry(address _strategyRegistry) internal {
        require(_strategyRegistry != address(0), 'SavingsAccount::updateStrategyRegistry zero address');
        strategyRegistry = _strategyRegistry;
        emit StrategyRegistryUpdated(_strategyRegistry);
    }

```
