# Context: PnL.distributeStrategyGainLoss

**Contract:** `PnL` (Inherits: IPnL, FixedGTokens, Constants, Controllable, Ownable, Context)
**Signature:** `distributeStrategyGainLoss(uint256,uint256,address)`
**Method Selector ID:** `0x9ecf47c1`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** controller, gvt, lastGvtAssets, lastPwrdAssets
- **Writes:** lastGvtAssets, lastPwrdAssets

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(msg.sender == controller,!Controller)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IToken.HIGH_LEVEL_CALL, dest:gvt(IToken), function:mint, arguments:['reward', 'TMP_185', 'performanceBonus']  `
- `SafeMath.TMP_187(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['gvtAssets', 'performanceBonus'] `
- `IToken.TMP_185(uint256) = HIGH_LEVEL_CALL, dest:gvt(IToken), function:factor, arguments:['gvtAssets']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(msg.sender == controller,!Controller)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - lastGA = lastGvtAssets"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - lastPA = lastPwrdAssets"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - "]
    Node_7 --> Node_8
    Node_8["8: NodeType.IF - gain > 0"]
    Node_8 --> Node_9
    Node_8 --> Node_17
    Node_9["9: NodeType.EXPRESSION - (gvtAssets,pwrdAssets,performanceBonus) = handleInvestGain(lastGA,lastPA,gain,reward)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.IF - performanceBonus > 0"]
    Node_10 --> Node_11
    Node_10 --> Node_13
    Node_11["11: NodeType.EXPRESSION - gvt.mint(reward,gvt.factor(gvtAssets),performanceBonus)"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - gvtAssets = gvtAssets.add(performanceBonus)"]
    Node_12 --> Node_13
    Node_13["13: NodeType.ENDIF - "]
    Node_13 --> Node_14
    Node_14["14: NodeType.EXPRESSION - lastGvtAssets = gvtAssets"]
    Node_14 --> Node_15
    Node_15["15: NodeType.EXPRESSION - lastPwrdAssets = pwrdAssets"]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - investPnL = int256(gain)"]
    Node_16 --> Node_21
    Node_17["17: NodeType.IF - loss > 0"]
    Node_17 --> Node_18
    Node_17 --> Node_20
    Node_18["18: NodeType.EXPRESSION - (lastGvtAssets,lastPwrdAssets) = handleLoss(lastGA,lastPA,loss)"]
    Node_18 --> Node_19
    Node_19["19: NodeType.EXPRESSION - investPnL = - int256(loss)"]
    Node_19 --> Node_20
    Node_20["20: NodeType.ENDIF - "]
    Node_20 --> Node_21
    Node_21["21: NodeType.ENDIF - "]
    Node_21 --> Node_22
    Node_22["22: NodeType.EXPRESSION - LogPnLExecution(0,investPnL,investPnL,0,0,performanceBonus,lastGA,lastPA,lastGvtAssets,lastPwrdAssets)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/pnl/PnL.sol` on lines **241** to **280**

```solidity
    function distributeStrategyGainLoss(
        uint256 gain,
        uint256 loss,
        address reward
    ) external override {
        require(msg.sender == controller, "!Controller");
        uint256 lastGA = lastGvtAssets;
        uint256 lastPA = lastPwrdAssets;
        uint256 performanceBonus;
        uint256 gvtAssets;
        uint256 pwrdAssets;
        int256 investPnL;
        if (gain > 0) {
            (gvtAssets, pwrdAssets, performanceBonus) = handleInvestGain(lastGA, lastPA, gain, reward);
            if (performanceBonus > 0) {
                gvt.mint(reward, gvt.factor(gvtAssets), performanceBonus);
                gvtAssets = gvtAssets.add(performanceBonus);
            }

            lastGvtAssets = gvtAssets;
            lastPwrdAssets = pwrdAssets;
            investPnL = int256(gain);
        } else if (loss > 0) {
            (lastGvtAssets, lastPwrdAssets) = handleLoss(lastGA, lastPA, loss);
            investPnL = -int256(loss);
        }

        emit LogPnLExecution(
            0,
            investPnL,
            investPnL,
            0,
            0,
            performanceBonus,
            lastGA,
            lastPA,
            lastGvtAssets,
            lastPwrdAssets
        );
    }

```
