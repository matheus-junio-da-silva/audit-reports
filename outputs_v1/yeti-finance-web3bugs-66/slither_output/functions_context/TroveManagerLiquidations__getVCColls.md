# Context: TroveManagerLiquidations._getVCColls

**Contract:** `TroveManagerLiquidations` (Inherits: ITroveManagerLiquidations, TroveManagerBase, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `_getVCColls(YetiCustomBase.newColls) returns (uint256)`
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
- `IWhitelist.TMP_348(uint256) = HIGH_LEVEL_CALL, dest:whitelist(IWhitelist), function:getValueVC, arguments:['REF_413', 'REF_415']  `
- `SafeMath.TMP_349(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['VC', 'valueVC'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - tokensLen = _colls.tokens.length"]
    Node_1 --> Node_4
    Node_2["2: NodeType.STARTLOOP - "]
    Node_2 --> Node_5
    Node_3["3: NodeType.ENDLOOP - "]
    Node_3 --> Node_9
    Node_4["4: NodeType.VARIABLE - "]
    Node_4 --> Node_2
    Node_5["5: NodeType.IFLOOP - i < tokensLen"]
    Node_5 --> Node_6
    Node_5 --> Node_3
    Node_6["6: NodeType.VARIABLE - valueVC = whitelist.getValueVC(_colls.tokens(i),_colls.amounts(i))"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - VC = VC.add(valueVC)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - ++ i"]
    Node_8 --> Node_5
    Node_9["9: NodeType.RETURN - VC"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/Dependencies/LiquityBase.sol` on lines **93** to **99**

```solidity
    function _getVCColls(newColls memory _colls) internal view returns (uint VC) {
        uint256 tokensLen = _colls.tokens.length;
        for (uint256 i; i < tokensLen; ++i) {
            uint valueVC = whitelist.getValueVC(_colls.tokens[i], _colls.amounts[i]);
            VC = VC.add(valueVC);
        }
    }

```
