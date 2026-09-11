# Context: AaveYield.unlockShares

**Contract:** `AaveYield` (Inherits: ReentrancyGuard, OwnableUpgradeable, ContextUpgradeable, Initializable, IYield)
**Signature:** `unlockShares(address,uint256) returns (uint256)`
**Method Selector ID:** `0x76467da0`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlySavingsAccount`
  ```solidity
  modifier onlySavingsAccount() {
          require(_msgSender() == savingsAccount, 'Invest: Only savings account can invoke');
          _;
      }
  ```
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

### State Variables Interaction
- **Reads:** savingsAccount
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(asset != address(0),Asset address cannot be address(0))`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeERC20.LIBRARY_CALL, dest:SafeERC20, function:SafeERC20.safeTransfer(IERC20,address,uint256), arguments:['TMP_3513', 'savingsAccount', 'amount'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_8
    Node_1["1: NodeType.IF - amount == 0"]
    Node_1 --> Node_2
    Node_1 --> Node_3
    Node_2["2: NodeType.RETURN - 0"]
    Node_3["3: NodeType.ENDIF - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - require(bool,string)(asset != address(0),Asset address cannot be address(0))"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - IERC20(asset).safeTransfer(savingsAccount,amount)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - UnlockedShares(asset,amount)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.RETURN - amount"]
    Node_8["8: NodeType.EXPRESSION - onlySavingsAccount()"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - nonReentrant()"]
    Node_9 --> Node_1
```

### Source Mapping
Declared in: `contracts/yield/AaveYield.sol` on lines **238** to **248**

```solidity
    function unlockShares(address asset, uint256 amount) external override onlySavingsAccount nonReentrant returns (uint256) {
        if (amount == 0) {
            return 0;
        }

        require(asset != address(0), 'Asset address cannot be address(0)');
        IERC20(asset).safeTransfer(savingsAccount, amount);

        emit UnlockedShares(asset, amount);
        return amount;
    }

```
