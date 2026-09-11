# Context: PoolFactory.updateidealCollateralRatioLimit

**Contract:** `PoolFactory` (Inherits: IPoolFactory, OwnableUpgradeable, ContextUpgradeable, Initializable)
**Signature:** `updateidealCollateralRatioLimit(uint256,uint256)`
**Method Selector ID:** `0xba9a2ba0`
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
- **Writes:** idealCollateralRatioLimit

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
    Node_1["1: NodeType.EXPRESSION - idealCollateralRatioLimit = Limits(_min,_max)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - LimitsUpdated(CollateralRatio,_min,_max)"]
    Node_3["3: NodeType.EXPRESSION - onlyOwner()"]
    Node_3 --> Node_1
```

### Source Mapping
Declared in: `contracts/Pool/PoolFactory.sol` on lines **703** to **706**

```solidity
    function updateidealCollateralRatioLimit(uint256 _min, uint256 _max) external onlyOwner {
        idealCollateralRatioLimit = Limits(_min, _max);
        emit LimitsUpdated('CollateralRatio', _min, _max);
    }

```
