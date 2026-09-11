# Context: RCFactory.changeGovernorApproval

**Contract:** `RCFactory` (Inherits: IRCFactory, NativeMetaTransaction, Ownable, Context)
**Signature:** `changeGovernorApproval(address)`
**Method Selector ID:** `0xabc1c50a`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyOwner`
  ```solidity
  modifier onlyOwner() {
          require(owner() == _msgSender(), "Ownable: caller is not the owner");
          _;
      }
  ```

### State Variables Interaction
- **Reads:** governors
- **Writes:** governors

### Assertion Checks & Business Requirements
- require/assert: `require(bool)(_governor != address(0))`

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
    Node_0 --> Node_3
    Node_1["1: NodeType.EXPRESSION - require(bool)(_governor != address(0))"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - governors(_governor) = ! governors(_governor)"]
    Node_3["3: NodeType.EXPRESSION - onlyOwner()"]
    Node_3 --> Node_1
```

### Source Mapping
Declared in: `contracts/RCFactory.sol` on lines **372** to **375**

```solidity
    function changeGovernorApproval(address _governor) external onlyOwner {
        require(_governor != address(0));
        governors[_governor] = !governors[_governor];
    }

```
