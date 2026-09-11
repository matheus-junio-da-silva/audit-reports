# Context: SavingsAccount.transfer

**Contract:** `SavingsAccount` (Inherits: ReentrancyGuard, OwnableUpgradeable, ContextUpgradeable, Initializable, ISavingsAccount)
**Signature:** `transfer(uint256,address,address,address) returns (uint256)`
**Method Selector ID:** `0x89172072`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** balanceInShares
- **Writes:** balanceInShares

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_amount != 0,SavingsAccount::transfer zero amount)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_2663(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['REF_1255', '_amount'] `
- `IYield.TMP_2661(uint256) = HIGH_LEVEL_CALL, dest:TMP_2660(IYield), function:getSharesForTokens, arguments:['_amount', '_token']  `
- `TMP_2657(None) = SOLIDITY_CALL require(bool,string)(TMP_2656,SavingsAccount::transfer zero amount)`
- `SafeMath.TMP_2662(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256,string), arguments:['REF_1248', '_amount', 'SavingsAccount::transfer insufficient funds'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(_amount != 0,SavingsAccount::transfer zero amount)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.IF - _strategy != address(0)"]
    Node_2 --> Node_3
    Node_2 --> Node_4
    Node_3["3: NodeType.EXPRESSION - _amount = IYield(_strategy).getSharesForTokens(_amount,_token)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.ENDIF - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - balanceInShares(msg.sender)(_token)(_strategy) = balanceInShares(msg.sender)(_token)(_strategy).sub(_amount,SavingsAccount::transfer insufficient funds)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - balanceInShares(_to)(_token)(_strategy) = balanceInShares(_to)(_token)(_strategy).add(_amount)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - Transfer(_token,_strategy,msg.sender,_to,_amount)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.RETURN - _amount"]
```

### Source Mapping
Declared in: `contracts/SavingsAccount/SavingsAccount.sol` on lines **393** to **416**

```solidity
    function transfer(
        uint256 _amount,
        address _token,
        address _strategy,
        address _to
    ) external override returns (uint256) {
        require(_amount != 0, 'SavingsAccount::transfer zero amount');

        if (_strategy != address(0)) {
            _amount = IYield(_strategy).getSharesForTokens(_amount, _token);
        }

        balanceInShares[msg.sender][_token][_strategy] = balanceInShares[msg.sender][_token][_strategy].sub(
            _amount,
            'SavingsAccount::transfer insufficient funds'
        );

        //update receiver's balance
        balanceInShares[_to][_token][_strategy] = balanceInShares[_to][_token][_strategy].add(_amount);

        emit Transfer(_token, _strategy, msg.sender, _to, _amount);

        return _amount;
    }

```
