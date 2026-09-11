# Context: LifeGuard3Pool.setDependencies

**Contract:** `LifeGuard3Pool` (Inherits: FixedStablecoins, Constants, Whitelist, Controllable, Ownable, Context, ILifeGuard)
**Signature:** `setDependencies()`
**Method Selector ID:** `0x7f185162`
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
- **Reads:** N_COINS, withdrawHandler
- **Writes:** depositHandler, insurance, withdrawHandler

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeERC20.LIBRARY_CALL, dest:SafeERC20, function:SafeERC20.safeApprove(IERC20,address,uint256), arguments:['TMP_160', 'withdrawHandler', 'TMP_161'] `
- `SafeERC20.LIBRARY_CALL, dest:SafeERC20, function:SafeERC20.safeApprove(IERC20,address,uint256), arguments:['TMP_153', 'withdrawHandler', 'TMP_154'] `
- `IController.TMP_168(address) = HIGH_LEVEL_CALL, dest:ctrl(IController), function:depositHandler, arguments:[]  `
- `IController.TMP_169(address) = HIGH_LEVEL_CALL, dest:ctrl(IController), function:insurance, arguments:[]  `
- `IController.TMP_157(address) = HIGH_LEVEL_CALL, dest:ctrl(IController), function:withdrawHandler, arguments:[]  `
- `SafeERC20.LIBRARY_CALL, dest:SafeERC20, function:SafeERC20.safeApprove(IERC20,address,uint256), arguments:['TMP_163', 'withdrawHandler', 'TMP_165'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_22
    Node_1["1: NodeType.VARIABLE - ctrl = _controller()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.IF - withdrawHandler != address(0)"]
    Node_2 --> Node_5
    Node_2 --> Node_10
    Node_3["3: NodeType.STARTLOOP - "]
    Node_3 --> Node_6
    Node_4["4: NodeType.ENDLOOP - "]
    Node_4 --> Node_10
    Node_5["5: NodeType.VARIABLE - i = 0"]
    Node_5 --> Node_3
    Node_6["6: NodeType.IFLOOP - i < N_COINS"]
    Node_6 --> Node_7
    Node_6 --> Node_4
    Node_7["7: NodeType.VARIABLE - coin = getToken(i)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - IERC20(coin).safeApprove(withdrawHandler,uint256(0))"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - i ++"]
    Node_9 --> Node_6
    Node_10["10: NodeType.ENDIF - "]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - withdrawHandler = ctrl.withdrawHandler()"]
    Node_11 --> Node_14
    Node_12["12: NodeType.STARTLOOP - "]
    Node_12 --> Node_15
    Node_13["13: NodeType.ENDLOOP - "]
    Node_13 --> Node_20
    Node_14["14: NodeType.VARIABLE - i_scope_0 = 0"]
    Node_14 --> Node_12
    Node_15["15: NodeType.IFLOOP - i_scope_0 < N_COINS"]
    Node_15 --> Node_16
    Node_15 --> Node_13
    Node_16["16: NodeType.VARIABLE - coin_scope_1 = getToken(i_scope_0)"]
    Node_16 --> Node_17
    Node_17["17: NodeType.EXPRESSION - IERC20(coin_scope_1).safeApprove(withdrawHandler,uint256(0))"]
    Node_17 --> Node_18
    Node_18["18: NodeType.EXPRESSION - IERC20(coin_scope_1).safeApprove(withdrawHandler,type()(uint256).max)"]
    Node_18 --> Node_19
    Node_19["19: NodeType.EXPRESSION - i_scope_0 ++"]
    Node_19 --> Node_15
    Node_20["20: NodeType.EXPRESSION - depositHandler = ctrl.depositHandler()"]
    Node_20 --> Node_21
    Node_21["21: NodeType.EXPRESSION - insurance = ctrl.insurance()"]
    Node_22["22: NodeType.EXPRESSION - onlyOwner()"]
    Node_22 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/pools/LifeGuard3Pool.sol` on lines **76** to **92**

```solidity
    function setDependencies() external onlyOwner {
        IController ctrl = _controller();
        if (withdrawHandler != address(0)) {
            for (uint256 i = 0; i < N_COINS; i++) {
                address coin = getToken(i);
                IERC20(coin).safeApprove(withdrawHandler, uint256(0));
            }
        }
        withdrawHandler = ctrl.withdrawHandler();
        for (uint256 i = 0; i < N_COINS; i++) {
            address coin = getToken(i);
            IERC20(coin).safeApprove(withdrawHandler, uint256(0));
            IERC20(coin).safeApprove(withdrawHandler, type(uint256).max);
        }
        depositHandler = ctrl.depositHandler();
        insurance = ctrl.insurance();
    }

```
