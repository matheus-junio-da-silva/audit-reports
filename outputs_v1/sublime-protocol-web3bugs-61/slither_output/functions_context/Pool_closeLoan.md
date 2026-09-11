# Context: Pool.closeLoan

**Contract:** `Pool` (Inherits: ReentrancyGuard, IPool, ERC20PausableUpgradeable, PausableUpgradeable, ERC20Upgradeable, IERC20Upgradeable, ContextUpgradeable, Initializable)
**Signature:** `closeLoan()`
**Method Selector ID:** `0x232fa733`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `nonReentrant`
  ```solidity
  modifier nonReentrant() {
          // On the first call to nonReentrant, _notEntered will be true
          require(_status != _ENTERED, "ReentrancyGuard: reentrant call");
  
          // Any calls to nonReentrant after this point will fail
          _status = _ENTERED;
  
          _;
  
          // By storing the original value once again, a refund is triggered (see
          // https://eips.ethereum.org/EIPS/eip-2200)
          _status = _NOT_ENTERED;
      }
  ```
- `onlyRepaymentImpl`
  ```solidity
  modifier onlyRepaymentImpl() {
          require(msg.sender == IPoolFactory(poolFactory).repaymentImpl(), 'OR1');
          _;
      }
  ```

### State Variables Interaction
- **Reads:** poolConstants, poolFactory, poolVariables
- **Writes:** poolVariables

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(poolVariables.loanStatus == LoanStatus.ACTIVE,CL1)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IPoolFactory.TMP_1734(address) = HIGH_LEVEL_CALL, dest:TMP_1733(IPoolFactory), function:extension, arguments:[]  `
- `IExtension.HIGH_LEVEL_CALL, dest:TMP_1735(IExtension), function:closePoolExtension, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_7
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(poolVariables.loanStatus == LoanStatus.ACTIVE,CL1)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - poolVariables.loanStatus = LoanStatus.CLOSED"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - IExtension(IPoolFactory(poolFactory).extension()).closePoolExtension()"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - _withdrawAllCollateral(poolConstants.borrower,0)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - _pause()"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - PoolClosed()"]
    Node_7["7: NodeType.EXPRESSION - nonReentrant()"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - onlyRepaymentImpl()"]
    Node_8 --> Node_1
```

### Source Mapping
Declared in: `contracts/Pool/Pool.sol` on lines **591** to **601**

```solidity
    function closeLoan() external payable override nonReentrant onlyRepaymentImpl {
        require(poolVariables.loanStatus == LoanStatus.ACTIVE, 'CL1');

        poolVariables.loanStatus = LoanStatus.CLOSED;

        IExtension(IPoolFactory(poolFactory).extension()).closePoolExtension();
        _withdrawAllCollateral(poolConstants.borrower, 0);
        _pause();

        emit PoolClosed();
    }

```
