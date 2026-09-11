# Context: RCTreasury.changePauseMarket

**Contract:** `RCTreasury` (Inherits: IRCTreasury, NativeMetaTransaction, Ownable, Context)
**Signature:** `changePauseMarket(address)`
**Method Selector ID:** `0x843a19ac`
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
- **Reads:** isMarket, marketPaused
- **Writes:** marketPaused

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(isMarket[_market],This isn't a market)`

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
    Node_0 --> Node_4
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(isMarket(_market),This isn't a market)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - marketPaused(_market) = ! marketPaused(_market)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - LogMarketPaused(_market,marketPaused(_market))"]
    Node_4["4: NodeType.EXPRESSION - onlyOwner()"]
    Node_4 --> Node_1
```

### Source Mapping
Declared in: `contracts/RCTreasury.sol` on lines **194** to **198**

```solidity
    function changePauseMarket(address _market) external override onlyOwner {
        require(isMarket[_market], "This isn't a market");
        marketPaused[_market] = !marketPaused[_market];
        emit LogMarketPaused(_market, marketPaused[_market]);
    }

```
