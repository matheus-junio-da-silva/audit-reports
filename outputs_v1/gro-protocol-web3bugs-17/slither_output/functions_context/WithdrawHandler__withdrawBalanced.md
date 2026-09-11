# Context: WithdrawHandler._withdrawBalanced

**Contract:** `WithdrawHandler` (Inherits: IWithdrawHandler, FixedVaults, FixedStablecoins, Constants, Controllable, Ownable, Context)
**Signature:** `_withdrawBalanced(address,bool,uint256,uint256[3],uint256) returns (uint256, uint256[3])`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `private`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** N_COINS, PERCENTAGE_DECIMAL_FACTOR, buoy, insurance
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(tokenAmounts[i] >= minAmounts[i],!withdrawBalanced: !minAmount)`
- require/assert: `require(bool,string)(tokenAmounts[i] <= adapter.totalAssets(),_withdrawBalanced: !adapterBalance)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_127(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_126', 'PERCENTAGE_DECIMAL_FACTOR'] `
- `IBuoy.TMP_139(uint256) = HIGH_LEVEL_CALL, dest:buoy(IBuoy), function:stableToUsd, arguments:['tokenAmounts', 'False']  `
- `IBuoy.TMP_130(uint256) = HIGH_LEVEL_CALL, dest:buoy(IBuoy), function:singleStableFromLp, arguments:['withdraw', 'TMP_129']  `
- `IVault.HIGH_LEVEL_CALL, dest:adapter(IVault), function:withdrawByStrategyOrder, arguments:['REF_103', 'account', 'pwrd']  `
- `IInsurance.TMP_123(uint256[3]) = HIGH_LEVEL_CALL, dest:insurance(IInsurance), function:getDelta, arguments:['withdrawUsd']  `
- `SafeMath.TMP_126(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['lpAmount', 'REF_93'] `
- `IVault.TMP_134(uint256) = HIGH_LEVEL_CALL, dest:adapter(IVault), function:totalAssets, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - coins = N_COINS"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - delta = insurance.getDelta(withdrawUsd)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - _vaults = vaults()"]
    Node_3 --> Node_6
    Node_4["4: NodeType.STARTLOOP - "]
    Node_4 --> Node_7
    Node_5["5: NodeType.ENDLOOP - "]
    Node_5 --> Node_17
    Node_6["6: NodeType.VARIABLE - "]
    Node_6 --> Node_4
    Node_7["7: NodeType.IFLOOP - i < coins"]
    Node_7 --> Node_8
    Node_7 --> Node_5
    Node_8["8: NodeType.VARIABLE - withdraw = lpAmount.mul(delta(i)).div(PERCENTAGE_DECIMAL_FACTOR)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.IF - withdraw > 0"]
    Node_9 --> Node_10
    Node_9 --> Node_15
    Node_10["10: NodeType.EXPRESSION - tokenAmounts(i) = buoy.singleStableFromLp(withdraw,int128(i))"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - require(bool,string)(tokenAmounts(i) >= minAmounts(i),!withdrawBalanced: !minAmount)"]
    Node_11 --> Node_12
    Node_12["12: NodeType.VARIABLE - adapter = IVault(_vaults(i))"]
    Node_12 --> Node_13
    Node_13["13: NodeType.EXPRESSION - require(bool,string)(tokenAmounts(i) <= adapter.totalAssets(),_withdrawBalanced: !adapterBalance)"]
    Node_13 --> Node_14
    Node_14["14: NodeType.EXPRESSION - adapter.withdrawByStrategyOrder(tokenAmounts(i),account,pwrd)"]
    Node_14 --> Node_15
    Node_15["15: NodeType.ENDIF - "]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - i ++"]
    Node_16 --> Node_7
    Node_17["17: NodeType.EXPRESSION - dollarAmount = buoy.stableToUsd(tokenAmounts,false)"]
    Node_17 --> Node_18
    Node_18["18: NodeType.RETURN - (dollarAmount,tokenAmounts)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/WithdrawHandler.sol` on lines **316** to **337**

```solidity
    function _withdrawBalanced(
        address account,
        bool pwrd,
        uint256 lpAmount,
        uint256[N_COINS] memory minAmounts,
        uint256 withdrawUsd
    ) private returns (uint256 dollarAmount, uint256[N_COINS] memory tokenAmounts) {
        uint256 coins = N_COINS;
        uint256[N_COINS] memory delta = insurance.getDelta(withdrawUsd);
        address[N_COINS] memory _vaults = vaults();
        for (uint256 i; i < coins; i++) {
            uint256 withdraw = lpAmount.mul(delta[i]).div(PERCENTAGE_DECIMAL_FACTOR);
            if (withdraw > 0) {
                tokenAmounts[i] = buoy.singleStableFromLp(withdraw, int128(i));
                require(tokenAmounts[i] >= minAmounts[i], "!withdrawBalanced: !minAmount");
                IVault adapter = IVault(_vaults[i]);
                require(tokenAmounts[i] <= adapter.totalAssets(), "_withdrawBalanced: !adapterBalance");
                adapter.withdrawByStrategyOrder(tokenAmounts[i], account, pwrd);
            }
        }
        dollarAmount = buoy.stableToUsd(tokenAmounts, false);
    }

```
