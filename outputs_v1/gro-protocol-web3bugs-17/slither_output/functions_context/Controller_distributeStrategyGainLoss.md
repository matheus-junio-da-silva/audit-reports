# Context: Controller.distributeStrategyGainLoss

**Contract:** `Controller` (Inherits: IController, FixedGTokens, FixedStablecoins, Constants, Whitelist, Ownable, Pausable, Context)
**Signature:** `distributeStrategyGainLoss(uint256,uint256)`
**Method Selector ID:** `0x93ce07b2`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** N_COINS, buoy, pnl, reward, vaultIndexes
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(index > 0 || index <= N_COINS + 1,!VaultAdaptor)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IBuoy.TMP_216(uint256) = HIGH_LEVEL_CALL, dest:ibuoy(IBuoy), function:lpToUsd, arguments:['loss']  `
- `IPnL.HIGH_LEVEL_CALL, dest:ipnl(IPnL), function:distributePriceChange, arguments:['TMP_219']  `
- `IBuoy.TMP_210(uint256) = HIGH_LEVEL_CALL, dest:ibuoy(IBuoy), function:singleStableToUsd, arguments:['gain', 'index']  `
- `IBuoy.TMP_212(uint256) = HIGH_LEVEL_CALL, dest:ibuoy(IBuoy), function:singleStableToUsd, arguments:['loss', 'index']  `
- `IBuoy.TMP_214(uint256) = HIGH_LEVEL_CALL, dest:ibuoy(IBuoy), function:lpToUsd, arguments:['gain']  `
- `IPnL.HIGH_LEVEL_CALL, dest:ipnl(IPnL), function:distributeStrategyGainLoss, arguments:['gainUsd', 'lossUsd', 'reward']  `
- `IBuoy.TMP_218(bool) = HIGH_LEVEL_CALL, dest:ibuoy(IBuoy), function:updateRatios, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - index = vaultIndexes(msg.sender)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(index > 0 || index <= N_COINS + 1,!VaultAdaptor)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - ipnl = IPnL(pnl)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - ibuoy = IBuoy(buoy)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - index = index - 1"]
    Node_7 --> Node_8
    Node_8["8: NodeType.IF - index < N_COINS"]
    Node_8 --> Node_9
    Node_8 --> Node_15
    Node_9["9: NodeType.IF - gain > 0"]
    Node_9 --> Node_10
    Node_9 --> Node_11
    Node_10["10: NodeType.EXPRESSION - gainUsd = ibuoy.singleStableToUsd(gain,index)"]
    Node_10 --> Node_14
    Node_11["11: NodeType.IF - loss > 0"]
    Node_11 --> Node_12
    Node_11 --> Node_13
    Node_12["12: NodeType.EXPRESSION - lossUsd = ibuoy.singleStableToUsd(loss,index)"]
    Node_12 --> Node_13
    Node_13["13: NodeType.ENDIF - "]
    Node_13 --> Node_14
    Node_14["14: NodeType.ENDIF - "]
    Node_14 --> Node_21
    Node_15["15: NodeType.IF - gain > 0"]
    Node_15 --> Node_16
    Node_15 --> Node_17
    Node_16["16: NodeType.EXPRESSION - gainUsd = ibuoy.lpToUsd(gain)"]
    Node_16 --> Node_20
    Node_17["17: NodeType.IF - loss > 0"]
    Node_17 --> Node_18
    Node_17 --> Node_19
    Node_18["18: NodeType.EXPRESSION - lossUsd = ibuoy.lpToUsd(loss)"]
    Node_18 --> Node_19
    Node_19["19: NodeType.ENDIF - "]
    Node_19 --> Node_20
    Node_20["20: NodeType.ENDIF - "]
    Node_20 --> Node_21
    Node_21["21: NodeType.ENDIF - "]
    Node_21 --> Node_22
    Node_22["22: NodeType.EXPRESSION - ipnl.distributeStrategyGainLoss(gainUsd,lossUsd,reward)"]
    Node_22 --> Node_23
    Node_23["23: NodeType.IF - ibuoy.updateRatios()"]
    Node_23 --> Node_24
    Node_23 --> Node_25
    Node_24["24: NodeType.EXPRESSION - ipnl.distributePriceChange(_totalAssets())"]
    Node_24 --> Node_25
    Node_25["25: NodeType.ENDIF - "]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/Controller.sol` on lines **355** to **382**

```solidity
    function distributeStrategyGainLoss(uint256 gain, uint256 loss) external override {
        uint256 index = vaultIndexes[msg.sender];
        require(index > 0 || index <= N_COINS + 1, "!VaultAdaptor");
        IPnL ipnl = IPnL(pnl);
        IBuoy ibuoy = IBuoy(buoy);
        uint256 gainUsd;
        uint256 lossUsd;
        index = index - 1;
        if (index < N_COINS) {
            if (gain > 0) {
                gainUsd = ibuoy.singleStableToUsd(gain, index);
            } else if (loss > 0) {
                lossUsd = ibuoy.singleStableToUsd(loss, index);
            }
        } else {
            if (gain > 0) {
                gainUsd = ibuoy.lpToUsd(gain);
            } else if (loss > 0) {
                lossUsd = ibuoy.lpToUsd(loss);
            }
        }
        ipnl.distributeStrategyGainLoss(gainUsd, lossUsd, reward);
        // Check if curve spot price within tollerance, if so update them
        if (ibuoy.updateRatios()) {
            // If the curve ratios were successfully updated, realize system price changes
            ipnl.distributePriceChange(_totalAssets());
        }
    }

```
