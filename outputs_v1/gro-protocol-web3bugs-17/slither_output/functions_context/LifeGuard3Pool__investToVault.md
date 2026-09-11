# Context: LifeGuard3Pool._investToVault

**Contract:** `LifeGuard3Pool` (Inherits: FixedStablecoins, Constants, Whitelist, Controllable, Ownable, Context, ILifeGuard)
**Signature:** `_investToVault(uint256,bool) returns (uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `private`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** N_COINS, assets, lpToken
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IController.TMP_375(address) = HIGH_LEVEL_CALL, dest:TMP_374(IController), function:underlyingVaults, arguments:['i']  `
- `IController.TMP_380(address) = HIGH_LEVEL_CALL, dest:TMP_379(IController), function:curveVault, arguments:[]  `
- `SafeMath.TMP_384(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['TMP_383', 'REF_146'] `
- `IERC20.TMP_383(uint256) = HIGH_LEVEL_CALL, dest:coin(IERC20), function:balanceOf, arguments:['TMP_382']  `
- `IVault.HIGH_LEVEL_CALL, dest:TMP_389(IVault), function:invest, arguments:[]  `
- `IVault.HIGH_LEVEL_CALL, dest:TMP_387(IVault), function:deposit, arguments:['balance']  `
- `IVault.HIGH_LEVEL_CALL, dest:TMP_391(IVault), function:deposit, arguments:['investBalance']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - "]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.IF - i < N_COINS"]
    Node_3 --> Node_4
    Node_3 --> Node_6
    Node_4["4: NodeType.EXPRESSION - vault = IVault(_controller().underlyingVaults(i))"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - coin = IERC20(getToken(i))"]
    Node_5 --> Node_8
    Node_6["6: NodeType.EXPRESSION - vault = IVault(_controller().curveVault())"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - coin = lpToken"]
    Node_7 --> Node_8
    Node_8["8: NodeType.ENDIF - "]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - balance = coin.balanceOf(address(this)).sub(assets(i))"]
    Node_9 --> Node_10
    Node_10["10: NodeType.IF - balance > 0"]
    Node_10 --> Node_11
    Node_10 --> Node_17
    Node_11["11: NodeType.IF - i == N_COINS"]
    Node_11 --> Node_12
    Node_11 --> Node_18
    Node_12["12: NodeType.EXPRESSION - IVault(vault).deposit(balance)"]
    Node_12 --> Node_13
    Node_13["13: NodeType.EXPRESSION - IVault(vault).invest()"]
    Node_13 --> Node_16
    Node_15["15: NodeType.EXPRESSION - IVault(vault).deposit(investBalance)"]
    Node_15 --> Node_16
    Node_16["16: NodeType.ENDIF - "]
    Node_16 --> Node_17
    Node_17["17: NodeType.ENDIF - "]
    Node_17 --> Node_22
    Node_18["18: NodeType.IF - needSkim"]
    Node_18 --> Node_19
    Node_18 --> Node_20
    Node_19["19: NodeType.EXPRESSION - investBalance = skim(balance,i)"]
    Node_19 --> Node_21
    Node_20["20: NodeType.EXPRESSION - investBalance = balance"]
    Node_20 --> Node_21
    Node_21["21: NodeType.ENDIF - "]
    Node_21 --> Node_15
    Node_22["22: NodeType.RETURN - balance"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/pools/LifeGuard3Pool.sol` on lines **405** to **425**

```solidity
    function _investToVault(uint256 i, bool needSkim) private returns (uint256 balance) {
        IVault vault;
        IERC20 coin;
        if (i < N_COINS) {
            vault = IVault(_controller().underlyingVaults(i));
            coin = IERC20(getToken(i));
        } else {
            vault = IVault(_controller().curveVault());
            coin = lpToken;
        }
        balance = coin.balanceOf(address(this)).sub(assets[i]);
        if (balance > 0) {
            if (i == N_COINS) {
                IVault(vault).deposit(balance);
                IVault(vault).invest();
            } else {
                uint256 investBalance = needSkim ? skim(balance, i) : balance;
                IVault(vault).deposit(investBalance);
            }
        }
    }

```
