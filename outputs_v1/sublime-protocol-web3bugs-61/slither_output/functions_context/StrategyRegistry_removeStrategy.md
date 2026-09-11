# Context: StrategyRegistry.removeStrategy

**Contract:** `StrategyRegistry` (Inherits: IStrategyRegistry, OwnableUpgradeable, ContextUpgradeable, Initializable)
**Signature:** `removeStrategy(uint256)`
**Method Selector ID:** `0xc0cbbca6`
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
- **Reads:** strategies
- **Writes:** registry, strategies

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_3888(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256,string), arguments:['REF_1688', '1', 'StrategyRegistry::removeStrategy - No strategies exist'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_6
    Node_1["1: NodeType.VARIABLE - _strategy = strategies(_strategyIndex)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - strategies(_strategyIndex) = strategies(strategies.length.sub(1,StrategyRegistry::removeStrategy - No strategies exist))"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - strategies.pop()"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - registry(_strategy) = false"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - StrategyRemoved(_strategy)"]
    Node_6["6: NodeType.EXPRESSION - onlyOwner()"]
    Node_6 --> Node_1
```

### Source Mapping
Declared in: `contracts/yield/StrategyRegistry.sol` on lines **82** to **89**

```solidity
    function removeStrategy(uint256 _strategyIndex) external override onlyOwner {
        address _strategy = strategies[_strategyIndex];
        strategies[_strategyIndex] = strategies[strategies.length.sub(1, 'StrategyRegistry::removeStrategy - No strategies exist')];
        strategies.pop();
        registry[_strategy] = false;

        emit StrategyRemoved(_strategy);
    }

```
