# Context: BorrowerOperations._requireNoDuplicateColls

**Contract:** `BorrowerOperations` (Inherits: ReentrancyGuard, IBorrowerOperations, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `_requireNoDuplicateColls(address[])`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_colls[i] != _colls[j],BO:OverlapColls)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_447(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['i', '1'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - collsLen = _colls.length"]
    Node_1 --> Node_4
    Node_2["2: NodeType.STARTLOOP - "]
    Node_2 --> Node_5
    Node_3["3: NodeType.ENDLOOP - "]
    Node_4["4: NodeType.VARIABLE - "]
    Node_4 --> Node_2
    Node_5["5: NodeType.IFLOOP - i < collsLen"]
    Node_5 --> Node_8
    Node_5 --> Node_3
    Node_6["6: NodeType.STARTLOOP - "]
    Node_6 --> Node_9
    Node_7["7: NodeType.ENDLOOP - "]
    Node_7 --> Node_12
    Node_8["8: NodeType.VARIABLE - j = i.add(1)"]
    Node_8 --> Node_6
    Node_9["9: NodeType.IFLOOP - j < collsLen"]
    Node_9 --> Node_10
    Node_9 --> Node_7
    Node_10["10: NodeType.EXPRESSION - require(bool,string)(_colls(i) != _colls(j),BO:OverlapColls)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - j ++"]
    Node_11 --> Node_9
    Node_12["12: NodeType.EXPRESSION - ++ i"]
    Node_12 --> Node_5
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/BorrowerOperations.sol` on lines **1233** to **1240**

```solidity
    function _requireNoDuplicateColls(address[] memory _colls) internal pure {
        uint256 collsLen = _colls.length;
        for (uint256 i; i < collsLen; ++i) {
            for (uint256 j = i.add(1); j < collsLen; j++) {
                require(_colls[i] != _colls[j], "BO:OverlapColls");
            }
        }
    }

```
