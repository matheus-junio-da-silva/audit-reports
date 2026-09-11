# Context: PoolFactory.setImplementations

**Contract:** `PoolFactory` (Inherits: IPoolFactory, OwnableUpgradeable, ContextUpgradeable, Initializable)
**Signature:** `setImplementations(address,address,address,address,address,address,address)`
**Method Selector ID:** `0xcea2490c`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyOwner`
  ```solidity
  modifier onlyOwner() {
          require(owner() == _msgSender(), "Ownable: caller is not the owner");
          _;
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
    Node_0 --> Node_8
    Node_1["1: NodeType.EXPRESSION - _updatePoolLogic(_poolImpl)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - _updateRepaymentImpl(_repaymentImpl)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - _updateSavingsAccount(_savingsAccount)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - _updatedExtension(_extension)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - _updateUserRegistry(_userRegistry)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - _updateStrategyRegistry(_strategyRegistry)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - _updatePriceoracle(_priceOracle)"]
    Node_8["8: NodeType.EXPRESSION - onlyOwner()"]
    Node_8 --> Node_1
```

### Source Mapping
Declared in: `contracts/Pool/PoolFactory.sol` on lines **228** to **244**

```solidity
    function setImplementations(
        address _poolImpl,
        address _repaymentImpl,
        address _userRegistry,
        address _strategyRegistry,
        address _priceOracle,
        address _savingsAccount,
        address _extension
    ) external onlyOwner {
        _updatePoolLogic(_poolImpl);
        _updateRepaymentImpl(_repaymentImpl);
        _updateSavingsAccount(_savingsAccount);
        _updatedExtension(_extension);
        _updateUserRegistry(_userRegistry);
        _updateStrategyRegistry(_strategyRegistry);
        _updatePriceoracle(_priceOracle);
    }

```
