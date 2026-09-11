# Context: AaveYield.lockTokens

**Contract:** `AaveYield` (Inherits: ReentrancyGuard, OwnableUpgradeable, ContextUpgradeable, Initializable, IYield)
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
- `SafeERC20.LIBRARY_CALL, dest:SafeERC20, function:SafeERC20.safeTransferFrom(IERC20,address,address,uint256), arguments:['TMP_3491', 'user', 'TMP_3492', 'amount'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_10
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(amount != 0,Invest: amount)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.IF - asset == address(0)"]
    Node_3 --> Node_4
    Node_3 --> Node_6
    Node_4["4: NodeType.EXPRESSION - require(bool,string)(msg.value == amount,Invest: ETH amount)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - (investedTo,sharesReceived) = _depositETH(amount)"]
    Node_5 --> Node_8
    Node_6["6: NodeType.EXPRESSION - IERC20(asset).safeTransferFrom(user,address(this),amount)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - (investedTo,sharesReceived) = _depositERC20(asset,amount)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.ENDIF - "]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - LockedTokens(user,investedTo,sharesReceived)"]
    Node_9 --> Node_12
    Node_10["10: NodeType.EXPRESSION - onlySavingsAccount()"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - nonReentrant()"]
    Node_11 --> Node_1
    Node_12["12: NodeType.RETURN - sharesReceived"]
```

### Source Mapping
Declared in: `contracts/yield/AaveYield.sol` on lines **192** to **209**

```solidity
    function lockTokens(
        address user,
        address asset,
        uint256 amount
    ) external payable override onlySavingsAccount nonReentrant returns (uint256 sharesReceived) {
        require(amount != 0, 'Invest: amount');

        address investedTo;
        if (asset == address(0)) {
            require(msg.value == amount, 'Invest: ETH amount');
            (investedTo, sharesReceived) = _depositETH(amount);
        } else {
            IERC20(asset).safeTransferFrom(user, address(this), amount);
            (investedTo, sharesReceived) = _depositERC20(asset, amount);
        }

        emit LockedTokens(user, investedTo, sharesReceived);
    }

```
