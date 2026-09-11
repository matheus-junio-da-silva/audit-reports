# Context: Pool.terminatePool

**Contract:** `Pool` (Inherits: ReentrancyGuard, IPool, ERC20PausableUpgradeable, PausableUpgradeable, ERC20Upgradeable, IERC20Upgradeable, ContextUpgradeable, Initializable)
**Signature:** `terminatePool()`
**Method Selector ID:** `0x45571276`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyOwner`
  ```solidity
  modifier onlyOwner() {
          require(msg.sender == IPoolFactory(poolFactory).owner(), 'OO1');
          _;
      }
  ```

### State Variables Interaction
- **Reads:** poolFactory, poolVariables
- **Writes:** poolVariables

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IExtension.HIGH_LEVEL_CALL, dest:TMP_1727(IExtension), function:closePoolExtension, arguments:[]  `
- `IPoolFactory.TMP_1726(address) = HIGH_LEVEL_CALL, dest:TMP_1725(IPoolFactory), function:extension, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_6
    Node_1["1: NodeType.EXPRESSION - _withdrawAllCollateral(msg.sender,0)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - _pause()"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - poolVariables.loanStatus = LoanStatus.TERMINATED"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - IExtension(IPoolFactory(poolFactory).extension()).closePoolExtension()"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - PoolTerminated()"]
    Node_6["6: NodeType.EXPRESSION - onlyOwner()"]
    Node_6 --> Node_1
```

### Source Mapping
Declared in: `contracts/Pool/Pool.sol` on lines **580** to **586**

```solidity
    function terminatePool() external onlyOwner {
        _withdrawAllCollateral(msg.sender, 0);
        _pause();
        poolVariables.loanStatus = LoanStatus.TERMINATED;
        IExtension(IPoolFactory(poolFactory).extension()).closePoolExtension();
        emit PoolTerminated();
    }

```
