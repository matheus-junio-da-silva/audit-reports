# Context: SavingsAccount.withdrawAll

**Contract:** `SavingsAccount` (Inherits: ReentrancyGuard, OwnableUpgradeable, ContextUpgradeable, Initializable, ISavingsAccount)
**Signature:** `withdrawAll(address) returns (uint256)`
**Method Selector ID:** `0xfa09e630`
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
- **Reads:** balanceInShares, strategyRegistry
- **Writes:** balanceInShares

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IYield.TMP_2633(uint256) = HIGH_LEVEL_CALL, dest:TMP_2632(IYield), function:unlockTokens, arguments:['_token', 'REF_1205']  `
- `IStrategyRegistry.TMP_2626(address[]) = HIGH_LEVEL_CALL, dest:TMP_2625(IStrategyRegistry), function:getStrategies, arguments:[]  `
- `SafeMath.TMP_2634(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['_tokenReceived', '_amount'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_18
    Node_1["1: NodeType.VARIABLE - _strategyList = IStrategyRegistry(strategyRegistry).getStrategies()"]
    Node_1 --> Node_4
    Node_2["2: NodeType.STARTLOOP - "]
    Node_2 --> Node_5
    Node_3["3: NodeType.ENDLOOP - "]
    Node_3 --> Node_13
    Node_4["4: NodeType.VARIABLE - i = 0"]
    Node_4 --> Node_2
    Node_5["5: NodeType.IFLOOP - i < _strategyList.length"]
    Node_5 --> Node_6
    Node_5 --> Node_3
    Node_6["6: NodeType.IF - balanceInShares(msg.sender)(_token)(_strategyList(i)) != 0 && _strategyList(i) != address(0)"]
    Node_6 --> Node_7
    Node_6 --> Node_11
    Node_7["7: NodeType.VARIABLE - _amount = balanceInShares(msg.sender)(_token)(_strategyList(i))"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - _amount = IYield(_strategyList(i)).unlockTokens(_token,balanceInShares(msg.sender)(_token)(_strategyList(i)))"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - _tokenReceived = _tokenReceived.add(_amount)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - delete balanceInShares(msg.sender)(_token)(_strategyList(i))"]
    Node_10 --> Node_11
    Node_11["11: NodeType.ENDIF - "]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - i ++"]
    Node_12 --> Node_5
    Node_13["13: NodeType.IF - _tokenReceived == 0"]
    Node_13 --> Node_14
    Node_13 --> Node_15
    Node_14["14: NodeType.RETURN - 0"]
    Node_15["15: NodeType.ENDIF - "]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - _transfer(_tokenReceived,_token,address(msg.sender))"]
    Node_16 --> Node_17
    Node_17["17: NodeType.EXPRESSION - WithdrawnAll(msg.sender,_tokenReceived,_token)"]
    Node_17 --> Node_19
    Node_18["18: NodeType.EXPRESSION - nonReentrant()"]
    Node_18 --> Node_1
    Node_19["19: NodeType.RETURN - _tokenReceived"]
```

### Source Mapping
Declared in: `contracts/SavingsAccount/SavingsAccount.sol` on lines **286** to **303**

```solidity
    function withdrawAll(address _token) external override nonReentrant returns (uint256 _tokenReceived) {
        address[] memory _strategyList = IStrategyRegistry(strategyRegistry).getStrategies();

        for (uint256 i = 0; i < _strategyList.length; i++) {
            if (balanceInShares[msg.sender][_token][_strategyList[i]] != 0 && _strategyList[i] != address(0)) {
                uint256 _amount = balanceInShares[msg.sender][_token][_strategyList[i]];
                _amount = IYield(_strategyList[i]).unlockTokens(_token, balanceInShares[msg.sender][_token][_strategyList[i]]);
                _tokenReceived = _tokenReceived.add(_amount);
                delete balanceInShares[msg.sender][_token][_strategyList[i]];
            }
        }

        if (_tokenReceived == 0) return 0;

        _transfer(_tokenReceived, _token, payable(msg.sender));

        emit WithdrawnAll(msg.sender, _tokenReceived, _token);
    }

```
