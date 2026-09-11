# Context: Rlp._itemLength

**Contract:** `Rlp` (Inherits: None)
**Signature:** `_itemLength(uint256) returns (uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `private`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** DATA_LONG_START, DATA_SHORT_START, LIST_LONG_START, LIST_SHORT_START
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
    Node_1["1: NodeType.VARIABLE - "]
    Node_1 --> Node_2
    Node_2["2: NodeType.ASSEMBLY - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - b0 = byte(uint256,uint256)(0,mload(uint256)(memPtr))"]
    Node_3 --> Node_4
    Node_4["4: NodeType.ENDASSEMBLY - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.IF - b0 < DATA_SHORT_START"]
    Node_5 --> Node_6
    Node_5 --> Node_7
    Node_6["6: NodeType.EXPRESSION - len = 1"]
    Node_6 --> Node_29
    Node_7["7: NodeType.IF - b0 < DATA_LONG_START"]
    Node_7 --> Node_8
    Node_7 --> Node_9
    Node_8["8: NodeType.EXPRESSION - len = b0 - DATA_SHORT_START + 1"]
    Node_8 --> Node_28
    Node_9["9: NodeType.IF - b0 < LIST_SHORT_START"]
    Node_9 --> Node_10
    Node_9 --> Node_17
    Node_10["10: NodeType.ASSEMBLY - "]
    Node_10 --> Node_11
    Node_11["11: NodeType.VARIABLE - "]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - bLen__itemLength_asm_1 = b0 - 0xB7"]
    Node_12 --> Node_13
    Node_13["13: NodeType.VARIABLE - "]
    Node_13 --> Node_14
    Node_14["14: NodeType.EXPRESSION - dLen__itemLength_asm_1 = mload(uint256)(memPtr + 1) / 256 ** 32 - bLen__itemLength_asm_1"]
    Node_14 --> Node_15
    Node_15["15: NodeType.EXPRESSION - len = 1 + bLen__itemLength_asm_1 + dLen__itemLength_asm_1"]
    Node_15 --> Node_16
    Node_16["16: NodeType.ENDASSEMBLY - "]
    Node_16 --> Node_27
    Node_17["17: NodeType.IF - b0 < LIST_LONG_START"]
    Node_17 --> Node_18
    Node_17 --> Node_19
    Node_18["18: NodeType.EXPRESSION - len = b0 - LIST_SHORT_START + 1"]
    Node_18 --> Node_26
    Node_19["19: NodeType.ASSEMBLY - "]
    Node_19 --> Node_20
    Node_20["20: NodeType.VARIABLE - "]
    Node_20 --> Node_21
    Node_21["21: NodeType.EXPRESSION - bLen__itemLength_asm_2 = b0 - 0xF7"]
    Node_21 --> Node_22
    Node_22["22: NodeType.VARIABLE - "]
    Node_22 --> Node_23
    Node_23["23: NodeType.EXPRESSION - dLen__itemLength_asm_2 = mload(uint256)(memPtr + 1) / 256 ** 32 - bLen__itemLength_asm_2"]
    Node_23 --> Node_24
    Node_24["24: NodeType.EXPRESSION - len = 1 + bLen__itemLength_asm_2 + dLen__itemLength_asm_2"]
    Node_24 --> Node_25
    Node_25["25: NodeType.ENDASSEMBLY - "]
    Node_25 --> Node_26
    Node_26["26: NodeType.ENDIF - "]
    Node_26 --> Node_27
    Node_27["27: NodeType.ENDIF - "]
    Node_27 --> Node_28
    Node_28["28: NodeType.ENDIF - "]
    Node_28 --> Node_29
    Node_29["29: NodeType.ENDIF - "]
    Node_29 --> Node_30
    Node_30["30: NodeType.RETURN - len"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-library/contracts/Rlp.sol` on lines **312** to **337**

```solidity
    function _itemLength(uint memPtr) private pure returns (uint len) {
        uint b0;
        assembly {
            b0 := byte(0, mload(memPtr))
        }
        if (b0 < DATA_SHORT_START)
            len = 1;
        else if (b0 < DATA_LONG_START)
            len = b0 - DATA_SHORT_START + 1;
        else if (b0 < LIST_SHORT_START) {
            assembly {
                let bLen := sub(b0, 0xB7) // bytes length (DATA_LONG_OFFSET)
                let dLen := div(mload(add(memPtr, 1)), exp(256, sub(32, bLen))) // data length
                len := add(1, add(bLen, dLen)) // total length
            }
        }
        else if (b0 < LIST_LONG_START)
            len = b0 - LIST_SHORT_START + 1;
        else {
            assembly {
                let bLen := sub(b0, 0xF7) // bytes length (LIST_LONG_OFFSET)
                let dLen := div(mload(add(memPtr, 1)), exp(256, sub(32, bLen))) // data length
                len := add(1, add(bLen, dLen)) // total length
            }
        }
    }

```
