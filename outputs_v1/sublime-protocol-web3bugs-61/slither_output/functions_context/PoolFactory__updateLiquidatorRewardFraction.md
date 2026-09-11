# Context: PoolFactory._updateLiquidatorRewardFraction

**Contract:** `PoolFactory` (Inherits: IPoolFactory, OwnableUpgradeable, ContextUpgradeable, Initializable)
**Signature:** `_updateLiquidatorRewardFraction(uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** liquidatorRewardFraction

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- None

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - liquidatorRewardFraction = _liquidatorRewardFraction"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - LiquidatorRewardFractionUpdated(_liquidatorRewardFraction)"]
```

### Source Mapping
Declared in: `contracts/Pool/PoolFactory.sol` on lines **644** to **647**

```solidity
    function _updateLiquidatorRewardFraction(uint256 _liquidatorRewardFraction) internal {
        liquidatorRewardFraction = _liquidatorRewardFraction;
        emit LiquidatorRewardFractionUpdated(_liquidatorRewardFraction);
    }

```
