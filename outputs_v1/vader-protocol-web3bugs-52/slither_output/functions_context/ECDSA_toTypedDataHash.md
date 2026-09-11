# Context: ECDSA.toTypedDataHash

**Contract:** `ECDSA` (Inherits: None)
**Signature:** `toTypedDataHash(bytes32,bytes32) returns (bytes32)`
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
    Node_3["3: NodeType.EXPRESSION - ptr_toTypedDataHash_asm_0 = mload(uint256)(0x40)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - mstore(uint256,uint256)(ptr_toTypedDataHash_asm_0,)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - mstore(uint256,uint256)(ptr_toTypedDataHash_asm_0 + 0x02,domainSeparator)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - mstore(uint256,uint256)(ptr_toTypedDataHash_asm_0 + 0x22,structHash)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - data = keccak256(uint256,uint256)(ptr_toTypedDataHash_asm_0,0x42)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.ENDASSEMBLY - "]
    Node_8 --> Node_9
    Node_9["9: NodeType.RETURN - data"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/node_modules/@openzeppelin/contracts/utils/cryptography/ECDSA.sol` on lines **197** to **206**

```solidity
    function toTypedDataHash(bytes32 domainSeparator, bytes32 structHash) internal pure returns (bytes32 data) {
        /// @solidity memory-safe-assembly
        assembly {
            let ptr := mload(0x40)
            mstore(ptr, "\x19\x01")
            mstore(add(ptr, 0x02), domainSeparator)
            mstore(add(ptr, 0x22), structHash)
            data := keccak256(ptr, 0x42)
        }
    }

```
