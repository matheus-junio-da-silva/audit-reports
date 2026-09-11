# Context: Strings.toString

**Contract:** `Strings` (Inherits: None)
**Signature:** `toString(uint256) returns (string)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** _SYMBOLS
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `Math.TMP_215(uint256) = LIBRARY_CALL, dest:Math, function:Math.log10(uint256), arguments:['value'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - length = Math.log10(value) + 1"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - buffer = new string(length)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.ASSEMBLY - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - ptr = buffer + 32 + length"]
    Node_5 --> Node_6
    Node_6["6: NodeType.ENDASSEMBLY - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.STARTLOOP - "]
    Node_7 --> Node_8
    Node_8["8: NodeType.IFLOOP - true"]
    Node_8 --> Node_9
    Node_8 --> Node_17
    Node_9["9: NodeType.EXPRESSION - ptr --"]
    Node_9 --> Node_10
    Node_10["10: NodeType.ASSEMBLY - "]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - mstore8(uint256,uint256)(ptr,byte(uint256,uint256)(value % 10,_SYMBOLS))"]
    Node_11 --> Node_12
    Node_12["12: NodeType.ENDASSEMBLY - "]
    Node_12 --> Node_13
    Node_13["13: NodeType.EXPRESSION - value /= 10"]
    Node_13 --> Node_14
    Node_14["14: NodeType.IF - value == 0"]
    Node_14 --> Node_15
    Node_14 --> Node_16
    Node_15["15: NodeType.BREAK - "]
    Node_15 --> Node_17
    Node_16["16: NodeType.ENDIF - "]
    Node_16 --> Node_8
    Node_17["17: NodeType.ENDLOOP - "]
    Node_17 --> Node_18
    Node_18["18: NodeType.RETURN - buffer"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/node_modules/@openzeppelin/contracts/utils/Strings.sol` on lines **19** to **39**

```solidity
    function toString(uint256 value) internal pure returns (string memory) {
        unchecked {
            uint256 length = Math.log10(value) + 1;
            string memory buffer = new string(length);
            uint256 ptr;
            /// @solidity memory-safe-assembly
            assembly {
                ptr := add(buffer, add(32, length))
            }
            while (true) {
                ptr--;
                /// @solidity memory-safe-assembly
                assembly {
                    mstore8(ptr, byte(mod(value, 10), _SYMBOLS))
                }
                value /= 10;
                if (value == 0) break;
            }
            return buffer;
        }
    }

```
