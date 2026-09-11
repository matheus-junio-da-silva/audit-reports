# Context: StabilityPool._sendGainsToDepositor

**Contract:** `StabilityPool` (Inherits: IStabilityPool, ICollateralReceiver, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `_sendGainsToDepositor(address,address[],uint256[])`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** totalColl, whitelist
- **Writes:** totalColl

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(assetsLen == amounts.length,SP:Length mismatch)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeERC20.LIBRARY_CALL, dest:SafeERC20, function:SafeERC20.safeTransfer(IERC20,address,uint256), arguments:['TMP_584', '_to', 'thisAmounts'] `
- `IWAsset.HIGH_LEVEL_CALL, dest:TMP_578(IWAsset), function:endTreasuryReward, arguments:['TMP_579', 'thisAmounts']  `
- `IWAsset.HIGH_LEVEL_CALL, dest:TMP_581(IWAsset), function:unwrapFor, arguments:['TMP_582', '_to', 'thisAmounts']  `
- `IWhitelist.TMP_577(bool) = HIGH_LEVEL_CALL, dest:whitelist(IWhitelist), function:isWrapped, arguments:['thisAsset']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - assetsLen = assets.length"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(assetsLen == amounts.length,SP:Length mismatch)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - "]
    Node_4 --> Node_7
    Node_5["5: NodeType.STARTLOOP - "]
    Node_5 --> Node_8
    Node_6["6: NodeType.ENDLOOP - "]
    Node_6 --> Node_17
    Node_7["7: NodeType.VARIABLE - "]
    Node_7 --> Node_5
    Node_8["8: NodeType.IFLOOP - i < assetsLen"]
    Node_8 --> Node_9
    Node_8 --> Node_6
    Node_9["9: NodeType.EXPRESSION - thisAmounts = amounts(i)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - thisAsset = assets(i)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.IF - whitelist.isWrapped(thisAsset)"]
    Node_11 --> Node_12
    Node_11 --> Node_14
    Node_12["12: NodeType.EXPRESSION - IWAsset(thisAsset).endTreasuryReward(address(this),thisAmounts)"]
    Node_12 --> Node_13
    Node_13["13: NodeType.EXPRESSION - IWAsset(thisAsset).unwrapFor(address(this),_to,thisAmounts)"]
    Node_13 --> Node_15
    Node_14["14: NodeType.EXPRESSION - IERC20(thisAsset).safeTransfer(_to,thisAmounts)"]
    Node_14 --> Node_15
    Node_15["15: NodeType.ENDIF - "]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - ++ i"]
    Node_16 --> Node_8
    Node_17["17: NodeType.EXPRESSION - totalColl.amounts = _leftSubColls(totalColl,assets,amounts)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/StabilityPool.sol` on lines **940** to **962**

```solidity
    function _sendGainsToDepositor(
        address _to,
        address[] memory assets,
        uint256[] memory amounts
    ) internal {
        uint256 assetsLen = assets.length;
        require(assetsLen == amounts.length, "SP:Length mismatch");
        uint256 thisAmounts;
        address thisAsset;
        for (uint256 i; i < assetsLen; ++i) {
            thisAmounts = amounts[i];
            thisAsset = assets[i];
            if (whitelist.isWrapped(thisAsset)) {
                // In this case update the rewards from the treasury to the caller 
                IWAsset(thisAsset).endTreasuryReward(address(this), thisAmounts);
                // unwrapFor ends the rewards for the caller and transfers the tokens to the _to param. 
                IWAsset(thisAsset).unwrapFor(address(this), _to, thisAmounts);
            } else {
                IERC20(thisAsset).safeTransfer(_to, thisAmounts);
            }
        }
        totalColl.amounts = _leftSubColls(totalColl, assets, amounts);
    }

```
