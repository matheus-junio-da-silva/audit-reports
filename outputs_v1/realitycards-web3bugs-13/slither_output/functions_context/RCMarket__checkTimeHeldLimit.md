# Context: RCMarket._checkTimeHeldLimit

**Contract:** `RCMarket` (Inherits: IRCMarket, NativeMetaTransaction, Initializable)
**Signature:** `_checkTimeHeldLimit(uint256) returns (uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** minRentalDayDivisor
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_timeHeldLimit >= _minRentalTime,Limit too low)`

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
    Node_1["1: NodeType.IF - _timeHeldLimit == 0"]
    Node_1 --> Node_2
    Node_1 --> Node_3
    Node_2["2: NodeType.RETURN - 0"]
    Node_3["3: NodeType.VARIABLE - _minRentalTime = uint256(86400) / minRentalDayDivisor"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - require(bool,string)(_timeHeldLimit >= _minRentalTime,Limit too low)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.RETURN - _timeHeldLimit"]
```

### Source Mapping
Declared in: `contracts/RCMarket.sol` on lines **736** to **748**

```solidity
    function _checkTimeHeldLimit(uint256 _timeHeldLimit)
        internal
        view
        returns (uint256)
    {
        if (_timeHeldLimit == 0) {
            return 0;
        } else {
            uint256 _minRentalTime = uint256(1 days) / minRentalDayDivisor;
            require(_timeHeldLimit >= _minRentalTime, "Limit too low");
            return _timeHeldLimit;
        }
    }

```
