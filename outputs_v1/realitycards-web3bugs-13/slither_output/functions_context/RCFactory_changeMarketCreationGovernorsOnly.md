# Context: RCFactory.changeMarketCreationGovernorsOnly

**Contract:** `RCFactory` (Inherits: IRCFactory, NativeMetaTransaction, Ownable, Context)
**Signature:** `changeMarketCreationGovernorsOnly()`
**Method Selector ID:** `0xc0811d5d`
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
- **Reads:** marketCreationGovernorsOnly
- **Writes:** marketCreationGovernorsOnly

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
    Node_1["1: NodeType.EXPRESSION - marketCreationGovernorsOnly = ! marketCreationGovernorsOnly"]
    Node_2["2: NodeType.EXPRESSION - onlyOwner()"]
    Node_2 --> Node_1
```

### Source Mapping
Declared in: `contracts/RCFactory.sol` on lines **310** to **312**

```solidity
    function changeMarketCreationGovernorsOnly() external onlyOwner {
        marketCreationGovernorsOnly = !marketCreationGovernorsOnly;
    }

```
