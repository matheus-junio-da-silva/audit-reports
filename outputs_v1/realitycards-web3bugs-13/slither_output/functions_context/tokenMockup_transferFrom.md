# Context: tokenMockup.transferFrom

**Contract:** `tokenMockup` (Inherits: ERC20PresetFixedSupply, ERC20Burnable, ERC20, IERC20Metadata, IERC20, Context)
**Signature:** `transferFrom(address,address,uint256) returns (bool)`
**Method Selector ID:** `0x23b872dd`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** _allowances
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(currentAllowance >= amount,ERC20: transfer amount exceeds allowance)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `TMP_1809(None) = SOLIDITY_CALL require(bool,string)(TMP_1808,ERC20: transfer amount exceeds allowance)`

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - _transfer(sender,recipient,amount)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - currentAllowance = _allowances(sender)(_msgSender())"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - require(bool,string)(currentAllowance >= amount,ERC20: transfer amount exceeds allowance)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - _approve(sender,_msgSender(),currentAllowance - amount)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.RETURN - true"]
```

### Source Mapping
Declared in: `node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol` on lines **148** to **156**

```solidity
    function transferFrom(address sender, address recipient, uint256 amount) public virtual override returns (bool) {
        _transfer(sender, recipient, amount);

        uint256 currentAllowance = _allowances[sender][_msgSender()];
        require(currentAllowance >= amount, "ERC20: transfer amount exceeds allowance");
        _approve(sender, _msgSender(), currentAllowance - amount);

        return true;
    }

```
