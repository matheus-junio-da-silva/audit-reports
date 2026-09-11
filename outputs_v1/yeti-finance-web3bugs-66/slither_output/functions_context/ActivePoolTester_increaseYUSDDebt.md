# Context: ActivePoolTester.increaseYUSDDebt

**Contract:** `ActivePoolTester` (Inherits: ActivePool, YetiCustomBase, BaseMath, IActivePool, IPool, ICollateralReceiver, CheckContract, Ownable)
**Signature:** `increaseYUSDDebt(uint256)`
**Method Selector ID:** `0x420429ca`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** YUSDDebt
- **Writes:** YUSDDebt

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_385(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['YUSDDebt', '_amount'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - _requireCallerIsBOorTroveM()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - YUSDDebt = YUSDDebt.add(_amount)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - ActivePoolYUSDDebtUpdated(YUSDDebt)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/ActivePool.sol` on lines **224** to **228**

```solidity
    function increaseYUSDDebt(uint _amount) external override {
        _requireCallerIsBOorTroveM();
        YUSDDebt  = YUSDDebt.add(_amount);
        emit ActivePoolYUSDDebtUpdated(YUSDDebt);
    }

```
