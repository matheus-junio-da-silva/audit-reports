# Context: SafeMathUpgradeable.sub

**Contract:** `SafeMathUpgradeable` (Inherits: None)
**Signature:** `sub(uint256,uint256) returns (uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(b <= a,SafeMath: subtraction overflow)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(b <= a,SafeMath: subtraction overflow)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.RETURN - a - b"]
```

### Source Mapping
Declared in: `node_modules/@openzeppelin/contracts-upgradeable/math/SafeMathUpgradeable.sol` on lines **101** to **104**

```solidity
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a, "SafeMath: subtraction overflow");
        return a - b;
    }

```
