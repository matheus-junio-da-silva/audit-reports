# Context: YearnYield._updateSavingsAccount

**Contract:** `YearnYield` (Inherits: ReentrancyGuard, OwnableUpgradeable, ContextUpgradeable, Initializable, IYield)
**Signature:** `_updateSavingsAccount(address)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** savingsAccount

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_savingsAccount != address(0),Invest: zero address)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(_savingsAccount != address(0),Invest: zero address)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - savingsAccount = _savingsAccount"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - SavingsAccountUpdated(_savingsAccount)"]
```

### Source Mapping
Declared in: `contracts/yield/YearnYield.sol` on lines **68** to **72**

```solidity
    function _updateSavingsAccount(address payable _savingsAccount) internal {
        require(_savingsAccount != address(0), 'Invest: zero address');
        savingsAccount = _savingsAccount;
        emit SavingsAccountUpdated(_savingsAccount);
    }

```
