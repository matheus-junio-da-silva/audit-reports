# Context: LifeGuard3Pool.distributeCurveVault

**Contract:** `LifeGuard3Pool` (Inherits: FixedStablecoins, Constants, Whitelist, Controllable, Ownable, Context, ILifeGuard)
**Signature:** `distributeCurveVault(uint256,uint256[3]) returns (uint256[3])`
**Method Selector ID:** `0x424c4026`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** N_COINS, controller
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(msg.sender == controller,distributeCurveVault: !controller)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IController.TMP_209(address) = HIGH_LEVEL_CALL, dest:TMP_208(IController), function:curveVault, arguments:[]  `
- `IVault.HIGH_LEVEL_CALL, dest:vault(IVault), function:withdraw, arguments:['amount']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(msg.sender == controller,distributeCurveVault: !controller)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - vault = IVault(_controller().curveVault())"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - vault.withdraw(amount)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - _withdrawUnbalanced(amount,delta)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - "]
    Node_5 --> Node_8
    Node_6["6: NodeType.STARTLOOP - "]
    Node_6 --> Node_9
    Node_7["7: NodeType.ENDLOOP - "]
    Node_7 --> Node_12
    Node_8["8: NodeType.VARIABLE - i = 0"]
    Node_8 --> Node_6
    Node_9["9: NodeType.IFLOOP - i < N_COINS"]
    Node_9 --> Node_10
    Node_9 --> Node_7
    Node_10["10: NodeType.EXPRESSION - amounts(i) = _investToVault(i,false)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - i ++"]
    Node_11 --> Node_9
    Node_12["12: NodeType.RETURN - amounts"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/pools/LifeGuard3Pool.sol` on lines **142** to **157**

```solidity
    function distributeCurveVault(uint256 amount, uint256[N_COINS] memory delta)
        external
        override
        returns (uint256[N_COINS] memory)
    {
        require(msg.sender == controller, "distributeCurveVault: !controller");
        IVault vault = IVault(_controller().curveVault());

        vault.withdraw(amount);
        _withdrawUnbalanced(amount, delta);
        uint256[N_COINS] memory amounts;
        for (uint256 i = 0; i < N_COINS; i++) {
            amounts[i] = _investToVault(i, false);
        }
        return amounts;
    }

```
