# Context: yVault.transferFrom

**Contract:** `yVault` (Inherits: ERC20Detailed, ERC20, Context)
**Signature:** `transferFrom(address,address,uint256) returns (bool)`
**Method Selector ID:** `0x23b872dd`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** _allowances
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_3252(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256,string), arguments:['REF_1521', 'amount', 'ERC20: transfer amount exceeds allowance'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - _transfer(sender,recipient,amount)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - _approve(sender,_msgSender(),_allowances(sender)(_msgSender()).sub(amount,ERC20: transfer amount exceeds allowance))"]
    Node_2 --> Node_3
    Node_3["3: NodeType.RETURN - true"]
```

### Source Mapping
Declared in: `contracts/mocks/yVault/yVault.sol` on lines **48** to **56**

```solidity
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) public returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(sender, _msgSender(), _allowances[sender][_msgSender()].sub(amount, 'ERC20: transfer amount exceeds allowance'));
        return true;
    }

```
