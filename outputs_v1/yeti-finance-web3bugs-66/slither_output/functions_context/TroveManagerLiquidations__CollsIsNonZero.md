# Context: TroveManagerLiquidations._CollsIsNonZero

**Contract:** `TroveManagerLiquidations` (Inherits: ITroveManagerLiquidations, TroveManagerBase, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `_CollsIsNonZero(YetiCustomBase.newColls) returns (bool)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

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
    Node_1["1: NodeType.VARIABLE - tokensLen = _colls.tokens.length"]
    Node_1 --> Node_4
    Node_2["2: NodeType.STARTLOOP - "]
    Node_2 --> Node_5
    Node_3["3: NodeType.ENDLOOP - "]
    Node_3 --> Node_10
    Node_4["4: NodeType.VARIABLE - "]
    Node_4 --> Node_2
    Node_5["5: NodeType.IFLOOP - i < tokensLen"]
    Node_5 --> Node_6
    Node_5 --> Node_3
    Node_6["6: NodeType.IF - _colls.amounts(i) != 0"]
    Node_6 --> Node_7
    Node_6 --> Node_8
    Node_7["7: NodeType.RETURN - true"]
    Node_8["8: NodeType.ENDIF - "]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - ++ i"]
    Node_9 --> Node_5
    Node_10["10: NodeType.RETURN - false"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/Dependencies/LiquityBase.sol` on lines **131** to **139**

```solidity
    function _CollsIsNonZero(newColls memory _colls) internal pure returns (bool) {
        uint256 tokensLen = _colls.tokens.length;
        for (uint256 i; i < tokensLen; ++i) {
            if (_colls.amounts[i] != 0) {
                return true;
            }
        }
        return false;
    }

```
