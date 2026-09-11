# Context: StrategyRegistry.updateStrategy

**Contract:** `StrategyRegistry` (Inherits: IStrategyRegistry, OwnableUpgradeable, ContextUpgradeable, Initializable)
**Signature:** `updateStrategy(uint256,address,address)`
**Method Selector ID:** `0x76ba717b`
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
- **Reads:** registry, strategies
- **Writes:** registry, strategies

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(strategies[_strategyIndex] == _oldStrategy,StrategyRegistry::updateStrategy - index to update and strategy address don't match)`
- require/assert: `require(bool,string)(! registry[_newStrategy],StrategyRegistry::updateStrategy - New strategy already exists)`

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
    Node_0 --> Node_8
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(strategies(_strategyIndex) == _oldStrategy,StrategyRegistry::updateStrategy - index to update and strategy address don't match)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(! registry(_newStrategy),StrategyRegistry::updateStrategy - New strategy already exists)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - strategies(_strategyIndex) = _newStrategy"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - registry(_oldStrategy) = false"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - StrategyRemoved(_oldStrategy)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - registry(_newStrategy) = true"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - StrategyAdded(_newStrategy)"]
    Node_8["8: NodeType.EXPRESSION - onlyOwner()"]
    Node_8 --> Node_1
```

### Source Mapping
Declared in: `contracts/yield/StrategyRegistry.sol` on lines **97** to **113**

```solidity
    function updateStrategy(
        uint256 _strategyIndex,
        address _oldStrategy,
        address _newStrategy
    ) external override onlyOwner {
        require(
            strategies[_strategyIndex] == _oldStrategy,
            "StrategyRegistry::updateStrategy - index to update and strategy address don't match"
        );
        require(!registry[_newStrategy], 'StrategyRegistry::updateStrategy - New strategy already exists');
        strategies[_strategyIndex] = _newStrategy;

        registry[_oldStrategy] = false;
        emit StrategyRemoved(_oldStrategy);
        registry[_newStrategy] = true;
        emit StrategyAdded(_newStrategy);
    }

```
