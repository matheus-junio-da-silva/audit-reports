# Context: WithdrawHandler.withdrawByStablecoin

**Contract:** `WithdrawHandler` (Inherits: IWithdrawHandler, FixedVaults, FixedStablecoins, Constants, Controllable, Ownable, Context)
**Signature:** `withdrawByStablecoin(bool,uint256,uint256,uint256)`
**Method Selector ID:** `0x9793869b`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** N_COINS, ctrl, emergencyHandler
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(index < N_COINS,!withdrawByStablecoin: invalid index)`
- require/assert: `require(bool,string)(lpAmount > 0,!minAmount)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IController.TMP_58(bool) = HIGH_LEVEL_CALL, dest:ctrl(IController), function:emergencyState, arguments:[]  `
- `IEmergencyHandler.HIGH_LEVEL_CALL, dest:emergencyHandler(IEmergencyHandler), function:emergencyWithdrawal, arguments:['msg.sender', 'pwrd', 'lpAmount', 'minAmount']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.IF - ctrl.emergencyState()"]
    Node_1 --> Node_2
    Node_1 --> Node_3
    Node_2["2: NodeType.EXPRESSION - emergencyHandler.emergencyWithdrawal(msg.sender,pwrd,lpAmount,minAmount)"]
    Node_2 --> Node_9
    Node_3["3: NodeType.EXPRESSION - require(bool,string)(index < N_COINS,!withdrawByStablecoin: invalid index)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - require(bool,string)(lpAmount > 0,!minAmount)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - minAmounts(index) = minAmount"]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - parameters = WithdrawParameter(msg.sender,pwrd,false,false,index,minAmounts,lpAmount)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - _withdraw(parameters)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.ENDIF - "]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/WithdrawHandler.sol` on lines **122** to **146**

```solidity
    function withdrawByStablecoin(
        bool pwrd,
        uint256 index,
        uint256 lpAmount,
        uint256 minAmount
    ) external override {
        if (ctrl.emergencyState()) {
            emergencyHandler.emergencyWithdrawal(msg.sender, pwrd, lpAmount, minAmount);
        } else {
            require(index < N_COINS, "!withdrawByStablecoin: invalid index");
            require(lpAmount > 0, "!minAmount");
            uint256[N_COINS] memory minAmounts;
            minAmounts[index] = minAmount;
            WithdrawParameter memory parameters = WithdrawParameter(
                msg.sender,
                pwrd,
                false,
                false,
                index,
                minAmounts,
                lpAmount
            );
            _withdraw(parameters);
        }
    }

```
