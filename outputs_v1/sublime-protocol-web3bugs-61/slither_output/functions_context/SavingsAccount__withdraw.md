# Context: SavingsAccount._withdraw

**Contract:** `SavingsAccount` (Inherits: ReentrancyGuard, OwnableUpgradeable, ContextUpgradeable, Initializable, ISavingsAccount)
**Signature:** `_withdraw(uint256,address,address,address,bool) returns (address, uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_tokenReceived != address(0),Liquidity Tokens address cannot be address(0))`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IYield.TMP_2616(uint256) = HIGH_LEVEL_CALL, dest:TMP_2615(IYield), function:unlockShares, arguments:['_tokenReceived', '_amount']  `
- `IYield.TMP_2618(uint256) = HIGH_LEVEL_CALL, dest:TMP_2617(IYield), function:unlockTokens, arguments:['_token', '_amount']  `
- `IYield.TMP_2611(address) = HIGH_LEVEL_CALL, dest:TMP_2610(IYield), function:liquidityToken, arguments:['_token']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.IF - _withdrawShares"]
    Node_1 --> Node_2
    Node_1 --> Node_5
    Node_2["2: NodeType.EXPRESSION - _tokenReceived = IYield(_strategy).liquidityToken(_token)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - require(bool,string)(_tokenReceived != address(0),Liquidity Tokens address cannot be address(0))"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - _amountReceived = IYield(_strategy).unlockShares(_tokenReceived,_amount)"]
    Node_4 --> Node_7
    Node_5["5: NodeType.EXPRESSION - _tokenReceived = _token"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - _amountReceived = IYield(_strategy).unlockTokens(_token,_amount)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.ENDIF - "]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - _transfer(_amountReceived,_tokenReceived,_to)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.RETURN - (_tokenReceived,_amountReceived)"]
```

### Source Mapping
Declared in: `contracts/SavingsAccount/SavingsAccount.sol` on lines **251** to **267**

```solidity
    function _withdraw(
        uint256 _amount,
        address _token,
        address _strategy,
        address payable _to,
        bool _withdrawShares
    ) internal returns (address _tokenReceived, uint256 _amountReceived) {
        if (_withdrawShares) {
            _tokenReceived = IYield(_strategy).liquidityToken(_token);
            require(_tokenReceived != address(0), 'Liquidity Tokens address cannot be address(0)');
            _amountReceived = IYield(_strategy).unlockShares(_tokenReceived, _amount);
        } else {
            _tokenReceived = _token;
            _amountReceived = IYield(_strategy).unlockTokens(_token, _amount);
        }
        _transfer(_amountReceived, _tokenReceived, _to);
    }

```
