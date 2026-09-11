# Context: AaveYield.emergencyWithdraw

**Contract:** `AaveYield` (Inherits: ReentrancyGuard, OwnableUpgradeable, ContextUpgradeable, Initializable, IYield)
**Signature:** `emergencyWithdraw(address,address) returns (uint256)`
**Method Selector ID:** `0x6382d9ad`
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

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_wallet != address(0),cant burn)`
- require/assert: `require(bool,string)(success,Transfer failed)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IERC20.TMP_3476(uint256) = HIGH_LEVEL_CALL, dest:TMP_3474(IERC20), function:balanceOf, arguments:['TMP_3475']  `
- `SafeERC20.LIBRARY_CALL, dest:SafeERC20, function:SafeERC20.safeTransfer(IERC20,address,uint256), arguments:['TMP_3482', '_wallet', 'received'] `
- `low-level-call`

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_11
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(_wallet != address(0),cant burn)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - amount = IERC20(liquidityToken(_asset)).balanceOf(address(this))"]
    Node_2 --> Node_3
    Node_3["3: NodeType.IF - _asset == address(0)"]
    Node_3 --> Node_4
    Node_3 --> Node_8
    Node_4["4: NodeType.EXPRESSION - received = _withdrawETH(amount)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - (success,None) = _wallet.call(value: received)()"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - require(bool,string)(success,Transfer failed)"]
    Node_7 --> Node_10
    Node_8["8: NodeType.EXPRESSION - received = _withdrawERC(_asset,amount)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - IERC20(_asset).safeTransfer(_wallet,received)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.ENDIF - "]
    Node_10 --> Node_12
    Node_11["11: NodeType.EXPRESSION - onlyOwner()"]
    Node_11 --> Node_1
    Node_12["12: NodeType.RETURN - received"]
```

### Source Mapping
Declared in: `contracts/yield/AaveYield.sol` on lines **171** to **183**

```solidity
    function emergencyWithdraw(address _asset, address payable _wallet) external onlyOwner returns (uint256 received) {
        require(_wallet != address(0), 'cant burn');
        uint256 amount = IERC20(liquidityToken(_asset)).balanceOf(address(this));

        if (_asset == address(0)) {
            received = _withdrawETH(amount);
            (bool success, ) = _wallet.call{value: received}('');
            require(success, 'Transfer failed');
        } else {
            received = _withdrawERC(_asset, amount);
            IERC20(_asset).safeTransfer(_wallet, received);
        }
    }

```
