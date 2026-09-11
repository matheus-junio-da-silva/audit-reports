# Context: LifeGuard3Pool.invest

**Contract:** `LifeGuard3Pool` (Inherits: FixedStablecoins, Constants, Whitelist, Controllable, Ownable, Context, ILifeGuard)
**Signature:** `invest(uint256,uint256[3]) returns (uint256)`
**Method Selector ID:** `0xd7abd678`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** N_COINS, buoy, depositHandler, insurance, lpToken
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(msg.sender == insurance || msg.sender == depositHandler,depositStable: !depositHandler)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IBuoy.TMP_315(uint256) = HIGH_LEVEL_CALL, dest:buoy(IBuoy), function:stableToUsd, arguments:['amounts', 'True']  `
- `IERC20.TMP_310(uint256) = HIGH_LEVEL_CALL, dest:lpToken(IERC20), function:balanceOf, arguments:['TMP_309']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(msg.sender == insurance || msg.sender == depositHandler,depositStable: !depositHandler)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - needSkim = true"]
    Node_2 --> Node_3
    Node_3["3: NodeType.IF - depositAmount == 0"]
    Node_3 --> Node_4
    Node_3 --> Node_6
    Node_4["4: NodeType.EXPRESSION - depositAmount = lpToken.balanceOf(address(this))"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - needSkim = false"]
    Node_5 --> Node_6
    Node_6["6: NodeType.ENDIF - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - "]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - _withdrawUnbalanced(depositAmount,delta)"]
    Node_8 --> Node_11
    Node_9["9: NodeType.STARTLOOP - "]
    Node_9 --> Node_12
    Node_10["10: NodeType.ENDLOOP - "]
    Node_10 --> Node_15
    Node_11["11: NodeType.VARIABLE - i = 0"]
    Node_11 --> Node_9
    Node_12["12: NodeType.IFLOOP - i < N_COINS"]
    Node_12 --> Node_13
    Node_12 --> Node_10
    Node_13["13: NodeType.EXPRESSION - amounts(i) = _investToVault(i,needSkim)"]
    Node_13 --> Node_14
    Node_14["14: NodeType.EXPRESSION - i ++"]
    Node_14 --> Node_12
    Node_15["15: NodeType.EXPRESSION - dollarAmount = buoy.stableToUsd(amounts,true)"]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - LogNewInvest(depositAmount,delta,amounts,dollarAmount,needSkim)"]
    Node_16 --> Node_17
    Node_17["17: NodeType.RETURN - dollarAmount"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/pools/LifeGuard3Pool.sol` on lines **280** to **298**

```solidity
    function invest(uint256 depositAmount, uint256[N_COINS] calldata delta)
        external
        override
        returns (uint256 dollarAmount)
    {
        require(msg.sender == insurance || msg.sender == depositHandler, "depositStable: !depositHandler");
        bool needSkim = true;
        if (depositAmount == 0) {
            depositAmount = lpToken.balanceOf(address(this));
            needSkim = false;
        }
        uint256[N_COINS] memory amounts;
        _withdrawUnbalanced(depositAmount, delta);
        for (uint256 i = 0; i < N_COINS; i++) {
            amounts[i] = _investToVault(i, needSkim);
        }
        dollarAmount = buoy.stableToUsd(amounts, true);
        emit LogNewInvest(depositAmount, delta, amounts, dollarAmount, needSkim);
    }

```
