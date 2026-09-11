# Context: BoringBatchable.batch

**Contract:** `BoringBatchable` (Inherits: BaseBoringBatchable)
**Signature:** `batch(bytes[],bool)`
**Method Selector ID:** `0xd2423b51`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- revert: `revert(string)(_getRevertMsg(result))`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `low-level-call`

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_3
    Node_1["1: NodeType.STARTLOOP - "]
    Node_1 --> Node_4
    Node_2["2: NodeType.ENDLOOP - "]
    Node_3["3: NodeType.VARIABLE - i = 0"]
    Node_3 --> Node_1
    Node_4["4: NodeType.IFLOOP - i < calls.length"]
    Node_4 --> Node_5
    Node_4 --> Node_2
    Node_5["5: NodeType.VARIABLE - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - (success,result) = address(this).delegatecall(calls(i))"]
    Node_7 --> Node_8
    Node_8["8: NodeType.IF - ! success && revertOnFail"]
    Node_8 --> Node_9
    Node_8 --> Node_10
    Node_9["9: NodeType.EXPRESSION - revert(string)(_getRevertMsg(result))"]
    Node_9 --> Node_10
    Node_10["10: NodeType.ENDIF - "]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - i ++"]
    Node_11 --> Node_4
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/YETI/BoringCrypto/BoringBatchable.sol` on lines **36** to **43**

```solidity
    function batch(bytes[] calldata calls, bool revertOnFail) external payable {
        for (uint256 i = 0; i < calls.length; i++) {
            (bool success, bytes memory result) = address(this).delegatecall(calls[i]);
            if (!success && revertOnFail) {
                revert(_getRevertMsg(result));
            }
        }
    }

```
