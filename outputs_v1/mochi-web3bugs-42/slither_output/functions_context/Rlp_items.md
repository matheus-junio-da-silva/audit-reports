# Context: Rlp.items

**Contract:** `Rlp` (Inherits: None)
**Signature:** `items(Rlp.Item) returns (uint256)`
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
    Node_1["1: NodeType.IF - ! isList(self)"]
    Node_1 --> Node_2
    Node_1 --> Node_3
    Node_2["2: NodeType.RETURN - 0"]
    Node_3["3: NodeType.ENDIF - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - memPtr = self._unsafe_memPtr"]
    Node_5 --> Node_6
    Node_6["6: NodeType.ASSEMBLY - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - b0 = byte(uint256,uint256)(0,mload(uint256)(memPtr))"]
    Node_7 --> Node_8
    Node_8["8: NodeType.ENDASSEMBLY - "]
    Node_8 --> Node_9
    Node_9["9: NodeType.VARIABLE - pos = memPtr + _payloadOffset(self)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.VARIABLE - last = memPtr + self._unsafe_length - 1"]
    Node_10 --> Node_11
    Node_11["11: NodeType.VARIABLE - "]
    Node_11 --> Node_12
    Node_12["12: NodeType.STARTLOOP - "]
    Node_12 --> Node_13
    Node_13["13: NodeType.IFLOOP - pos <= last"]
    Node_13 --> Node_14
    Node_13 --> Node_16
    Node_14["14: NodeType.EXPRESSION - pos += _itemLength(pos)"]
    Node_14 --> Node_15
    Node_15["15: NodeType.EXPRESSION - itms ++"]
    Node_15 --> Node_13
    Node_16["16: NodeType.ENDLOOP - "]
    Node_16 --> Node_17
    Node_17["17: NodeType.RETURN - itms"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-library/contracts/Rlp.sol` on lines **130** to **146**

```solidity
    function items(Item memory self) internal pure returns (uint) {
        if (!isList(self))
            return 0;
        uint b0;
        uint memPtr = self._unsafe_memPtr;
        assembly {
            b0 := byte(0, mload(memPtr))
        }
        uint pos = memPtr + _payloadOffset(self);
        uint last = memPtr + self._unsafe_length - 1;
        uint itms;
        while(pos <= last) {
            pos += _itemLength(pos);
            itms++;
        }
        return itms;
    }

```
