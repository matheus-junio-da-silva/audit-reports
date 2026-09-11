# Context: Controller.emergency

**Contract:** `Controller` (Inherits: IController, FixedGTokens, FixedStablecoins, Constants, Whitelist, Ownable, Pausable, Context)
**Signature:** `emergency(uint256)`
**Method Selector ID:** `0xe5c30120`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyWhitelist`
  ```solidity
  modifier onlyWhitelist() {
          require(whitelist[msg.sender], "only whitelist");
          _;
      }
  ```

### State Variables Interaction
- **Reads:** N_COINS, insurance, pnl
- **Writes:** deadCoin, emergencyState

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(coin < N_COINS,invalid coin)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IPnL.HIGH_LEVEL_CALL, dest:TMP_188(IPnL), function:emergencyPnL, arguments:[]  `
- `IInsurance.HIGH_LEVEL_CALL, dest:TMP_185(IInsurance), function:setUnderlyingTokenPercent, arguments:['i', 'percent']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_19
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(coin < N_COINS,invalid coin)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.IF - ! paused()"]
    Node_2 --> Node_3
    Node_2 --> Node_4
    Node_3["3: NodeType.EXPRESSION - _pause()"]
    Node_3 --> Node_4
    Node_4["4: NodeType.ENDIF - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - deadCoin = coin"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - emergencyState = true"]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - "]
    Node_7 --> Node_10
    Node_8["8: NodeType.STARTLOOP - "]
    Node_8 --> Node_11
    Node_9["9: NodeType.ENDLOOP - "]
    Node_9 --> Node_18
    Node_10["10: NodeType.VARIABLE - "]
    Node_10 --> Node_8
    Node_11["11: NodeType.IFLOOP - i < N_COINS"]
    Node_11 --> Node_12
    Node_11 --> Node_9
    Node_12["12: NodeType.IF - i == coin"]
    Node_12 --> Node_13
    Node_12 --> Node_14
    Node_13["13: NodeType.EXPRESSION - percent = 10000"]
    Node_13 --> Node_15
    Node_14["14: NodeType.EXPRESSION - percent = 0"]
    Node_14 --> Node_15
    Node_15["15: NodeType.ENDIF - "]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - IInsurance(insurance).setUnderlyingTokenPercent(i,percent)"]
    Node_16 --> Node_17
    Node_17["17: NodeType.EXPRESSION - i ++"]
    Node_17 --> Node_11
    Node_18["18: NodeType.EXPRESSION - IPnL(pnl).emergencyPnL()"]
    Node_19["19: NodeType.EXPRESSION - onlyWhitelist()"]
    Node_19 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/Controller.sol` on lines **317** to **335**

```solidity
    function emergency(uint256 coin) external onlyWhitelist {
        require(coin < N_COINS, "invalid coin");
        if (!paused()) {
            _pause();
        }
        deadCoin = coin;
        emergencyState = true;

        uint256 percent;
        for (uint256 i; i < N_COINS; i++) {
            if (i == coin) {
                percent = 10000;
            } else {
                percent = 0;
            }
            IInsurance(insurance).setUnderlyingTokenPercent(i, percent);
        }
        IPnL(pnl).emergencyPnL();
    }

```
