# Context: Rlp._copyToBytes

**Contract:** `Rlp` (Inherits: None)
**Signature:** `_copyToBytes(uint256,bytes,uint256)`
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
    Node_1["1: NodeType.ASSEMBLY - "]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - words__copyToBytes_asm_0 = btsLen + 31 / 32"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - sourcePointer__copyToBytes_asm_0 = sourceBytes"]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - destinationPointer__copyToBytes_asm_0 = destinationBytes + 32"]
    Node_7 --> Node_8
    Node_8["8: NodeType.STARTLOOP - "]
    Node_8 --> Node_10
    Node_9["9: NodeType.ENDLOOP - "]
    Node_9 --> Node_17
    Node_10["10: NodeType.VARIABLE - "]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - i__copyToBytes_asm_0 = 0"]
    Node_11 --> Node_12
    Node_12["12: NodeType.IFLOOP - i__copyToBytes_asm_0 < words__copyToBytes_asm_0"]
    Node_12 --> Node_9
    Node_12 --> Node_13
    Node_13["13: NodeType.VARIABLE - "]
    Node_13 --> Node_14
    Node_14["14: NodeType.EXPRESSION - offset__copyToBytes_asm_0 = i__copyToBytes_asm_0 * 32"]
    Node_14 --> Node_15
    Node_15["15: NodeType.EXPRESSION - mstore(uint256,uint256)(destinationPointer__copyToBytes_asm_0 + offset__copyToBytes_asm_0,mload(uint256)(sourcePointer__copyToBytes_asm_0 + offset__copyToBytes_asm_0))"]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - i__copyToBytes_asm_0 = i__copyToBytes_asm_0 + 1"]
    Node_16 --> Node_12
    Node_17["17: NodeType.EXPRESSION - mstore(uint256,uint256)(destinationBytes + 32 + mload(uint256)(destinationBytes),0)"]
    Node_17 --> Node_18
    Node_18["18: NodeType.ENDASSEMBLY - "]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-library/contracts/Rlp.sol` on lines **367** to **381**

```solidity
    function _copyToBytes(uint sourceBytes, bytes memory destinationBytes, uint btsLen) internal pure {
        // Exploiting the fact that 'tgt' was the last thing to be allocated,
        // we can write entire words, and just overwrite any excess.
        assembly {
            let words := div(add(btsLen, 31), 32)
            let sourcePointer := sourceBytes
            let destinationPointer := add(destinationBytes, 32)
            for { let i := 0 } lt(i, words) { i := add(i, 1) }
            {
                let offset := mul(i, 32)
                mstore(add(destinationPointer, offset), mload(add(sourcePointer, offset)))
            }
            mstore(add(destinationBytes, add(32, mload(destinationBytes))), 0)
        }
    }

```
