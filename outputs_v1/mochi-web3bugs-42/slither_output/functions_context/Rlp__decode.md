# Context: Rlp._decode

**Contract:** `Rlp` (Inherits: None)
**Signature:** `_decode(Rlp.Item) returns (uint256, uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `private`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** DATA_LONG_START, DATA_SHORT_START
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(isData(self),Rlp.sol:Rlp:_decode:1)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(isData(self),Rlp.sol:Rlp:_decode:1)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - start = self._unsafe_memPtr"]
    Node_3 --> Node_4
    Node_4["4: NodeType.ASSEMBLY - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - b0 = byte(uint256,uint256)(0,mload(uint256)(start))"]
    Node_5 --> Node_6
    Node_6["6: NodeType.ENDASSEMBLY - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.IF - b0 < DATA_SHORT_START"]
    Node_7 --> Node_8
    Node_7 --> Node_11
    Node_8["8: NodeType.EXPRESSION - memPtr = start"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - len = 1"]
    Node_9 --> Node_10
    Node_10["10: NodeType.RETURN - (memPtr,len)"]
    Node_11["11: NodeType.ENDIF - "]
    Node_11 --> Node_12
    Node_12["12: NodeType.IF - b0 < DATA_LONG_START"]
    Node_12 --> Node_13
    Node_12 --> Node_15
    Node_13["13: NodeType.EXPRESSION - len = self._unsafe_length - 1"]
    Node_13 --> Node_14
    Node_14["14: NodeType.EXPRESSION - memPtr = start + 1"]
    Node_14 --> Node_21
    Node_15["15: NodeType.VARIABLE - "]
    Node_15 --> Node_16
    Node_16["16: NodeType.ASSEMBLY - "]
    Node_16 --> Node_17
    Node_17["17: NodeType.EXPRESSION - bLen = b0 - 0xB7"]
    Node_17 --> Node_18
    Node_18["18: NodeType.ENDASSEMBLY - "]
    Node_18 --> Node_19
    Node_19["19: NodeType.EXPRESSION - len = self._unsafe_length - 1 - bLen"]
    Node_19 --> Node_20
    Node_20["20: NodeType.EXPRESSION - memPtr = start + bLen + 1"]
    Node_20 --> Node_21
    Node_21["21: NodeType.ENDIF - "]
    Node_21 --> Node_22
    Node_22["22: NodeType.RETURN - (memPtr,len)"]
    Node_23["23: NodeType.RETURN - (memPtr,len)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-library/contracts/Rlp.sol` on lines **340** to **364**

```solidity
    function _decode(Item memory self) private pure returns (uint memPtr, uint len) {
        require(isData(self), "Rlp.sol:Rlp:_decode:1");
        uint b0;
        uint start = self._unsafe_memPtr;
        assembly {
            b0 := byte(0, mload(start))
        }
        if (b0 < DATA_SHORT_START) {
            memPtr = start;
            len = 1;
            return (memPtr, len);
        }
        if (b0 < DATA_LONG_START) {
            len = self._unsafe_length - 1;
            memPtr = start + 1;
        } else {
            uint bLen;
            assembly {
                bLen := sub(b0, 0xB7) // DATA_LONG_OFFSET
            }
            len = self._unsafe_length - 1 - bLen;
            memPtr = start + bLen + 1;
        }
        return (memPtr, len);
    }

```
