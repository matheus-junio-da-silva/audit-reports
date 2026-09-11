# Context: DaiMockup.approve

**Contract:** `DaiMockup` (Inherits: None)
**Signature:** `approve(address,uint256) returns (bool)`
**Method Selector ID:** `0x095ea7b3`
**Visibility:** `external`
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
    Node_1["1: NodeType.EXPRESSION - _address"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - _amount"]
    Node_2 --> Node_3
    Node_3["3: NodeType.RETURN - true"]
```

### Source Mapping
Declared in: `contracts/mockups/DaiMockup.sol` on lines **7** to **15**

```solidity
    function approve(address _address, uint256 _amount)
        external
        pure
        returns (bool)
    {
        _address;
        _amount;
        return true;
    }

```
