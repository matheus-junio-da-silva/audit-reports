# Context: ECDSA.recover

**Contract:** `ECDSA` (Inherits: None)
**Signature:** `recover(bytes32,bytes) returns (address)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- revert: `revert(string)(ECDSA: invalid signature length)`

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
    Node_1["1: NodeType.IF - signature.length != 65"]
    Node_1 --> Node_2
    Node_1 --> Node_3
    Node_2["2: NodeType.EXPRESSION - revert(string)(ECDSA: invalid signature length)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.ENDIF - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.ASSEMBLY - "]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - r = mload(uint256)(signature + 0x20)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - s = mload(uint256)(signature + 0x40)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - v = byte(uint256,uint256)(0,mload(uint256)(signature + 0x60))"]
    Node_10 --> Node_11
    Node_11["11: NodeType.ENDASSEMBLY - "]
    Node_11 --> Node_12
    Node_12["12: NodeType.RETURN - recover(hash,v,r,s)"]
```

### Source Mapping
Declared in: `node_modules/@openzeppelin/contracts/cryptography/ECDSA.sol` on lines **26** to **47**

```solidity
    function recover(bytes32 hash, bytes memory signature) internal pure returns (address) {
        // Check the signature length
        if (signature.length != 65) {
            revert("ECDSA: invalid signature length");
        }

        // Divide the signature in r, s and v variables
        bytes32 r;
        bytes32 s;
        uint8 v;

        // ecrecover takes the signature parameters, and the only way to get them
        // currently is to use assembly.
        // solhint-disable-next-line no-inline-assembly
        assembly {
            r := mload(add(signature, 0x20))
            s := mload(add(signature, 0x40))
            v := byte(0, mload(add(signature, 0x60)))
        }

        return recover(hash, v, r, s);
    }

```
