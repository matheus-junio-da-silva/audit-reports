# Context: Token.mint

**Contract:** `Token` (Inherits: Ownable, ERC20, IERC20, Context)
**Signature:** `mint(address,uint256)`
**Method Selector ID:** `0x40c10f19`
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

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_amount != 0,Token::burn: invalid amount)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(_amount != 0,Token::burn: invalid amount)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - _mint(_to,_amount)"]
    Node_3["3: NodeType.EXPRESSION - onlyOwner()"]
    Node_3 --> Node_1
```

### Source Mapping
Declared in: `contracts/mocks/Token.sol` on lines **16** to **19**

```solidity
    function mint(address _to, uint256 _amount) external onlyOwner {
        require(_amount != 0, 'Token::burn: invalid amount');
        _mint(_to, _amount);
    }

```
