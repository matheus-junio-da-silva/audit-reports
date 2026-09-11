# Context: FluxAggregator.latestRoundData

**Contract:** `FluxAggregator` (Inherits: None)
**Signature:** `latestRoundData() returns (uint80, int256, uint256, uint256, uint80)`
**Method Selector ID:** `0xfeaf968c`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** value
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
    Node_1["1: NodeType.RETURN - (0,value,0,0,0)"]
    Node_2["2: NodeType.RETURN - (roundId,answer,startedAt,updatedAt,answeredInRound)"]
```

### Source Mapping
Declared in: `contracts/mocks/FluxAggregator.sol` on lines **30** to **42**

```solidity
    function latestRoundData()
        external
        view
        returns (
            uint80 roundId,
            int256 answer,
            uint256 startedAt,
            uint256 updatedAt,
            uint80 answeredInRound
        )
    {
        return (0, value, 0, 0, 0);
    }

```
