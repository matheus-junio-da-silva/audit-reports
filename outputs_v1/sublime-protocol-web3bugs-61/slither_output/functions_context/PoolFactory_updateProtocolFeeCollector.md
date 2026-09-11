# Context: PoolFactory.updateProtocolFeeCollector

**Contract:** `PoolFactory` (Inherits: IPoolFactory, OwnableUpgradeable, ContextUpgradeable, Initializable)
**Signature:** `updateProtocolFeeCollector(address)`
**Method Selector ID:** `0x565b54ea`
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
- **Writes:** None

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
    Node_1["1: NodeType.EXPRESSION - _updateProtocolFeeCollector(_protocolFeeCollector)"]
    Node_2["2: NodeType.EXPRESSION - onlyOwner()"]
    Node_2 --> Node_1
```

### Source Mapping
Declared in: `contracts/Pool/PoolFactory.sol` on lines **679** to **681**

```solidity
    function updateProtocolFeeCollector(address _protocolFeeCollector) external onlyOwner {
        _updateProtocolFeeCollector(_protocolFeeCollector);
    }

```
