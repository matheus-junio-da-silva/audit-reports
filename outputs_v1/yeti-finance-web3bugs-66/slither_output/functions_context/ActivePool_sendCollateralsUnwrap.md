# Context: ActivePool.sendCollateralsUnwrap

**Contract:** `ActivePool` (Inherits: YetiCustomBase, BaseMath, IActivePool, IPool, ICollateralReceiver, CheckContract, Ownable)
**Signature:** `sendCollateralsUnwrap(address,address,address[],uint256[]) returns (bool)`
**Method Selector ID:** `0x3733a133`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** whitelist
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(tokensLen == _amounts.length,AP:Lengths)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IWAsset.HIGH_LEVEL_CALL, dest:TMP_112(IWAsset), function:unwrapFor, arguments:['_from', '_to', 'REF_134']  `
- `IWhitelist.TMP_111(bool) = HIGH_LEVEL_CALL, dest:whitelist(IWhitelist), function:isWrapped, arguments:['REF_131']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - _requireCallerIsBOorTroveMorTMLorSP()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - tokensLen = _tokens.length"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - require(bool,string)(tokensLen == _amounts.length,AP:Lengths)"]
    Node_3 --> Node_6
    Node_4["4: NodeType.STARTLOOP - "]
    Node_4 --> Node_7
    Node_5["5: NodeType.ENDLOOP - "]
    Node_5 --> Node_13
    Node_6["6: NodeType.VARIABLE - "]
    Node_6 --> Node_4
    Node_7["7: NodeType.IFLOOP - i < tokensLen"]
    Node_7 --> Node_8
    Node_7 --> Node_5
    Node_8["8: NodeType.IF - whitelist.isWrapped(_tokens(i))"]
    Node_8 --> Node_9
    Node_8 --> Node_10
    Node_9["9: NodeType.EXPRESSION - IWAsset(_tokens(i)).unwrapFor(_from,_to,_amounts(i))"]
    Node_9 --> Node_11
    Node_10["10: NodeType.EXPRESSION - _sendCollateral(_to,_tokens(i),_amounts(i))"]
    Node_10 --> Node_11
    Node_11["11: NodeType.ENDIF - "]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - ++ i"]
    Node_12 --> Node_7
    Node_13["13: NodeType.RETURN - true"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/ActivePool.sol` on lines **184** to **197**

```solidity
    function sendCollateralsUnwrap(address _from, address _to, address[] calldata _tokens, uint[] calldata _amounts) external override returns (bool) {
        _requireCallerIsBOorTroveMorTMLorSP();
        uint256 tokensLen = _tokens.length;
        require(tokensLen == _amounts.length, "AP:Lengths");
        for (uint256 i; i < tokensLen; ++i) {
            if (whitelist.isWrapped(_tokens[i])) {
                // Collects rewards automatically for that amount and unwraps for the original borrower. 
                IWAsset(_tokens[i]).unwrapFor(_from, _to, _amounts[i]);
            } else {
                _sendCollateral(_to, _tokens[i], _amounts[i]); // reverts if send fails
            }
        }
        return true;
    }

```
