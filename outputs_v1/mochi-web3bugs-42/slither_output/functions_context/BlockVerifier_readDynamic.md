# Context: BlockVerifier.readDynamic

**Contract:** `BlockVerifier` (Inherits: None)
**Signature:** `readDynamic(uint256) returns (uint256, uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `private`
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
    Node_0["0: NodeType.ASSEMBLY - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.ENTRYPOINT - "]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - value_extractStateRootAndTimestamp_asm_0_readDynamic = byte(uint256,uint256)(0,mload(uint256)(prefixPointer_extractStateRootAndTimestamp_asm_0_readDynamic))"]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - "]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - switch_expr_742_309_0_extractStateRootAndTimestamp_asm_0_readDynamic = value_extractStateRootAndTimestamp_asm_0_readDynamic < 0x80"]
    Node_8 --> Node_9
    Node_9["9: NodeType.IF - switch_expr_742_309_0_extractStateRootAndTimestamp_asm_0_readDynamic == 1"]
    Node_9 --> Node_11
    Node_9 --> Node_13
    Node_10["10: NodeType.ENDIF - "]
    Node_11["11: NodeType.EXPRESSION - dataPointer_extractStateRootAndTimestamp_asm_0_readDynamic = prefixPointer_extractStateRootAndTimestamp_asm_0_readDynamic"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - dataLength_extractStateRootAndTimestamp_asm_0_readDynamic = 1"]
    Node_12 --> Node_10
    Node_13["13: NodeType.IF - switch_expr_742_309_0_extractStateRootAndTimestamp_asm_0_readDynamic == 0"]
    Node_13 --> Node_15
    Node_13 --> Node_14
    Node_14["14: NodeType.ENDIF - "]
    Node_14 --> Node_10
    Node_15["15: NodeType.EXPRESSION - dataPointer_extractStateRootAndTimestamp_asm_0_readDynamic = prefixPointer_extractStateRootAndTimestamp_asm_0_readDynamic + 1"]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - dataLength_extractStateRootAndTimestamp_asm_0_readDynamic = value_extractStateRootAndTimestamp_asm_0_readDynamic - 0x80"]
    Node_16 --> Node_14
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-library/contracts/BlockVerifier.sol` on lines **16** to **27**

```solidity
            function readDynamic(prefixPointer) -> dataPointer, dataLength {
                let value := byte(0, mload(prefixPointer))
                switch lt(value, 0x80)
                case 1 {
                    dataPointer := prefixPointer
                    dataLength := 1
                }
                case 0 {
                    dataPointer := add(prefixPointer, 1)
                    dataLength := sub(value, 0x80)
                }
            }

```
