# Context: TroveManagerLiquidations._updateWAssetsRewardOwner

**Contract:** `TroveManagerLiquidations` (Inherits: ITroveManagerLiquidations, TroveManagerBase, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `_updateWAssetsRewardOwner(YetiCustomBase.newColls,address,address)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** whitelist
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IWhitelist.TMP_633(bool) = HIGH_LEVEL_CALL, dest:whitelist(IWhitelist), function:isWrapped, arguments:['token']  `
- `IWAsset.HIGH_LEVEL_CALL, dest:TMP_634(IWAsset), function:updateReward, arguments:['_borrower', '_newOwner', 'REF_970']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - collsLen = _colls.tokens.length"]
    Node_1 --> Node_4
    Node_2["2: NodeType.STARTLOOP - "]
    Node_2 --> Node_5
    Node_3["3: NodeType.ENDLOOP - "]
    Node_4["4: NodeType.VARIABLE - "]
    Node_4 --> Node_2
    Node_5["5: NodeType.IFLOOP - i < collsLen"]
    Node_5 --> Node_6
    Node_5 --> Node_3
    Node_6["6: NodeType.VARIABLE - token = _colls.tokens(i)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.IF - whitelist.isWrapped(token)"]
    Node_7 --> Node_8
    Node_7 --> Node_9
    Node_8["8: NodeType.EXPRESSION - IWAsset(token).updateReward(_borrower,_newOwner,_colls.amounts(i))"]
    Node_8 --> Node_9
    Node_9["9: NodeType.ENDIF - "]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - ++ i"]
    Node_10 --> Node_5
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TroveManagerLiquidations.sol` on lines **867** to **875**

```solidity
    function _updateWAssetsRewardOwner(newColls memory _colls, address _borrower, address _newOwner) internal {
        uint256 collsLen = _colls.tokens.length;
        for (uint256 i; i < collsLen; ++i) {
            address token = _colls.tokens[i];
            if (whitelist.isWrapped(token)) {
                IWAsset(token).updateReward(_borrower, _newOwner, _colls.amounts[i]);
            }
        }
    }

```
