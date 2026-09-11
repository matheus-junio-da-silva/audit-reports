# Context: PnL.decreaseGTokenLastAmount

**Contract:** `PnL` (Inherits: IPnL, FixedGTokens, Constants, Controllable, Ownable, Context)
**Signature:** `decreaseGTokenLastAmount(bool,uint256,uint256)`
**Method Selector ID:** `0x4175e521`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** controller, lastGvtAssets, lastPwrdAssets, rebase
- **Writes:** lastGvtAssets, lastPwrdAssets

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(msg.sender == controller,decreaseGTokenLastAmount: !controller)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_120(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_119', 'preTABeforeBonus'] `
- `SafeMath.TMP_121(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['prePABeforeBonus', 'TMP_120'] `
- `SafeMath.TMP_122(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['preGABeforeBonus', 'bonus'] `
- `SafeMath.TMP_129(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['lastGA', 'dollarAmount'] `
- `SafeMath.TMP_116(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['bonus', 'preGABeforeBonus'] `
- `SafeMath.TMP_115(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['preGABeforeBonus', 'prePABeforeBonus'] `
- `SafeMath.TMP_119(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['bonus', 'prePABeforeBonus'] `
- `SafeMath.TMP_117(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_116', 'preTABeforeBonus'] `
- `SafeMath.TMP_131(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['lastPA', 'dollarAmount'] `
- `SafeMath.TMP_118(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['preGABeforeBonus', 'TMP_117'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(msg.sender == controller,decreaseGTokenLastAmount: !controller)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - lastGA = lastGvtAssets"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - lastPA = lastPwrdAssets"]
    Node_3 --> Node_4
    Node_4["4: NodeType.IF - ! pwrd"]
    Node_4 --> Node_22
    Node_4 --> Node_26
    Node_7["7: NodeType.ENDIF - "]
    Node_7 --> Node_8
    Node_8["8: NodeType.IF - bonus > 0"]
    Node_8 --> Node_9
    Node_8 --> Node_18
    Node_9["9: NodeType.VARIABLE - preGABeforeBonus = lastGA"]
    Node_9 --> Node_10
    Node_10["10: NodeType.VARIABLE - prePABeforeBonus = lastPA"]
    Node_10 --> Node_11
    Node_11["11: NodeType.VARIABLE - preTABeforeBonus = preGABeforeBonus.add(prePABeforeBonus)"]
    Node_11 --> Node_12
    Node_12["12: NodeType.IF - rebase"]
    Node_12 --> Node_13
    Node_12 --> Node_15
    Node_13["13: NodeType.EXPRESSION - lastGA = preGABeforeBonus.add(bonus.mul(preGABeforeBonus).div(preTABeforeBonus))"]
    Node_13 --> Node_14
    Node_14["14: NodeType.EXPRESSION - lastPA = prePABeforeBonus.add(bonus.mul(prePABeforeBonus).div(preTABeforeBonus))"]
    Node_14 --> Node_16
    Node_15["15: NodeType.EXPRESSION - lastGA = preGABeforeBonus.add(bonus)"]
    Node_15 --> Node_16
    Node_16["16: NodeType.ENDIF - "]
    Node_16 --> Node_17
    Node_17["17: NodeType.EXPRESSION - LogPnLExecution(0,int256(bonus),0,0,bonus,0,preGABeforeBonus,prePABeforeBonus,lastGA,lastPA)"]
    Node_17 --> Node_18
    Node_18["18: NodeType.ENDIF - "]
    Node_18 --> Node_19
    Node_19["19: NodeType.EXPRESSION - lastGvtAssets = lastGA"]
    Node_19 --> Node_20
    Node_20["20: NodeType.EXPRESSION - lastPwrdAssets = lastPA"]
    Node_20 --> Node_21
    Node_21["21: NodeType.EXPRESSION - LogNewGtokenChange(pwrd,int256(- dollarAmount))"]
    Node_22["22: NodeType.IF - dollarAmount > lastGA"]
    Node_22 --> Node_23
    Node_22 --> Node_24
    Node_23["23: NodeType.EXPRESSION - lastGA = 0"]
    Node_23 --> Node_25
    Node_24["24: NodeType.EXPRESSION - lastGA = lastGA.sub(dollarAmount)"]
    Node_24 --> Node_25
    Node_25["25: NodeType.ENDIF - "]
    Node_25 --> Node_7
    Node_26["26: NodeType.IF - dollarAmount > lastPA"]
    Node_26 --> Node_27
    Node_26 --> Node_28
    Node_27["27: NodeType.EXPRESSION - lastPA = 0"]
    Node_27 --> Node_29
    Node_28["28: NodeType.EXPRESSION - lastPA = lastPA.sub(dollarAmount)"]
    Node_28 --> Node_29
    Node_29["29: NodeType.ENDIF - "]
    Node_29 --> Node_7
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/pnl/PnL.sol` on lines **112** to **141**

```solidity
    function decreaseGTokenLastAmount(
        bool pwrd,
        uint256 dollarAmount,
        uint256 bonus
    ) external override {
        require(msg.sender == controller, "decreaseGTokenLastAmount: !controller");
        uint256 lastGA = lastGvtAssets;
        uint256 lastPA = lastPwrdAssets;
        if (!pwrd) {
            lastGA = dollarAmount > lastGA ? 0 : lastGA.sub(dollarAmount);
        } else {
            lastPA = dollarAmount > lastPA ? 0 : lastPA.sub(dollarAmount);
        }
        if (bonus > 0) {
            uint256 preGABeforeBonus = lastGA;
            uint256 prePABeforeBonus = lastPA;
            uint256 preTABeforeBonus = preGABeforeBonus.add(prePABeforeBonus);
            if (rebase) {
                lastGA = preGABeforeBonus.add(bonus.mul(preGABeforeBonus).div(preTABeforeBonus));
                lastPA = prePABeforeBonus.add(bonus.mul(prePABeforeBonus).div(preTABeforeBonus));
            } else {
                lastGA = preGABeforeBonus.add(bonus);
            }
            emit LogPnLExecution(0, int256(bonus), 0, 0, bonus, 0, preGABeforeBonus, prePABeforeBonus, lastGA, lastPA);
        }

        lastGvtAssets = lastGA;
        lastPwrdAssets = lastPA;
        emit LogNewGtokenChange(pwrd, int256(-dollarAmount));
    }

```
