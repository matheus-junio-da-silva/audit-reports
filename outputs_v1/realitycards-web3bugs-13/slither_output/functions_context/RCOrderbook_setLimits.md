# Context: RCOrderbook.setLimits

**Contract:** `RCOrderbook` (Inherits: IRCOrderbook, NativeMetaTransaction, Ownable, Context)
**Signature:** `setLimits(uint256,uint256,uint256)`
**Method Selector ID:** `0x189ae5f2`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** uberOwner
- **Writes:** cleaningLoops, maxDeletions, maxSearchIterations

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(msgSender() == uberOwner,Extremely Verboten)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(msgSender() == uberOwner,Extremely Verboten)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.IF - _deletionLimit != 0"]
    Node_2 --> Node_3
    Node_2 --> Node_4
    Node_3["3: NodeType.EXPRESSION - maxDeletions = _deletionLimit"]
    Node_3 --> Node_4
    Node_4["4: NodeType.ENDIF - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.IF - _cleaningLimit != 0"]
    Node_5 --> Node_6
    Node_5 --> Node_7
    Node_6["6: NodeType.EXPRESSION - cleaningLoops = _cleaningLimit"]
    Node_6 --> Node_7
    Node_7["7: NodeType.ENDIF - "]
    Node_7 --> Node_8
    Node_8["8: NodeType.IF - _searchLimit != 0"]
    Node_8 --> Node_9
    Node_8 --> Node_10
    Node_9["9: NodeType.EXPRESSION - maxSearchIterations = _searchLimit"]
    Node_9 --> Node_10
    Node_10["10: NodeType.ENDIF - "]
```

### Source Mapping
Declared in: `contracts/RCOrderbook.sol` on lines **129** to **144**

```solidity
    function setLimits(
        uint256 _deletionLimit,
        uint256 _cleaningLimit,
        uint256 _searchLimit
    ) external override {
        require(msgSender() == uberOwner, "Extremely Verboten");
        if (_deletionLimit != 0) {
            maxDeletions = _deletionLimit;
        }
        if (_cleaningLimit != 0) {
            cleaningLoops = _cleaningLimit;
        }
        if (_searchLimit != 0) {
            maxSearchIterations = _searchLimit;
        }
    }

```
