# Context: Repayments._updatePoolFactory

**Contract:** `Repayments` (Inherits: ReentrancyGuard, IRepayment, Initializable)
**Signature:** `_updatePoolFactory(address)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** poolFactory

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_poolFactory != address(0),0 address not allowed)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(_poolFactory != address(0),0 address not allowed)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - poolFactory = IPoolFactory(_poolFactory)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - PoolFactoryUpdated(_poolFactory)"]
```

### Source Mapping
Declared in: `contracts/Pool/Repayments.sol` on lines **115** to **119**

```solidity
    function _updatePoolFactory(address _poolFactory) internal {
        require(_poolFactory != address(0), '0 address not allowed');
        poolFactory = IPoolFactory(_poolFactory);
        emit PoolFactoryUpdated(_poolFactory);
    }

```
