# Context: BorrowerOperations._requireNoOverlapColls

**Contract:** `BorrowerOperations` (Inherits: ReentrancyGuard, IBorrowerOperations, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `_requireNoOverlapColls(address[],address[])`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_colls1[i] != _colls2[j],BO:OverlapColls)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- None

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - colls1Len = _colls1.length"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - colls2Len = _colls2.length"]
    Node_2 --> Node_5
    Node_3["3: NodeType.STARTLOOP - "]
    Node_3 --> Node_6
    Node_4["4: NodeType.ENDLOOP - "]
    Node_5["5: NodeType.VARIABLE - "]
    Node_5 --> Node_3
    Node_6["6: NodeType.IFLOOP - i < colls1Len"]
    Node_6 --> Node_9
    Node_6 --> Node_4
    Node_7["7: NodeType.STARTLOOP - "]
    Node_7 --> Node_10
    Node_8["8: NodeType.ENDLOOP - "]
    Node_8 --> Node_13
    Node_9["9: NodeType.VARIABLE - "]
    Node_9 --> Node_7
    Node_10["10: NodeType.IFLOOP - j < colls2Len"]
    Node_10 --> Node_11
    Node_10 --> Node_8
    Node_11["11: NodeType.EXPRESSION - require(bool,string)(_colls1(i) != _colls2(j),BO:OverlapColls)"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - j ++"]
    Node_12 --> Node_10
    Node_13["13: NodeType.EXPRESSION - ++ i"]
    Node_13 --> Node_6
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/BorrowerOperations.sol` on lines **1220** to **1231**

```solidity
    function _requireNoOverlapColls(address[] calldata _colls1, address[] calldata _colls2)
        internal
        pure
    {
        uint256 colls1Len = _colls1.length;
        uint256 colls2Len = _colls2.length;
        for (uint256 i; i < colls1Len; ++i) {
            for (uint256 j; j < colls2Len; j++) {
                require(_colls1[i] != _colls2[j], "BO:OverlapColls");
            }
        }
    }

```
