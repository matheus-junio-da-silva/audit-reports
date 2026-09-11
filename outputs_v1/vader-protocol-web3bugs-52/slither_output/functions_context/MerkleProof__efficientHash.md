# Context: MerkleProof._efficientHash

**Contract:** `MerkleProof` (Inherits: None)
**Signature:** `_efficientHash(bytes32,bytes32) returns (bytes32)`
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
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.ASSEMBLY - "]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - mstore(uint256,uint256)(0x00,a)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - mstore(uint256,uint256)(0x20,b)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - value = keccak256(uint256,uint256)(0x00,0x40)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.ENDASSEMBLY - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.RETURN - value"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/node_modules/@openzeppelin/contracts/utils/cryptography/MerkleProof.sol` on lines **219** to **226**

```solidity
    function _efficientHash(bytes32 a, bytes32 b) private pure returns (bytes32 value) {
        /// @solidity memory-safe-assembly
        assembly {
            mstore(0x00, a)
            mstore(0x20, b)
            value := keccak256(0x00, 0x40)
        }
    }

```
