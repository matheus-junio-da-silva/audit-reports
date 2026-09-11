# Context: RCFactory.changeApprovedAffilliatesOnly

**Contract:** `RCFactory` (Inherits: IRCFactory, NativeMetaTransaction, Ownable, Context)
**Signature:** `changeApprovedAffilliatesOnly()`
**Method Selector ID:** `0x2919f2f6`
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
- **Reads:** approvedAffilliatesOnly
- **Writes:** approvedAffilliatesOnly

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
    Node_0 --> Node_2
    Node_1["1: NodeType.EXPRESSION - approvedAffilliatesOnly = ! approvedAffilliatesOnly"]
    Node_2["2: NodeType.EXPRESSION - onlyOwner()"]
    Node_2 --> Node_1
```

### Source Mapping
Declared in: `contracts/RCFactory.sol` on lines **320** to **322**

```solidity
    function changeApprovedAffilliatesOnly() external onlyOwner {
        approvedAffilliatesOnly = !approvedAffilliatesOnly;
    }

```
