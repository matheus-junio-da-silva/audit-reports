# Context: RebasingGToken.burnAll

**Contract:** `RebasingGToken` (Inherits: GToken, IToken, Whitelist, Ownable, Constants, GERC20, IERC20, Context)
**Signature:** `burnAll(address)`
**Method Selector ID:** `0x7e9d2ac1`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyWhitelist`
  ```solidity
  modifier onlyWhitelist() {
          require(whitelist[msg.sender], "only whitelist");
          _;
      }
  ```

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(account != address(0),burnAll: 0x)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(account != address(0),burnAll: 0x)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - burnAmount = balanceOfBase(account)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - amount = applyFactor(burnAmount,factor(),false)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - _burn(account,burnAmount,amount)"]
    Node_5["5: NodeType.EXPRESSION - onlyWhitelist()"]
    Node_5 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/tokens/RebasingGToken.sol` on lines **100** to **107**

```solidity
    function burnAll(address account) external override onlyWhitelist {
        require(account != address(0), "burnAll: 0x");
        uint256 burnAmount = balanceOfBase(account);
        uint256 amount = applyFactor(burnAmount, factor(), false);
        // uint256 amount = burnAmount.mul(BASE).div(factor());
        // Apply factor to amount to get rebase amount
        _burn(account, burnAmount, amount);
    }

```
