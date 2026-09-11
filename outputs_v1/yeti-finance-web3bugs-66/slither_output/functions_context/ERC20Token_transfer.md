# Context: ERC20Token.transfer

**Contract:** `ERC20Token` (Inherits: None)
**Signature:** `transfer(address,uint256) returns (bool)`
**Method Selector ID:** `0xa9059cbb`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** balances
- **Writes:** balances

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_num_tokens <= balances[msg.sender],You are trying to transfer more tokens than you have)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_23(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['REF_6', '_num_tokens'] `
- `SafeMath.TMP_22(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['REF_3', '_num_tokens'] `
- `TMP_21(None) = SOLIDITY_CALL require(bool,string)(TMP_20,You are trying to transfer more tokens than you have)`

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(_num_tokens <= balances(msg.sender),You are trying to transfer more tokens than you have)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - balances(msg.sender) = balances(msg.sender).sub(_num_tokens)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - balances(_to) = balances(_to).add(_num_tokens)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - Transfer(msg.sender,_to,_num_tokens)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.RETURN - true"]
    Node_6["6: NodeType.RETURN - success"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TestContracts/TestAssets/ERC20Token.sol` on lines **226** to **233**

```solidity
    function transfer(address _to, uint _num_tokens) public returns (bool success) {
        require(_num_tokens <= balances[msg.sender], "You are trying to transfer more tokens than you have");

        balances[msg.sender] = balances[msg.sender].sub(_num_tokens);
        balances[_to] = balances[_to].add(_num_tokens);
        emit Transfer(msg.sender, _to, _num_tokens);
        return true;
    }

```
