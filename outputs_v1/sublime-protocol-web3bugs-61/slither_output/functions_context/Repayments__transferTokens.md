# Context: Repayments._transferTokens

**Contract:** `Repayments` (Inherits: ReentrancyGuard, IRepayment, Initializable)
**Signature:** `_transferTokens(address,address,address,uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(transferSuccess,_transferTokens: Transfer failed)`
- require/assert: `require(bool,string)(refundSuccess,_transferTokens: Refund failed)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeERC20.LIBRARY_CALL, dest:SafeERC20, function:SafeERC20.safeTransferFrom(IERC20,address,address,uint256), arguments:['TMP_2328', '_from', '_to', '_amount'] `
- `SafeMath.TMP_2326(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['msg.value', '_amount'] `
- `TMP_2327(None) = SOLIDITY_CALL require(bool,string)(refundSuccess,_transferTokens: Refund failed)`
- `TMP_2323(None) = SOLIDITY_CALL require(bool,string)(transferSuccess,_transferTokens: Transfer failed)`
- `low-level-call`

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.IF - _asset == address(0)"]
    Node_1 --> Node_2
    Node_1 --> Node_10
    Node_2["2: NodeType.VARIABLE - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - (transferSuccess,None) = _to.call(value: _amount)()"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - require(bool,string)(transferSuccess,_transferTokens: Transfer failed)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.IF - msg.value != _amount"]
    Node_5 --> Node_6
    Node_5 --> Node_9
    Node_6["6: NodeType.VARIABLE - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - (refundSuccess,None) = address(_from).call(value: msg.value.sub(_amount))()"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - require(bool,string)(refundSuccess,_transferTokens: Refund failed)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.ENDIF - "]
    Node_9 --> Node_11
    Node_10["10: NodeType.EXPRESSION - IERC20(_asset).safeTransferFrom(_from,_to,_amount)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.ENDIF - "]
```

### Source Mapping
Declared in: `contracts/Pool/Repayments.sol` on lines **457** to **473**

```solidity
    function _transferTokens(
        address _from,
        address _to,
        address _asset,
        uint256 _amount
    ) internal {
        if (_asset == address(0)) {
            (bool transferSuccess, ) = _to.call{value: _amount}('');
            require(transferSuccess, '_transferTokens: Transfer failed');
            if (msg.value != _amount) {
                (bool refundSuccess, ) = payable(_from).call{value: msg.value.sub(_amount)}('');
                require(refundSuccess, '_transferTokens: Refund failed');
            }
        } else {
            IERC20(_asset).safeTransferFrom(_from, _to, _amount);
        }
    }

```
