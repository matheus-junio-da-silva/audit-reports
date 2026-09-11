# Context: TroveManager.updateTroves

**Contract:** `TroveManager` (Inherits: ReentrancyGuard, ITroveManager, TroveManagerBase, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `updateTroves(address[],address[],address[])`
**Method Selector ID:** `0x3bc8913e`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_borrowers.length == lowerHintsLen,TM: borrowers length mismatch)`
- require/assert: `require(bool,string)(lowerHintsLen == _upperHints.length,TM: hints length mismatch)`

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
    Node_1["1: NodeType.VARIABLE - lowerHintsLen = _lowerHints.length"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(_borrowers.length == lowerHintsLen,TM: borrowers length mismatch)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - require(bool,string)(lowerHintsLen == _upperHints.length,TM: hints length mismatch)"]
    Node_3 --> Node_6
    Node_4["4: NodeType.STARTLOOP - "]
    Node_4 --> Node_7
    Node_5["5: NodeType.ENDLOOP - "]
    Node_6["6: NodeType.VARIABLE - "]
    Node_6 --> Node_4
    Node_7["7: NodeType.IFLOOP - i < lowerHintsLen"]
    Node_7 --> Node_8
    Node_7 --> Node_5
    Node_8["8: NodeType.EXPRESSION - _updateTrove(_borrowers(i),_lowerHints(i),_upperHints(i))"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - ++ i"]
    Node_9 --> Node_7
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TroveManager.sol` on lines **256** to **264**

```solidity
    function updateTroves(address[] calldata _borrowers, address[] calldata _lowerHints, address[] calldata _upperHints) external {
        uint lowerHintsLen = _lowerHints.length;
        require(_borrowers.length == lowerHintsLen, "TM: borrowers length mismatch");
        require(lowerHintsLen == _upperHints.length, "TM: hints length mismatch");

        for (uint256 i; i < lowerHintsLen; ++i) {
            _updateTrove(_borrowers[i], _lowerHints[i], _upperHints[i]);
        }
    }

```
