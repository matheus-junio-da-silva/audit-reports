# Context: ActivePoolTester._getArrayCopy

**Contract:** `ActivePoolTester` (Inherits: ActivePool, YetiCustomBase, BaseMath, IActivePool, IPool, ICollateralReceiver, CheckContract, Ownable)
**Signature:** `_getArrayCopy(uint256[]) returns (uint256[])`
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
    Node_1["1: NodeType.VARIABLE - arrLen = _arr.length"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - copy = new uint256()(arrLen)"]
    Node_2 --> Node_5
    Node_3["3: NodeType.STARTLOOP - "]
    Node_3 --> Node_6
    Node_4["4: NodeType.ENDLOOP - "]
    Node_4 --> Node_9
    Node_5["5: NodeType.VARIABLE - "]
    Node_5 --> Node_3
    Node_6["6: NodeType.IFLOOP - i < arrLen"]
    Node_6 --> Node_7
    Node_6 --> Node_4
    Node_7["7: NodeType.EXPRESSION - copy(i) = _arr(i)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - ++ i"]
    Node_8 --> Node_6
    Node_9["9: NodeType.RETURN - copy"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/Dependencies/YetiCustomBase.sol` on lines **192** to **199**

```solidity
    function _getArrayCopy(uint[] memory _arr) internal pure returns (uint[] memory){
        uint256 arrLen = _arr.length;
        uint[] memory copy = new uint[](arrLen);
        for (uint256 i; i < arrLen; ++i) {
            copy[i] = _arr[i];
        }
        return copy;
    }

```
