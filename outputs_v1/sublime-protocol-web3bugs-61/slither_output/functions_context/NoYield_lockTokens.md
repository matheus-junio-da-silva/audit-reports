# Context: NoYield.lockTokens

**Contract:** `NoYield` (Inherits: ReentrancyGuard, OwnableUpgradeable, ContextUpgradeable, Initializable, IYield)
**Signature:** `lockTokens(address,address,uint256) returns (uint256)`
**Method Selector ID:** `0x4767ceee`
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
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(amount != 0,Invest: amount)`
- require/assert: `require(bool,string)(msg.value == amount,Invest: ETH amount)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeERC20.LIBRARY_CALL, dest:SafeERC20, function:SafeERC20.safeTransferFrom(IERC20,address,address,uint256), arguments:['TMP_3805', 'user', 'TMP_3806', 'amount'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_8
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(amount != 0,Invest: amount)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.IF - asset != address(0)"]
    Node_2 --> Node_3
    Node_2 --> Node_4
    Node_3["3: NodeType.EXPRESSION - IERC20(asset).safeTransferFrom(user,address(this),amount)"]
    Node_3 --> Node_5
    Node_4["4: NodeType.EXPRESSION - require(bool,string)(msg.value == amount,Invest: ETH amount)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.ENDIF - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - sharesReceived = amount"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - LockedTokens(user,asset,sharesReceived)"]
    Node_7 --> Node_10
    Node_8["8: NodeType.EXPRESSION - onlySavingsAccount()"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - nonReentrant()"]
    Node_9 --> Node_1
    Node_10["10: NodeType.RETURN - sharesReceived"]
```

### Source Mapping
Declared in: `contracts/yield/NoYield.sol` on lines **93** to **106**

```solidity
    function lockTokens(
        address user,
        address asset,
        uint256 amount
    ) external payable override onlySavingsAccount nonReentrant returns (uint256 sharesReceived) {
        require(amount != 0, 'Invest: amount');
        if (asset != address(0)) {
            IERC20(asset).safeTransferFrom(user, address(this), amount);
        } else {
            require(msg.value == amount, 'Invest: ETH amount');
        }
        sharesReceived = amount;
        emit LockedTokens(user, asset, sharesReceived);
    }

```
