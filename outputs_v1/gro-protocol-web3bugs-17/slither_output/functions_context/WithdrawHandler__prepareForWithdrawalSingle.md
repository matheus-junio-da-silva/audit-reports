# Context: WithdrawHandler._prepareForWithdrawalSingle

**Contract:** `WithdrawHandler` (Inherits: IWithdrawHandler, FixedVaults, FixedStablecoins, Constants, Controllable, Ownable, Context)
**Signature:** `_prepareForWithdrawalSingle(address,bool,uint256,uint256,uint256) returns (uint256, uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `private`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** insurance, lg
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(minAmount <= amount,!prepareForWithdrawalSingle: !minAmount)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IInsurance.TMP_140(bool) = HIGH_LEVEL_CALL, dest:insurance(IInsurance), function:rebalanceForWithdraw, arguments:['withdrawUsd', 'pwrd']  `
- `ILifeGuard.TMP_141(uint256) = HIGH_LEVEL_CALL, dest:lg(ILifeGuard), function:depositStable, arguments:['False']  `
- `ILifeGuard.TUPLE_3(uint256,uint256) = HIGH_LEVEL_CALL, dest:lg(ILifeGuard), function:withdrawSingleByLiquidity, arguments:['index', 'minAmount', 'account']  `
- `ILifeGuard.TUPLE_4(uint256,uint256) = HIGH_LEVEL_CALL, dest:lg(ILifeGuard), function:withdrawSingleByExchange, arguments:['index', 'minAmount', 'account']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - curve = insurance.rebalanceForWithdraw(withdrawUsd,pwrd)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.IF - curve"]
    Node_2 --> Node_3
    Node_2 --> Node_5
    Node_3["3: NodeType.EXPRESSION - lg.depositStable(false)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - (dollarAmount,amount) = lg.withdrawSingleByLiquidity(index,minAmount,account)"]
    Node_4 --> Node_6
    Node_5["5: NodeType.EXPRESSION - (dollarAmount,amount) = lg.withdrawSingleByExchange(index,minAmount,account)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.ENDIF - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - require(bool,string)(minAmount <= amount,!prepareForWithdrawalSingle: !minAmount)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.RETURN - (dollarAmount,amount)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/WithdrawHandler.sol` on lines **347** to **362**

```solidity
    function _prepareForWithdrawalSingle(
        address account,
        bool pwrd,
        uint256 index,
        uint256 minAmount,
        uint256 withdrawUsd
    ) private returns (uint256 dollarAmount, uint256 amount) {
        bool curve = insurance.rebalanceForWithdraw(withdrawUsd, pwrd);
        if (curve) {
            lg.depositStable(false);
            (dollarAmount, amount) = lg.withdrawSingleByLiquidity(index, minAmount, account);
        } else {
            (dollarAmount, amount) = lg.withdrawSingleByExchange(index, minAmount, account);
        }
        require(minAmount <= amount, "!prepareForWithdrawalSingle: !minAmount");
    }

```
