# Context: TroveManager.calcDecayedBaseRate

**Contract:** `TroveManager` (Inherits: ReentrancyGuard, ITroveManager, TroveManagerBase, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `calcDecayedBaseRate() returns (uint256)`
**Method Selector ID:** `0x45979978`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** DECIMAL_PRECISION, MINUTE_DECAY_FACTOR, baseRate
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_658(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['baseRate', 'decayFactor'] `
- `LiquityMath.TMP_657(uint256) = LIBRARY_CALL, dest:LiquityMath, function:LiquityMath._decPow(uint256,uint256), arguments:['MINUTE_DECAY_FACTOR', 'minutesPassed'] `
- `SafeMath.TMP_659(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_658', 'DECIMAL_PRECISION'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - minutesPassed = _minutesPassedSinceLastFeeOp()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - decayFactor = LiquityMath._decPow(MINUTE_DECAY_FACTOR,minutesPassed)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.RETURN - baseRate.mul(decayFactor).div(DECIMAL_PRECISION)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TroveManager.sol` on lines **798** to **803**

```solidity
    function calcDecayedBaseRate() public view override returns (uint) {
        uint minutesPassed = _minutesPassedSinceLastFeeOp();
        uint decayFactor = LiquityMath._decPow(MINUTE_DECAY_FACTOR, minutesPassed);

        return baseRate.mul(decayFactor).div(DECIMAL_PRECISION);
    }

```
