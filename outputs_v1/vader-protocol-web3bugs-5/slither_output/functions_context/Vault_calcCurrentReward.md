# Context: Vault.calcCurrentReward

**Contract:** `Vault` (Inherits: None)
**Signature:** `calcCurrentReward(address,address) returns (uint256)`
**Method Selector ID:** `0xe9f27c3a`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** POOLS, VADER, mapMemberSynth_lastTime
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `iPOOLS.TMP_1251(bool) = HIGH_LEVEL_CALL, dest:TMP_1248(iPOOLS), function:isAsset, arguments:['TMP_1250']  `
- `iVADER.TMP_1246(uint256) = HIGH_LEVEL_CALL, dest:TMP_1245(iVADER), function:secondsPerEra, arguments:[]  `
- `iSYNTH.TMP_1250(address) = HIGH_LEVEL_CALL, dest:TMP_1249(iSYNTH), function:TOKEN, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - _secondsSinceClaim = block.timestamp - mapMemberSynth_lastTime(member)(synth)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - _share = calcReward(synth,member)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - reward = (_share * _secondsSinceClaim) / iVADER(VADER).secondsPerEra()"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.IF - iPOOLS(POOLS).isAsset(iSYNTH(synth).TOKEN())"]
    Node_5 --> Node_6
    Node_5 --> Node_7
    Node_6["6: NodeType.EXPRESSION - _reserve = reserveUSDV()"]
    Node_6 --> Node_8
    Node_7["7: NodeType.EXPRESSION - _reserve = reserveVADER()"]
    Node_7 --> Node_8
    Node_8["8: NodeType.ENDIF - "]
    Node_8 --> Node_9
    Node_9["9: NodeType.IF - reward >= _reserve"]
    Node_9 --> Node_10
    Node_9 --> Node_11
    Node_10["10: NodeType.EXPRESSION - reward = _reserve"]
    Node_10 --> Node_11
    Node_11["11: NodeType.ENDIF - "]
    Node_11 --> Node_12
    Node_12["12: NodeType.RETURN - reward"]
```

### Source Mapping
Declared in: `contracts/Vault.sol` on lines **123** to **136**

```solidity
    function calcCurrentReward(address synth, address member) public view returns(uint reward) {
        uint _secondsSinceClaim = block.timestamp - mapMemberSynth_lastTime[member][synth];        // Get time since last claim
        uint _share = calcReward(synth, member);                                               // Get share of rewards for member
        reward = (_share * _secondsSinceClaim) / iVADER(VADER).secondsPerEra();         // Get owed amount, based on per-day rates
        uint _reserve;
        if(iPOOLS(POOLS).isAsset(iSYNTH(synth).TOKEN())){
            _reserve = reserveUSDV();
        } else {
            _reserve = reserveVADER();
        }
        if(reward >= _reserve) {
            reward = _reserve;                                                          // Send full reserve if the last
        }
    }

```
