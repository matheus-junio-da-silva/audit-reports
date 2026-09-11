# Context: ECDSA.tryRecover

**Contract:** `ECDSA` (Inherits: None)
**Signature:** `tryRecover(bytes32,bytes) returns (address, ECDSA.RecoverError)`
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
    Node_1["1: NodeType.IF - signature.length == 65"]
    Node_1 --> Node_2
    Node_1 --> Node_11
    Node_2["2: NodeType.VARIABLE - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.ASSEMBLY - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - r = mload(uint256)(signature + 0x20)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - s = mload(uint256)(signature + 0x40)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - v = byte(uint256,uint256)(0,mload(uint256)(signature + 0x60))"]
    Node_8 --> Node_9
    Node_9["9: NodeType.ENDASSEMBLY - "]
    Node_9 --> Node_10
    Node_10["10: NodeType.RETURN - tryRecover(hash,v,r,s)"]
    Node_11["11: NodeType.RETURN - (address(0),RecoverError.InvalidSignatureLength)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/node_modules/@openzeppelin/contracts/utils/cryptography/ECDSA.sol` on lines **55** to **72**

```solidity
    function tryRecover(bytes32 hash, bytes memory signature) internal pure returns (address, RecoverError) {
        if (signature.length == 65) {
            bytes32 r;
            bytes32 s;
            uint8 v;
            // ecrecover takes the signature parameters, and the only way to get them
            // currently is to use assembly.
            /// @solidity memory-safe-assembly
            assembly {
                r := mload(add(signature, 0x20))
                s := mload(add(signature, 0x40))
                v := byte(0, mload(add(signature, 0x60)))
            }
            return tryRecover(hash, v, r, s);
        } else {
            return (address(0), RecoverError.InvalidSignatureLength);
        }
    }

```
