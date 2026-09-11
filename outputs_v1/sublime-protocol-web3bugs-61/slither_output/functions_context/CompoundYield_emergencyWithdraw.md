# Context: CompoundYield.emergencyWithdraw

**Contract:** `CompoundYield` (Inherits: ReentrancyGuard, OwnableUpgradeable, ContextUpgradeable, Initializable, IYield)
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
- **Reads:** liquidityToken
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
- `low-level-call`
- `SafeERC20.LIBRARY_CALL, dest:SafeERC20, function:SafeERC20.safeTransfer(IERC20,address,uint256), arguments:['TMP_3651', '_wallet', 'received'] `
- `IERC20.TMP_3645(uint256) = HIGH_LEVEL_CALL, dest:TMP_3643(IERC20), function:balanceOf, arguments:['TMP_3644']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_12
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(_wallet != address(0),cant burn)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - investedTo = liquidityToken(_asset)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - amount = IERC20(investedTo).balanceOf(address(this))"]
    Node_3 --> Node_4
    Node_4["4: NodeType.IF - _asset == address(0)"]
    Node_4 --> Node_5
    Node_4 --> Node_9
    Node_5["5: NodeType.EXPRESSION - received = _withdrawETH(investedTo,amount)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - (success,None) = _wallet.call(value: received)()"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - require(bool,string)(success,Transfer failed)"]
    Node_8 --> Node_11
    Node_9["9: NodeType.EXPRESSION - received = _withdrawERC(_asset,investedTo,amount)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - IERC20(_asset).safeTransfer(_wallet,received)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.ENDIF - "]
    Node_11 --> Node_13
    Node_12["12: NodeType.EXPRESSION - onlyOwner()"]
    Node_12 --> Node_1
    Node_13["13: NodeType.RETURN - received"]
```

### Source Mapping
Declared in: `contracts/yield/CompoundYield.sol` on lines **92** to **105**

```solidity
    function emergencyWithdraw(address _asset, address payable _wallet) external onlyOwner returns (uint256 received) {
        require(_wallet != address(0), 'cant burn');
        address investedTo = liquidityToken[_asset];
        uint256 amount = IERC20(investedTo).balanceOf(address(this));

        if (_asset == address(0)) {
            received = _withdrawETH(investedTo, amount);
            (bool success, ) = _wallet.call{value: received}('');
            require(success, 'Transfer failed');
        } else {
            received = _withdrawERC(_asset, investedTo, amount);
            IERC20(_asset).safeTransfer(_wallet, received);
        }
    }

```
