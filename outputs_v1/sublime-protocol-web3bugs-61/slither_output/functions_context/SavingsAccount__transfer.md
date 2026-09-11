# Context: SavingsAccount._transfer

**Contract:** `SavingsAccount` (Inherits: ReentrancyGuard, OwnableUpgradeable, ContextUpgradeable, Initializable, ISavingsAccount)
**Signature:** `_transfer(uint256,address,address)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_success,Transfer failed)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `low-level-call`
- `SafeERC20.LIBRARY_CALL, dest:SafeERC20, function:SafeERC20.safeTransfer(IERC20,address,uint256), arguments:['TMP_2623', '_to', '_amount'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.IF - _token == address(0)"]
    Node_1 --> Node_2
    Node_1 --> Node_5
    Node_2["2: NodeType.VARIABLE - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - (_success,None) = _to.call(value: _amount)()"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - require(bool,string)(_success,Transfer failed)"]
    Node_4 --> Node_6
    Node_5["5: NodeType.EXPRESSION - IERC20(_token).safeTransfer(_to,_amount)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.ENDIF - "]
```

### Source Mapping
Declared in: `contracts/SavingsAccount/SavingsAccount.sol` on lines **269** to **280**

```solidity
    function _transfer(
        uint256 _amount,
        address _token,
        address payable _to
    ) internal {
        if (_token == address(0)) {
            (bool _success, ) = _to.call{value: _amount}('');
            require(_success, 'Transfer failed');
        } else {
            IERC20(_token).safeTransfer(_to, _amount);
        }
    }

```
