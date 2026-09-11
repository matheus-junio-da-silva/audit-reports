# Context: GovernorAlpha._onlyGuardian

**Contract:** `GovernorAlpha` (Inherits: None)
**Signature:** `_onlyGuardian()`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `private`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** guardian
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(msg.sender == guardian,GovernorAlpha::_onlyGuardian: only guardian can call)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(msg.sender == guardian,GovernorAlpha::_onlyGuardian: only guardian can call)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/governance/GovernorAlpha.sol` on lines **773** to **778**

```solidity
    function _onlyGuardian() private view {
        require(
            msg.sender == guardian,
            "GovernorAlpha::_onlyGuardian: only guardian can call"
        );
    }

```
