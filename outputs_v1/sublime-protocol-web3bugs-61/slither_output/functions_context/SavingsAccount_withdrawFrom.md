# Context: SavingsAccount.withdrawFrom

**Contract:** `SavingsAccount` (Inherits: ReentrancyGuard, OwnableUpgradeable, ContextUpgradeable, Initializable, ISavingsAccount)
**Signature:** `withdrawFrom(uint256,address,address,address,address,bool) returns (uint256)`
**Method Selector ID:** `0xea975cb3`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `nonReentrant`
  ```solidity
  modifier nonReentrant() {
          // On the first call to nonReentrant, _notEntered will be true
          require(_status != _ENTERED, "ReentrancyGuard: reentrant call");
  
          // Any calls to nonReentrant after this point will fail
          _status = _ENTERED;
  
          _;
  
          // By storing the original value once again, a refund is triggered (see
          // https://eips.ethereum.org/EIPS/eip-2200)
          _status = _NOT_ENTERED;
      }
  ```

### State Variables Interaction
- **Reads:** allowance, balanceInShares
- **Writes:** allowance, balanceInShares

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_amount != 0,SavingsAccount::withdrawFrom Amount must be greater than zero)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IYield.TMP_2606(uint256) = HIGH_LEVEL_CALL, dest:TMP_2605(IYield), function:getSharesForTokens, arguments:['_amount', '_token']  `
- `SafeMath.TMP_2607(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256,string), arguments:['REF_1182', '_amount', 'SavingsAccount::withdrawFrom insufficient balance'] `
- `SafeMath.TMP_2604(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256,string), arguments:['REF_1174', '_amount', 'SavingsAccount::withdrawFrom allowance limit exceeding'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_10
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(_amount != 0,SavingsAccount::withdrawFrom Amount must be greater than zero)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - allowance(_from)(_token)(msg.sender) = allowance(_from)(_token)(msg.sender).sub(_amount,SavingsAccount::withdrawFrom allowance limit exceeding)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - _amount = IYield(_strategy).getSharesForTokens(_amount,_token)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - balanceInShares(_from)(_token)(_strategy) = balanceInShares(_from)(_token)(_strategy).sub(_amount,SavingsAccount::withdrawFrom insufficient balance)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - (_receivedToken,_amountReceived) = _withdraw(_amount,_token,_strategy,_to,_withdrawShares)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - Withdrawn(_from,msg.sender,_amount,_token,_strategy,_withdrawShares)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.RETURN - _amountReceived"]
    Node_10["10: NodeType.EXPRESSION - nonReentrant()"]
    Node_10 --> Node_1
```

### Source Mapping
Declared in: `contracts/SavingsAccount/SavingsAccount.sol` on lines **225** to **249**

```solidity
    function withdrawFrom(
        uint256 _amount,
        address _token,
        address _strategy,
        address _from,
        address payable _to,
        bool _withdrawShares
    ) external override nonReentrant returns (uint256) {
        require(_amount != 0, 'SavingsAccount::withdrawFrom Amount must be greater than zero');

        allowance[_from][_token][msg.sender] = allowance[_from][_token][msg.sender].sub(
            _amount,
            'SavingsAccount::withdrawFrom allowance limit exceeding'
        );

        _amount = IYield(_strategy).getSharesForTokens(_amount, _token);

        balanceInShares[_from][_token][_strategy] = balanceInShares[_from][_token][_strategy].sub(
            _amount,
            'SavingsAccount::withdrawFrom insufficient balance'
        );
        (address _receivedToken, uint256 _amountReceived) = _withdraw(_amount, _token, _strategy, _to, _withdrawShares);
        emit Withdrawn(_from, msg.sender, _amount, _token, _strategy, _withdrawShares);
        return _amountReceived;
    }

```
