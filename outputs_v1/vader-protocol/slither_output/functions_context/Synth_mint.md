# Context: Synth.mint

**Contract:** `Synth` (Inherits: iERC20)
**Signature:** `mint(address,uint256)`
**Method Selector ID:** `0x40c10f19`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyFACTORY`
  ```solidity
  modifier onlyFACTORY() {
          require(msg.sender == FACTORY, "!FACTORY");
          _;
      }
  ```

### State Variables Interaction
- **Reads:** _balances, totalSupply
- **Writes:** _balances, totalSupply

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(account != address(0),recipient)`

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
    Node_0 --> Node_5
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(account != address(0),recipient)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - totalSupply += amount"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - _balances(account) += amount"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - Transfer(address(0),account,amount)"]
    Node_5["5: NodeType.EXPRESSION - onlyFACTORY()"]
    Node_5 --> Node_1
```

### Source Mapping
Declared in: `contracts/Synth.sol` on lines **86** to **91**

```solidity
    function mint(address account, uint amount) external virtual onlyFACTORY {
        require(account != address(0), "recipient");
        totalSupply += amount;
        _balances[account] += amount;
        emit Transfer(address(0), account, amount);
    }

```
