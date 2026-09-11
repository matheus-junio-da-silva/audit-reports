# Context: DefaultPoolTester.sendCollsToActivePool

**Contract:** `DefaultPoolTester` (Inherits: DefaultPool, YetiCustomBase, BaseMath, IDefaultPool, IPool, ICollateralReceiver, CheckContract, Ownable)
**Signature:** `sendCollsToActivePool(address[],uint256[],address)`
**Method Selector ID:** `0x61ccca58`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** activePoolAddress, whitelist
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(tokensLen == _amounts.length,DP:Length mismatch)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IActivePool.HIGH_LEVEL_CALL, dest:TMP_315(IActivePool), function:receiveCollateral, arguments:['_tokens', '_amounts']  `
- `IWAsset.HIGH_LEVEL_CALL, dest:TMP_311(IWAsset), function:updateReward, arguments:['TMP_312', '_borrower', 'thisAmounts']  `
- `IWAsset.HIGH_LEVEL_CALL, dest:TMP_307(IWAsset), function:endTreasuryReward, arguments:['TMP_308', 'thisAmounts']  `
- `IWhitelist.TMP_306(bool) = HIGH_LEVEL_CALL, dest:whitelist(IWhitelist), function:isWrapped, arguments:['thisToken']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - _requireCallerIsTroveManager()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - tokensLen = _tokens.length"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - require(bool,string)(tokensLen == _amounts.length,DP:Length mismatch)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - "]
    Node_5 --> Node_8
    Node_6["6: NodeType.STARTLOOP - "]
    Node_6 --> Node_9
    Node_7["7: NodeType.ENDLOOP - "]
    Node_7 --> Node_21
    Node_8["8: NodeType.VARIABLE - "]
    Node_8 --> Node_6
    Node_9["9: NodeType.IFLOOP - i < tokensLen"]
    Node_9 --> Node_10
    Node_9 --> Node_7
    Node_10["10: NodeType.EXPRESSION - thisAmounts = _amounts(i)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.IF - thisAmounts != 0"]
    Node_11 --> Node_12
    Node_11 --> Node_19
    Node_12["12: NodeType.EXPRESSION - thisToken = _tokens(i)"]
    Node_12 --> Node_13
    Node_13["13: NodeType.IF - whitelist.isWrapped(thisToken)"]
    Node_13 --> Node_14
    Node_13 --> Node_17
    Node_14["14: NodeType.EXPRESSION - IWAsset(thisToken).endTreasuryReward(address(this),thisAmounts)"]
    Node_14 --> Node_15
    Node_15["15: NodeType.EXPRESSION - _sendCollateral(thisToken,thisAmounts)"]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - IWAsset(thisToken).updateReward(address(this),_borrower,thisAmounts)"]
    Node_16 --> Node_18
    Node_17["17: NodeType.EXPRESSION - _sendCollateral(thisToken,thisAmounts)"]
    Node_17 --> Node_18
    Node_18["18: NodeType.ENDIF - "]
    Node_18 --> Node_19
    Node_19["19: NodeType.ENDIF - "]
    Node_19 --> Node_20
    Node_20["20: NodeType.EXPRESSION - ++ i"]
    Node_20 --> Node_9
    Node_21["21: NodeType.EXPRESSION - IActivePool(activePoolAddress).receiveCollateral(_tokens,_amounts)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/DefaultPool.sol` on lines **131** to **163**

```solidity
    function sendCollsToActivePool(address[] memory _tokens, uint256[] memory _amounts, address _borrower)
        external
        override
    {
        _requireCallerIsTroveManager();
        uint256 tokensLen = _tokens.length;
        require(tokensLen == _amounts.length, "DP:Length mismatch");
        uint256 thisAmounts;
        address thisToken;
        for (uint256 i; i < tokensLen; ++i) {
            thisAmounts = _amounts[i];
            if(thisAmounts != 0) {
                thisToken = _tokens[i];
                
                // If asset is wrapped, then that means it came from the active pool (originally) and we need to update rewards from 
                // the treasury which would have owned the rewards, to the new borrower who will be accumulating this new 
                // reward. 
                if (whitelist.isWrapped(thisToken)) {
                    // This call claims the tokens for the treasury and also transfers them to the default pool as an intermediary so 
                    // that it can transfer.
                    IWAsset(thisToken).endTreasuryReward(address(this), thisAmounts);
                    // Call transfer
                    _sendCollateral(thisToken, thisAmounts);
                    // Then finally transfer rewards to the borrower
                    IWAsset(thisToken).updateReward(address(this), _borrower, thisAmounts);
                } else {
                    // Otherwise just send. 
                    _sendCollateral(thisToken, thisAmounts);
                }
            }
        }
        IActivePool(activePoolAddress).receiveCollateral(_tokens, _amounts);
    }

```
