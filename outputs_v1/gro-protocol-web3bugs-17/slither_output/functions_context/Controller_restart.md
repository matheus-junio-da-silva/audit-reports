# Context: Controller.restart

**Contract:** `Controller` (Inherits: IController, FixedGTokens, FixedStablecoins, Constants, Whitelist, Ownable, Pausable, Context)
**Signature:** `restart(uint256[])`
**Method Selector ID:** `0xbec3dd91`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyOwner`
  ```solidity
  modifier onlyOwner() {
          require(owner() == _msgSender(), "Ownable: caller is not the owner");
          _;
      }
  ```
- `whenPaused`
  ```solidity
  modifier whenPaused() {
          require(paused(), "Pausable: not paused");
          _;
      }
  ```

### State Variables Interaction
- **Reads:** N_COINS, insurance, pnl
- **Writes:** deadCoin, emergencyState

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IInsurance.HIGH_LEVEL_CALL, dest:TMP_193(IInsurance), function:setUnderlyingTokenPercent, arguments:['i', 'REF_58']  `
- `IPnL.HIGH_LEVEL_CALL, dest:TMP_196(IPnL), function:recover, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_11
    Node_1["1: NodeType.EXPRESSION - _unpause()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - deadCoin = 99"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - emergencyState = false"]
    Node_3 --> Node_6
    Node_4["4: NodeType.STARTLOOP - "]
    Node_4 --> Node_7
    Node_5["5: NodeType.ENDLOOP - "]
    Node_5 --> Node_10
    Node_6["6: NodeType.VARIABLE - "]
    Node_6 --> Node_4
    Node_7["7: NodeType.IFLOOP - i < N_COINS"]
    Node_7 --> Node_8
    Node_7 --> Node_5
    Node_8["8: NodeType.EXPRESSION - IInsurance(insurance).setUnderlyingTokenPercent(i,allocations(i))"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - i ++"]
    Node_9 --> Node_7
    Node_10["10: NodeType.EXPRESSION - IPnL(pnl).recover()"]
    Node_11["11: NodeType.EXPRESSION - onlyOwner()"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - whenPaused()"]
    Node_12 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/Controller.sol` on lines **341** to **350**

```solidity
    function restart(uint256[] calldata allocations) external onlyOwner whenPaused {
        _unpause();
        deadCoin = 99;
        emergencyState = false;

        for (uint256 i; i < N_COINS; i++) {
            IInsurance(insurance).setUnderlyingTokenPercent(i, allocations[i]);
        }
        IPnL(pnl).recover();
    }

```
