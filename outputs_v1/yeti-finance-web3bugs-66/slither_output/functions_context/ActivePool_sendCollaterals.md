# Context: ActivePool.sendCollaterals

**Contract:** `ActivePool` (Inherits: YetiCustomBase, BaseMath, IActivePool, IPool, ICollateralReceiver, CheckContract, Ownable)
**Signature:** `sendCollaterals(address,address[],uint256[]) returns (bool)`
**Method Selector ID:** `0xd0d8c20d`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(len == _amounts.length,AP:Lengths)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `ICollateralReceiver.HIGH_LEVEL_CALL, dest:TMP_104(ICollateralReceiver), function:receiveCollateral, arguments:['_tokens', '_amounts']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - _requireCallerIsBOorTroveMorTMLorSP()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - len = _tokens.length"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - require(bool,string)(len == _amounts.length,AP:Lengths)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - "]
    Node_4 --> Node_7
    Node_5["5: NodeType.STARTLOOP - "]
    Node_5 --> Node_8
    Node_6["6: NodeType.ENDLOOP - "]
    Node_6 --> Node_14
    Node_7["7: NodeType.VARIABLE - "]
    Node_7 --> Node_5
    Node_8["8: NodeType.IFLOOP - i < len"]
    Node_8 --> Node_9
    Node_8 --> Node_6
    Node_9["9: NodeType.EXPRESSION - thisAmount = _amounts(i)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.IF - thisAmount != 0"]
    Node_10 --> Node_11
    Node_10 --> Node_12
    Node_11["11: NodeType.EXPRESSION - _sendCollateral(_to,_tokens(i),thisAmount)"]
    Node_11 --> Node_12
    Node_12["12: NodeType.ENDIF - "]
    Node_12 --> Node_13
    Node_13["13: NodeType.EXPRESSION - ++ i"]
    Node_13 --> Node_8
    Node_14["14: NodeType.IF - _needsUpdateCollateral(_to)"]
    Node_14 --> Node_15
    Node_14 --> Node_16
    Node_15["15: NodeType.EXPRESSION - ICollateralReceiver(_to).receiveCollateral(_tokens,_amounts)"]
    Node_15 --> Node_16
    Node_16["16: NodeType.ENDIF - "]
    Node_16 --> Node_17
    Node_17["17: NodeType.EXPRESSION - CollateralsSent(_tokens,_amounts,_to)"]
    Node_17 --> Node_18
    Node_18["18: NodeType.RETURN - true"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/ActivePool.sol` on lines **159** to **178**

```solidity
    function sendCollaterals(address _to, address[] calldata _tokens, uint[] calldata _amounts) external override returns (bool) {
        _requireCallerIsBOorTroveMorTMLorSP();
        uint256 len = _tokens.length;
        require(len == _amounts.length, "AP:Lengths");
        uint256 thisAmount;
        for (uint256 i; i < len; ++i) {
            thisAmount = _amounts[i];
            if (thisAmount != 0) {
                _sendCollateral(_to, _tokens[i], thisAmount); // reverts if send fails
            }
        }

        if (_needsUpdateCollateral(_to)) {
            ICollateralReceiver(_to).receiveCollateral(_tokens, _amounts);
        }

        emit CollateralsSent(_tokens, _amounts, _to);
        
        return true;
    }

```
