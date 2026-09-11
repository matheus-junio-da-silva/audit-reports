# Context: Controller._totalAssetsEmergency

**Contract:** `Controller` (Inherits: IController, FixedGTokens, FixedStablecoins, Constants, Whitelist, Ownable, Pausable, Context)
**Signature:** `_totalAssetsEmergency() returns (uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `private`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** CHAINLINK_PRICE_DECIMAL_FACTOR, DEFAULT_DECIMALS_FACTOR, N_COINS, buoy, deadCoin, lifeGuard, underlyingVaults
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_175(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_174', 'decimals'] `
- `SafeMath.TMP_171(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['TMP_169', 'TMP_170'] `
- `IVault.TMP_169(uint256) = HIGH_LEVEL_CALL, dest:TMP_168(IVault), function:totalAssets, arguments:[]  `
- `IChainPrice.TMP_167(uint256) = HIGH_LEVEL_CALL, dest:chainPrice(IChainPrice), function:getPriceFeed, arguments:['i']  `
- `IERC20.TMP_170(uint256) = HIGH_LEVEL_CALL, dest:token(IERC20), function:balanceOf, arguments:['lifeGuard']  `
- `SafeMath.TMP_176(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['total', 'assets'] `
- `SafeMath.TMP_172(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['assets', 'price'] `
- `SafeMath.TMP_173(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_172', 'CHAINLINK_PRICE_DECIMAL_FACTOR'] `
- `SafeMath.TMP_174(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['assets', 'DEFAULT_DECIMALS_FACTOR'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - chainPrice = IChainPrice(buoy)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - "]
    Node_2 --> Node_5
    Node_3["3: NodeType.STARTLOOP - "]
    Node_3 --> Node_6
    Node_4["4: NodeType.ENDLOOP - "]
    Node_4 --> Node_18
    Node_5["5: NodeType.VARIABLE - i = 0"]
    Node_5 --> Node_3
    Node_6["6: NodeType.IFLOOP - i < N_COINS"]
    Node_6 --> Node_7
    Node_6 --> Node_4
    Node_7["7: NodeType.IF - i != deadCoin"]
    Node_7 --> Node_8
    Node_7 --> Node_16
    Node_8["8: NodeType.VARIABLE - tokenAddress = getToken(i)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.VARIABLE - decimals = getDecimal(i)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.VARIABLE - token = IERC20(tokenAddress)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.VARIABLE - price = chainPrice.getPriceFeed(i)"]
    Node_11 --> Node_12
    Node_12["12: NodeType.VARIABLE - assets = IVault(underlyingVaults(i)).totalAssets().add(token.balanceOf(lifeGuard))"]
    Node_12 --> Node_13
    Node_13["13: NodeType.EXPRESSION - assets = assets.mul(price).div(CHAINLINK_PRICE_DECIMAL_FACTOR)"]
    Node_13 --> Node_14
    Node_14["14: NodeType.EXPRESSION - assets = assets.mul(DEFAULT_DECIMALS_FACTOR).div(decimals)"]
    Node_14 --> Node_15
    Node_15["15: NodeType.EXPRESSION - total = total.add(assets)"]
    Node_15 --> Node_16
    Node_16["16: NodeType.ENDIF - "]
    Node_16 --> Node_17
    Node_17["17: NodeType.EXPRESSION - i ++"]
    Node_17 --> Node_6
    Node_18["18: NodeType.RETURN - total"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/Controller.sol` on lines **291** to **307**

```solidity
    function _totalAssetsEmergency() private view returns (uint256) {
        IChainPrice chainPrice = IChainPrice(buoy);
        uint256 total;
        for (uint256 i = 0; i < N_COINS; i++) {
            if (i != deadCoin) {
                address tokenAddress = getToken(i);
                uint256 decimals = getDecimal(i);
                IERC20 token = IERC20(tokenAddress);
                uint256 price = chainPrice.getPriceFeed(i);
                uint256 assets = IVault(underlyingVaults[i]).totalAssets().add(token.balanceOf(lifeGuard));
                assets = assets.mul(price).div(CHAINLINK_PRICE_DECIMAL_FACTOR);
                assets = assets.mul(DEFAULT_DECIMALS_FACTOR).div(decimals);
                total = total.add(assets);
            }
        }
        return total;
    }

```
