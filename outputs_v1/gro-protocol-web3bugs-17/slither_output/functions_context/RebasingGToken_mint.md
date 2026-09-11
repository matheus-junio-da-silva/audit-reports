# Context: RebasingGToken.mint

**Contract:** `RebasingGToken` (Inherits: GToken, IToken, Whitelist, Ownable, Constants, GERC20, IERC20, Context)
**Signature:** `mint(address,uint256,uint256)`
**Method Selector ID:** `0x156e29f6`
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
- require/assert: `require(bool,string)(account != address(0),mint: 0x)`
- require/assert: `require(bool,string)(amount > 0,Amount is zero.)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(account != address(0),mint: 0x)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(amount > 0,Amount is zero.)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - mintAmount = applyFactor(amount,_factor,true)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - _mint(account,mintAmount,amount)"]
    Node_5["5: NodeType.EXPRESSION - onlyWhitelist()"]
    Node_5 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/tokens/RebasingGToken.sol` on lines **68** to **79**

```solidity
    function mint(
        address account,
        uint256 _factor,
        uint256 amount
    ) external override onlyWhitelist {
        require(account != address(0), "mint: 0x");
        require(amount > 0, "Amount is zero.");
        // Apply factor to amount to get rebase amount
        uint256 mintAmount = applyFactor(amount, _factor, true);
        // uint256 mintAmount = amount.mul(_factor).div(BASE);
        _mint(account, mintAmount, amount);
    }

```
