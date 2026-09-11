# Context: SortedTrovesBOTester._leftSumColls

**Contract:** `SortedTrovesBOTester` (Inherits: BorrowerOperations, ReentrancyGuard, IBorrowerOperations, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `_leftSumColls(YetiCustomBase.newColls,address[],uint256[]) returns (uint256[])`
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
- `SafeMath.TMP_1193(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['REF_1404', 'REF_1406'] `
- `IWhitelist.TMP_1192(uint256) = HIGH_LEVEL_CALL, dest:whitelist(IWhitelist), function:getIndex, arguments:['REF_1402']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - sumAmounts = _getArrayCopy(_coll1.amounts)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - coll1Len = _tokens.length"]
    Node_2 --> Node_5
    Node_3["3: NodeType.STARTLOOP - "]
    Node_3 --> Node_6
    Node_4["4: NodeType.ENDLOOP - "]
    Node_4 --> Node_10
    Node_5["5: NodeType.VARIABLE - "]
    Node_5 --> Node_3
    Node_6["6: NodeType.IFLOOP - i < coll1Len"]
    Node_6 --> Node_7
    Node_6 --> Node_4
    Node_7["7: NodeType.VARIABLE - tokenIndex = whitelist.getIndex(_tokens(i))"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - sumAmounts(tokenIndex) = sumAmounts(tokenIndex).add(_amounts(i))"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - ++ i"]
    Node_9 --> Node_6
    Node_10["10: NodeType.RETURN - sumAmounts"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/Dependencies/YetiCustomBase.sol` on lines **99** to **114**

```solidity
    function _leftSumColls(
        newColls memory _coll1,
        address[] memory _tokens,
        uint256[] memory _amounts
    ) internal view returns (uint[] memory) {
        uint[] memory sumAmounts = _getArrayCopy(_coll1.amounts);

        uint256 coll1Len = _tokens.length;
        // assumes that sumAmounts length = whitelist tokens length.
        for (uint256 i; i < coll1Len; ++i) {
            uint tokenIndex = whitelist.getIndex(_tokens[i]);
            sumAmounts[tokenIndex] = sumAmounts[tokenIndex].add(_amounts[i]);
        }

        return sumAmounts;
    }

```
