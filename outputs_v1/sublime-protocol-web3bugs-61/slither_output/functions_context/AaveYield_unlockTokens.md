# Context: AaveYield.unlockTokens

**Contract:** `AaveYield` (Inherits: ReentrancyGuard, OwnableUpgradeable, ContextUpgradeable, Initializable, IYield)
**Signature:** `unlockTokens(address,uint256) returns (uint256)`
**Method Selector ID:** `0x9d564d9a`
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
- require/assert: `require(bool,string)(amount != 0,Invest: amount)`
- require/assert: `require(bool,string)(success,Transfer failed)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `low-level-call`
- `SafeERC20.LIBRARY_CALL, dest:SafeERC20, function:SafeERC20.safeTransfer(IERC20,address,uint256), arguments:['TMP_3504', 'savingsAccount', 'received'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_11
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(amount != 0,Invest: amount)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.IF - asset == address(0)"]
    Node_2 --> Node_3
    Node_2 --> Node_7
    Node_3["3: NodeType.EXPRESSION - received = _withdrawETH(amount)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - (success,None) = savingsAccount.call(value: received)()"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - require(bool,string)(success,Transfer failed)"]
    Node_6 --> Node_9
    Node_7["7: NodeType.EXPRESSION - received = _withdrawERC(asset,amount)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - IERC20(asset).safeTransfer(savingsAccount,received)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.ENDIF - "]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - UnlockedTokens(asset,received)"]
    Node_10 --> Node_13
    Node_11["11: NodeType.EXPRESSION - onlySavingsAccount()"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - nonReentrant()"]
    Node_12 --> Node_1
    Node_13["13: NodeType.RETURN - received"]
```

### Source Mapping
Declared in: `contracts/yield/AaveYield.sol` on lines **217** to **230**

```solidity
    function unlockTokens(address asset, uint256 amount) external override onlySavingsAccount nonReentrant returns (uint256 received) {
        require(amount != 0, 'Invest: amount');

        if (asset == address(0)) {
            received = _withdrawETH(amount);
            (bool success, ) = savingsAccount.call{value: received}('');
            require(success, 'Transfer failed');
        } else {
            received = _withdrawERC(asset, amount);
            IERC20(asset).safeTransfer(savingsAccount, received);
        }

        emit UnlockedTokens(asset, received);
    }

```
