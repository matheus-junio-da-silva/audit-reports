# Context: StrategyRegistry.addStrategy

**Contract:** `StrategyRegistry` (Inherits: IStrategyRegistry, OwnableUpgradeable, ContextUpgradeable, Initializable)
**Signature:** `addStrategy(address)`
**Method Selector ID:** `0x223e5479`
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
- **Reads:** maxStrategies, registry, strategies
- **Writes:** registry, strategies

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(strategies.length.add(1) <= maxStrategies,StrategyRegistry::addStrategy - Can't add more strategies)`
- require/assert: `require(bool,string)(! registry[_strategy],StrategyRegistry::addStrategy - Strategy already exists)`
- require/assert: `require(bool,string)(_strategy != address(0),StrategyRegistry::addStrategy - _strategy cannot be address(0))`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_3875(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['REF_1679', '1'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_7
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(strategies.length.add(1) <= maxStrategies,StrategyRegistry::addStrategy - Can't add more strategies)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(! registry(_strategy),StrategyRegistry::addStrategy - Strategy already exists)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - require(bool,string)(_strategy != address(0),StrategyRegistry::addStrategy - _strategy cannot be address(0))"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - registry(_strategy) = true"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - strategies.push(_strategy)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - StrategyAdded(_strategy)"]
    Node_7["7: NodeType.EXPRESSION - onlyOwner()"]
    Node_7 --> Node_1
```

### Source Mapping
Declared in: `contracts/yield/StrategyRegistry.sol` on lines **68** to **76**

```solidity
    function addStrategy(address _strategy) external override onlyOwner {
        require(strategies.length.add(1) <= maxStrategies, "StrategyRegistry::addStrategy - Can't add more strategies");
        require(!registry[_strategy], 'StrategyRegistry::addStrategy - Strategy already exists');
        require(_strategy != address(0), 'StrategyRegistry::addStrategy - _strategy cannot be address(0)');
        registry[_strategy] = true;
        strategies.push(_strategy);

        emit StrategyAdded(_strategy);
    }

```
