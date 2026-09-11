# Context: GERC20._transfer

**Contract:** `GERC20` (Inherits: IERC20, Context)
**Signature:** `_transfer(address,address,uint256,uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** _balances
- **Writes:** _balances

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(sender != address(0),ERC20: transfer from the zero address)`
- require/assert: `require(bool,string)(recipient != address(0),ERC20: transfer to the zero address)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_25(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['REF_16', 'transferAmount'] `
- `TMP_22(None) = SOLIDITY_CALL require(bool,string)(TMP_21,ERC20: transfer to the zero address)`
- `TMP_19(None) = SOLIDITY_CALL require(bool,string)(TMP_18,ERC20: transfer from the zero address)`
- `SafeMath.TMP_24(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256,string), arguments:['REF_13', 'transferAmount', 'ERC20: transfer amount exceeds balance'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(sender != address(0),ERC20: transfer from the zero address)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(recipient != address(0),ERC20: transfer to the zero address)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - _beforeTokenTransfer(sender,recipient,transferAmount)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - _balances(sender) = _balances(sender).sub(transferAmount,ERC20: transfer amount exceeds balance)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - _balances(recipient) = _balances(recipient).add(transferAmount)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - Transfer(sender,recipient,amount)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/tokens/GERC20.sol` on lines **225** to **239**

```solidity
    function _transfer(
        address sender,
        address recipient,
        uint256 transferAmount,
        uint256 amount
    ) internal virtual {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _beforeTokenTransfer(sender, recipient, transferAmount);

        _balances[sender] = _balances[sender].sub(transferAmount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].add(transferAmount);
        emit Transfer(sender, recipient, amount);
    }

```
