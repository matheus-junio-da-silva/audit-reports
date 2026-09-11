# Context: PoolFactory.isWithinLimits

**Contract:** `PoolFactory` (Inherits: IPoolFactory, OwnableUpgradeable, ContextUpgradeable, Initializable)
**Signature:** `isWithinLimits(uint256,uint256,uint256) returns (bool)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

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
    Node_1["1: NodeType.IF - _min != 0 && _max != 0"]
    Node_1 --> Node_2
    Node_1 --> Node_3
    Node_2["2: NodeType.RETURN - (_value >= _min && _value <= _max)"]
    Node_3["3: NodeType.IF - _min != 0"]
    Node_3 --> Node_4
    Node_3 --> Node_5
    Node_4["4: NodeType.RETURN - (_value >= _min)"]
    Node_5["5: NodeType.IF - _max != 0"]
    Node_5 --> Node_6
    Node_5 --> Node_7
    Node_6["6: NodeType.RETURN - (_value <= _max)"]
    Node_7["7: NodeType.RETURN - true"]
```

### Source Mapping
Declared in: `contracts/Pool/PoolFactory.sol` on lines **423** to **437**

```solidity
    function isWithinLimits(
        uint256 _value,
        uint256 _min,
        uint256 _max
    ) internal pure returns (bool) {
        if (_min != 0 && _max != 0) {
            return (_value >= _min && _value <= _max);
        } else if (_min != 0) {
            return (_value >= _min);
        } else if (_max != 0) {
            return (_value <= _max);
        } else {
            return true;
        }
    }

```
