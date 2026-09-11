# Context: DepositHandler._deposit

**Contract:** `DepositHandler` (Inherits: IDepositHandler, FixedVaults, FixedStablecoins, Constants, Controllable, Ownable, Context)
**Signature:** `_deposit(bool,uint256,uint256,uint256[3]) returns (uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `private`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** N_COINS, buoy, ctrl, feeToken, lg
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(dollarAmount >= buoy.lpToUsd(minAmount),!minAmount)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeERC20.LIBRARY_CALL, dest:SafeERC20, function:SafeERC20.safeTransferFrom(IERC20,address,address,uint256), arguments:['token', 'msg.sender', 'TMP_76', 'REF_36'] `
- `IBuoy.TMP_97(uint256) = HIGH_LEVEL_CALL, dest:buoy(IBuoy), function:lpToUsd, arguments:['minAmount']  `
- `SafeERC20.LIBRARY_CALL, dest:SafeERC20, function:SafeERC20.safeTransferFrom(IERC20,address,address,uint256), arguments:['token', 'msg.sender', 'TMP_81', 'REF_41'] `
- `IERC20.TMP_90(uint256) = HIGH_LEVEL_CALL, dest:token_scope_1(IERC20), function:balanceOf, arguments:['_vault']  `
- `IERC20.TMP_79(uint256) = HIGH_LEVEL_CALL, dest:token(IERC20), function:balanceOf, arguments:['TMP_78']  `
- `SafeERC20.LIBRARY_CALL, dest:SafeERC20, function:SafeERC20.safeTransferFrom(IERC20,address,address,uint256), arguments:['token_scope_1', 'msg.sender', '_vault', 'REF_51'] `
- `SafeERC20.LIBRARY_CALL, dest:SafeERC20, function:SafeERC20.safeTransferFrom(IERC20,address,address,uint256), arguments:['token_scope_1', 'msg.sender', '_vault', 'REF_46'] `
- `IBuoy.TMP_96(uint256) = HIGH_LEVEL_CALL, dest:buoy(IBuoy), function:stableToUsd, arguments:['inAmounts', 'True']  `
- `IERC20.TMP_92(uint256) = HIGH_LEVEL_CALL, dest:token_scope_1(IERC20), function:balanceOf, arguments:['_vault']  `
- `SafeMath.TMP_93(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['TMP_92', 'current_scope_2'] `
- `IERC20.TMP_75(uint256) = HIGH_LEVEL_CALL, dest:token(IERC20), function:balanceOf, arguments:['TMP_74']  `
- `SafeMath.TMP_80(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['TMP_79', 'current'] `
- `IController.TMP_69(bool) = HIGH_LEVEL_CALL, dest:ctrl(IController), function:isValidBigFish, arguments:['pwrd', 'True', 'roughUsd']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.IF - ctrl.isValidBigFish(pwrd,true,roughUsd)"]
    Node_1 --> Node_4
    Node_1 --> Node_19
    Node_2["2: NodeType.STARTLOOP - "]
    Node_2 --> Node_5
    Node_3["3: NodeType.ENDLOOP - "]
    Node_3 --> Node_16
    Node_4["4: NodeType.VARIABLE - i = 0"]
    Node_4 --> Node_2
    Node_5["5: NodeType.IFLOOP - i < N_COINS"]
    Node_5 --> Node_6
    Node_5 --> Node_3
    Node_6["6: NodeType.IF - inAmounts(i) > 0"]
    Node_6 --> Node_7
    Node_6 --> Node_14
    Node_7["7: NodeType.VARIABLE - token = IERC20(getToken(i))"]
    Node_7 --> Node_8
    Node_8["8: NodeType.IF - feeToken(i)"]
    Node_8 --> Node_9
    Node_8 --> Node_12
    Node_9["9: NodeType.VARIABLE - current = token.balanceOf(address(lg))"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - token.safeTransferFrom(msg.sender,address(lg),inAmounts(i))"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - inAmounts(i) = token.balanceOf(address(lg)).sub(current)"]
    Node_11 --> Node_13
    Node_12["12: NodeType.EXPRESSION - token.safeTransferFrom(msg.sender,address(lg),inAmounts(i))"]
    Node_12 --> Node_13
    Node_13["13: NodeType.ENDIF - "]
    Node_13 --> Node_14
    Node_14["14: NodeType.ENDIF - "]
    Node_14 --> Node_15
    Node_15["15: NodeType.EXPRESSION - i ++"]
    Node_15 --> Node_5
    Node_16["16: NodeType.EXPRESSION - dollarAmount = _invest(inAmounts,roughUsd)"]
    Node_16 --> Node_33
    Node_17["17: NodeType.STARTLOOP - "]
    Node_17 --> Node_20
    Node_18["18: NodeType.ENDLOOP - "]
    Node_18 --> Node_32
    Node_19["19: NodeType.VARIABLE - i_scope_0 = 0"]
    Node_19 --> Node_17
    Node_20["20: NodeType.IFLOOP - i_scope_0 < N_COINS"]
    Node_20 --> Node_21
    Node_20 --> Node_18
    Node_21["21: NodeType.IF - inAmounts(i_scope_0) > 0"]
    Node_21 --> Node_22
    Node_21 --> Node_30
    Node_22["22: NodeType.VARIABLE - token_scope_1 = IERC20(getToken(i_scope_0))"]
    Node_22 --> Node_23
    Node_23["23: NodeType.VARIABLE - _vault = getVault(i_scope_0)"]
    Node_23 --> Node_24
    Node_24["24: NodeType.IF - feeToken(i_scope_0)"]
    Node_24 --> Node_25
    Node_24 --> Node_28
    Node_25["25: NodeType.VARIABLE - current_scope_2 = token_scope_1.balanceOf(_vault)"]
    Node_25 --> Node_26
    Node_26["26: NodeType.EXPRESSION - token_scope_1.safeTransferFrom(msg.sender,_vault,inAmounts(i_scope_0))"]
    Node_26 --> Node_27
    Node_27["27: NodeType.EXPRESSION - inAmounts(i_scope_0) = token_scope_1.balanceOf(_vault).sub(current_scope_2)"]
    Node_27 --> Node_29
    Node_28["28: NodeType.EXPRESSION - token_scope_1.safeTransferFrom(msg.sender,_vault,inAmounts(i_scope_0))"]
    Node_28 --> Node_29
    Node_29["29: NodeType.ENDIF - "]
    Node_29 --> Node_30
    Node_30["30: NodeType.ENDIF - "]
    Node_30 --> Node_31
    Node_31["31: NodeType.EXPRESSION - i_scope_0 ++"]
    Node_31 --> Node_20
    Node_32["32: NodeType.EXPRESSION - dollarAmount = buoy.stableToUsd(inAmounts,true)"]
    Node_32 --> Node_33
    Node_33["33: NodeType.ENDIF - "]
    Node_33 --> Node_34
    Node_34["34: NodeType.EXPRESSION - require(bool,string)(dollarAmount >= buoy.lpToUsd(minAmount),!minAmount)"]
    Node_34 --> Node_35
    Node_35["35: NodeType.RETURN - dollarAmount"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/DepositHandler.sol` on lines **133** to **177**

