# Context: LifeGuard3Pool.depositStable

**Contract:** `LifeGuard3Pool` (Inherits: FixedStablecoins, Constants, Whitelist, Controllable, Ownable, Context, ILifeGuard)
**Signature:** `depositStable(bool) returns (uint256)`
**Method Selector ID:** `0xe2e5b1dd`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** N_COINS, assets, crv3pool, insurance, lpToken, withdrawHandler
- **Writes:** assets

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(msg.sender == withdrawHandler || msg.sender == insurance,depositStable: !depositHandler)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_228(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['balance', 'REF_65'] `
- `ICurve3Deposit.HIGH_LEVEL_CALL, dest:crv3pool(ICurve3Deposit), function:add_liquidity, arguments:['_inAmounts', '0']  `
- `IERC20.TMP_224(uint256) = HIGH_LEVEL_CALL, dest:TMP_222(IERC20), function:balanceOf, arguments:['TMP_223']  `
- `IERC20.TMP_233(uint256) = HIGH_LEVEL_CALL, dest:lpToken(IERC20), function:balanceOf, arguments:['TMP_232']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(msg.sender == withdrawHandler || msg.sender == insurance,depositStable: !depositHandler)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - countOfStableHasAssets = 0"]
    Node_3 --> Node_6
    Node_4["4: NodeType.STARTLOOP - "]
    Node_4 --> Node_7
    Node_5["5: NodeType.ENDLOOP - "]
    Node_5 --> Node_18
    Node_6["6: NodeType.VARIABLE - i = 0"]
    Node_6 --> Node_4
    Node_7["7: NodeType.IFLOOP - i < N_COINS"]
    Node_7 --> Node_8
    Node_7 --> Node_5
    Node_8["8: NodeType.VARIABLE - balance = IERC20(getToken(i)).balanceOf(address(this))"]
    Node_8 --> Node_9
    Node_9["9: NodeType.IF - balance != 0"]
    Node_9 --> Node_10
    Node_9 --> Node_11
    Node_10["10: NodeType.EXPRESSION - countOfStableHasAssets ++"]
    Node_10 --> Node_11
    Node_11["11: NodeType.ENDIF - "]
    Node_11 --> Node_12
    Node_12["12: NodeType.IF - ! rebalance"]
    Node_12 --> Node_13
    Node_12 --> Node_14
    Node_13["13: NodeType.EXPRESSION - balance = balance.sub(assets(i))"]
    Node_13 --> Node_15
    Node_14["14: NodeType.EXPRESSION - assets(i) = 0"]
    Node_14 --> Node_15
    Node_15["15: NodeType.ENDIF - "]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - _inAmounts(i) = balance"]
    Node_16 --> Node_17
    Node_17["17: NodeType.EXPRESSION - i ++"]
    Node_17 --> Node_7
    Node_18["18: NodeType.IF - countOfStableHasAssets == 0"]
    Node_18 --> Node_19
    Node_18 --> Node_20
    Node_19["19: NodeType.RETURN - 0"]
    Node_20["20: NodeType.ENDIF - "]
    Node_20 --> Node_21
    Node_21["21: NodeType.EXPRESSION - crv3pool.add_liquidity(_inAmounts,0)"]
    Node_21 --> Node_22
    Node_22["22: NodeType.VARIABLE - lpAmount = lpToken.balanceOf(address(this))"]
    Node_22 --> Node_23
    Node_23["23: NodeType.EXPRESSION - LogNewStableDeposit(_inAmounts,lpAmount,rebalance)"]
    Node_23 --> Node_24
    Node_24["24: NodeType.RETURN - lpAmount"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/pools/LifeGuard3Pool.sol` on lines **161** to **182**

```solidity
    function depositStable(bool rebalance) external override returns (uint256) {
        require(msg.sender == withdrawHandler || msg.sender == insurance, "depositStable: !depositHandler");
        uint256[N_COINS] memory _inAmounts;
        uint256 countOfStableHasAssets = 0;
        for (uint256 i = 0; i < N_COINS; i++) {
            uint256 balance = IERC20(getToken(i)).balanceOf(address(this));
            if (balance != 0) {
                countOfStableHasAssets++;
            }
            if (!rebalance) {
                balance = balance.sub(assets[i]);
            } else {
                assets[i] = 0;
            }
            _inAmounts[i] = balance;
        }
        if (countOfStableHasAssets == 0) return 0;
        crv3pool.add_liquidity(_inAmounts, 0);
        uint256 lpAmount = lpToken.balanceOf(address(this));
        emit LogNewStableDeposit(_inAmounts, lpAmount, rebalance);
        return lpAmount;
    }

```
