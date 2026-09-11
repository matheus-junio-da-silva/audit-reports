# Context: RCFactory.setSponsorshipRequired

**Contract:** `RCFactory` (Inherits: IRCFactory, NativeMetaTransaction, Ownable, Context)
**Signature:** `setSponsorshipRequired(uint256)`
**Method Selector ID:** `0xea761fdd`
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
- **Reads:** None
- **Writes:** sponsorshipRequired

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
    Node_1["1: NodeType.EXPRESSION - sponsorshipRequired = _amount"]
    Node_2["2: NodeType.EXPRESSION - onlyOwner()"]
    Node_2 --> Node_1
```

### Source Mapping
Declared in: `contracts/RCFactory.sol` on lines **326** to **328**

```solidity
    function setSponsorshipRequired(uint256 _amount) external onlyOwner {
        sponsorshipRequired = _amount;
    }

```
