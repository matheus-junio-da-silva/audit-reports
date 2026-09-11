# Context: ECDSA.toEthSignedMessageHash

**Contract:** `ECDSA` (Inherits: None)
**Signature:** `toEthSignedMessageHash(bytes32) returns (bytes32)`
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
    Node_2["2: NodeType.EXPRESSION - mstore(uint256,uint256)(0x00,Ethereum Signed Message:
32)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - mstore(uint256,uint256)(0x1c,hash)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - message = keccak256(uint256,uint256)(0x00,0x3c)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.ENDASSEMBLY - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.RETURN - message"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/node_modules/@openzeppelin/contracts/utils/cryptography/ECDSA.sol` on lines **165** to **174**

```solidity
    function toEthSignedMessageHash(bytes32 hash) internal pure returns (bytes32 message) {
        // 32 is the length in bytes of hash,
        // enforced by the type signature above
        /// @solidity memory-safe-assembly
        assembly {
            mstore(0x00, "\x19Ethereum Signed Message:\n32")
            mstore(0x1c, hash)
            message := keccak256(0x00, 0x3c)
        }
    }

```