```solidity
    function _deposit(
        bool pwrd,
        uint256 roughUsd,
        uint256 minAmount,
        uint256[N_COINS] memory inAmounts
    ) private returns (uint256 dollarAmount) {
        // If a large fish, transfer assets to lifeguard before determening what to do with them
        if (ctrl.isValidBigFish(pwrd, true, roughUsd)) {
            for (uint256 i = 0; i < N_COINS; i++) {
                // Transfer token to target (lifeguard)
                if (inAmounts[i] > 0) {
                    IERC20 token = IERC20(getToken(i));
                    if (feeToken[i]) {
                        // Separate logic for USDT
                        uint256 current = token.balanceOf(address(lg));
                        token.safeTransferFrom(msg.sender, address(lg), inAmounts[i]);
                        inAmounts[i] = token.balanceOf(address(lg)).sub(current);
                    } else {
                        token.safeTransferFrom(msg.sender, address(lg), inAmounts[i]);
                    }
                }
            }
            dollarAmount = _invest(inAmounts, roughUsd);
        } else {
            // If sardine, send the assets directly to the vault adapter
            for (uint256 i = 0; i < N_COINS; i++) {
                if (inAmounts[i] > 0) {
                    // Transfer token to vaultadaptor
                    IERC20 token = IERC20(getToken(i));
                    address _vault = getVault(i);
                    if (feeToken[i]) {
                        // Seperate logic for USDT
                        uint256 current = token.balanceOf(_vault);
                        token.safeTransferFrom(msg.sender, _vault, inAmounts[i]);
                        inAmounts[i] = token.balanceOf(_vault).sub(current);
                    } else {
                        token.safeTransferFrom(msg.sender, _vault, inAmounts[i]);
                    }
                }
            }
            // Establish USD vault of deposit
            dollarAmount = buoy.stableToUsd(inAmounts, true);
        }
        require(dollarAmount >= buoy.lpToUsd(minAmount), "!minAmount");
    }

```
