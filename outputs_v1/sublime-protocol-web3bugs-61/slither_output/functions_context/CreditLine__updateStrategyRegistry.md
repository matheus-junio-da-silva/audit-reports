# Context: CreditLine._updateStrategyRegistry

**Contract:** `CreditLine` (Inherits: OwnableUpgradeable, ContextUpgradeable, Initializable, ReentrancyGuard)
**Signature:** `_updateStrategyRegistry(address)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** strategyRegistry

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_strategyRegistry != address(0),CL::I zero address)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(_strategyRegistry != address(0),CL::I zero address)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - strategyRegistry = _strategyRegistry"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - StrategyRegistryUpdated(_strategyRegistry)"]
```

### Source Mapping
Declared in: `contracts/CreditLine/CreditLine.sol` on lines **364** to **368**

```solidity
    function _updateStrategyRegistry(address _strategyRegistry) internal {
        require(_strategyRegistry != address(0), 'CL::I zero address');
        strategyRegistry = _strategyRegistry;
        emit StrategyRegistryUpdated(_strategyRegistry);
    }

```
