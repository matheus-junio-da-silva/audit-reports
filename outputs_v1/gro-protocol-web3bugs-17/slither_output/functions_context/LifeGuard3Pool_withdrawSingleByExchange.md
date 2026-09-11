# Context: LifeGuard3Pool.withdrawSingleByExchange

**Contract:** `LifeGuard3Pool` (Inherits: FixedStablecoins, Constants, Whitelist, Controllable, Ownable, Context, ILifeGuard)
**Signature:** `withdrawSingleByExchange(uint256,uint256,address) returns (uint256, uint256)`
**Method Selector ID:** `0xd8c3e814`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** N_COINS, assets, buoy, withdrawHandler
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(msg.sender == withdrawHandler,withdrawSingleByExchange: !withdrawHandler)`
- require/assert: `require(bool)(balance >= minAmount)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_293(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['TMP_292', 'REF_102'] `
- `SafeMath.TMP_286(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['TMP_285', 'REF_99'] `
- `IERC20.TMP_285(uint256) = HIGH_LEVEL_CALL, dest:inCoin(IERC20), function:balanceOf, arguments:['TMP_284']  `
- `IERC20.TMP_297(uint256) = HIGH_LEVEL_CALL, dest:coin(IERC20), function:balanceOf, arguments:['TMP_296']  `
- `IERC20.TMP_276(uint256) = HIGH_LEVEL_CALL, dest:coin(IERC20), function:balanceOf, arguments:['TMP_275']  `
- `SafeERC20.LIBRARY_CALL, dest:SafeERC20, function:SafeERC20.safeTransfer(IERC20,address,uint256), arguments:['coin', 'recipient', 'balance'] `
- `SafeMath.TMP_298(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['TMP_297', 'REF_105'] `
- `SafeMath.TMP_277(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['TMP_276', 'REF_94'] `
- `IBuoy.TMP_299(uint256) = HIGH_LEVEL_CALL, dest:buoy(IBuoy), function:stableToUsd, arguments:['inAmounts_scope_0', 'False']  `
- `IBuoy.TMP_279(uint256) = HIGH_LEVEL_CALL, dest:buoy(IBuoy), function:stableToUsd, arguments:['inAmounts', 'False']  `
- `IERC20.TMP_292(uint256) = HIGH_LEVEL_CALL, dest:coin(IERC20), function:balanceOf, arguments:['TMP_291']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(msg.sender == withdrawHandler,withdrawSingleByExchange: !withdrawHandler)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - coin = IERC20(getToken(i))"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - balance = coin.balanceOf(address(this)).sub(assets(i))"]
    Node_3 --> Node_4
    Node_4["4: NodeType.IF - minAmount <= balance"]
    Node_4 --> Node_5
    Node_4 --> Node_10
    Node_5["5: NodeType.VARIABLE - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - inAmounts(i) = balance"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - usdAmount = buoy.stableToUsd(inAmounts,false)"]
    Node_7 --> Node_28
    Node_8["8: NodeType.STARTLOOP - "]
    Node_8 --> Node_11
    Node_9["9: NodeType.ENDLOOP - "]
    Node_9 --> Node_24
    Node_10["10: NodeType.VARIABLE - "]
    Node_10 --> Node_8
    Node_11["11: NodeType.IFLOOP - j < N_COINS"]
    Node_11 --> Node_12
    Node_11 --> Node_9
    Node_12["12: NodeType.IF - j == i"]
    Node_12 --> Node_13
    Node_12 --> Node_14
    Node_13["13: NodeType.CONTINUE - "]
    Node_13 --> Node_23
    Node_14["14: NodeType.ENDIF - "]
    Node_14 --> Node_15
    Node_15["15: NodeType.VARIABLE - inCoin = IERC20(getToken(j))"]
    Node_15 --> Node_16
    Node_16["16: NodeType.VARIABLE - inBalance = inCoin.balanceOf(address(this)).sub(assets(j))"]
    Node_16 --> Node_17
    Node_17["17: NodeType.IF - inBalance > 0"]
    Node_17 --> Node_18
    Node_17 --> Node_22
    Node_18["18: NodeType.EXPRESSION - _exchange(inBalance,int128(j),int128(i))"]
    Node_18 --> Node_19
    Node_19["19: NodeType.IF - coin.balanceOf(address(this)).sub(assets(i)) >= minAmount"]
    Node_19 --> Node_20
    Node_19 --> Node_21
    Node_20["20: NodeType.BREAK - "]
    Node_20 --> Node_9
    Node_21["21: NodeType.ENDIF - "]
    Node_21 --> Node_22
    Node_22["22: NodeType.ENDIF - "]
    Node_22 --> Node_23
    Node_23["23: NodeType.EXPRESSION - j ++"]
    Node_23 --> Node_11
    Node_24["24: NodeType.EXPRESSION - balance = coin.balanceOf(address(this)).sub(assets(i))"]
    Node_24 --> Node_25
    Node_25["25: NodeType.VARIABLE - "]
    Node_25 --> Node_26
    Node_26["26: NodeType.EXPRESSION - inAmounts_scope_0(i) = balance"]
    Node_26 --> Node_27
    Node_27["27: NodeType.EXPRESSION - usdAmount = buoy.stableToUsd(inAmounts_scope_0,false)"]
    Node_27 --> Node_28
    Node_28["28: NodeType.ENDIF - "]
    Node_28 --> Node_29
    Node_29["29: NodeType.EXPRESSION - require(bool)(balance >= minAmount)"]
    Node_29 --> Node_30
    Node_30["30: NodeType.EXPRESSION - coin.safeTransfer(recipient,balance)"]
    Node_30 --> Node_31
    Node_31["31: NodeType.RETURN - (usdAmount,balance)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/pools/LifeGuard3Pool.sol` on lines **235** to **270**

```solidity
    function withdrawSingleByExchange(
        uint256 i,
        uint256 minAmount,
        address recipient
    ) external override returns (uint256 usdAmount, uint256 balance) {
        require(msg.sender == withdrawHandler, "withdrawSingleByExchange: !withdrawHandler");
        IERC20 coin = IERC20(getToken(i));
        balance = coin.balanceOf(address(this)).sub(assets[i]);
        // Are available assets - locked assets for LP vault more than required
        // minAmount. Then estimate USD value and transfer...
        if (minAmount <= balance) {
            uint256[N_COINS] memory inAmounts;
            inAmounts[i] = balance;
            usdAmount = buoy.stableToUsd(inAmounts, false);
            // ...if not, swap other loose assets into target assets before
            // estimating USD value and transfering.
        } else {
            for (uint256 j; j < N_COINS; j++) {
                if (j == i) continue;
                IERC20 inCoin = IERC20(getToken(j));
                uint256 inBalance = inCoin.balanceOf(address(this)).sub(assets[j]);
                if (inBalance > 0) {
                    _exchange(inBalance, int128(j), int128(i));
                    if (coin.balanceOf(address(this)).sub(assets[i]) >= minAmount) {
                        break;
                    }
                }
            }
            balance = coin.balanceOf(address(this)).sub(assets[i]);
            uint256[N_COINS] memory inAmounts;
            inAmounts[i] = balance;
            usdAmount = buoy.stableToUsd(inAmounts, false);
        }
        require(balance >= minAmount);
        coin.safeTransfer(recipient, balance);
    }

```
