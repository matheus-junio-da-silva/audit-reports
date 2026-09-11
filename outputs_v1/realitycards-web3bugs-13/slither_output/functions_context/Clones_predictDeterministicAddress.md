# Context: Clones.predictDeterministicAddress

**Contract:** `Clones` (Inherits: None)
**Signature:** `predictDeterministicAddress(address,bytes32,address) returns (address)`
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
    Node_3["3: NodeType.EXPRESSION - ptr_predictDeterministicAddress_asm_0 = mload(uint256)(0x40)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - mstore(uint256,uint256)(ptr_predictDeterministicAddress_asm_0,0x3d602d80600a3d3981f3363d3d373d3d3d363d73000000000000000000000000)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - mstore(uint256,uint256)(ptr_predictDeterministicAddress_asm_0 + 0x14,implementation << 0x60)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - mstore(uint256,uint256)(ptr_predictDeterministicAddress_asm_0 + 0x28,0x5af43d82803e903d91602b57fd5bf3ff00000000000000000000000000000000)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - mstore(uint256,uint256)(ptr_predictDeterministicAddress_asm_0 + 0x38,deployer << 0x60)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - mstore(uint256,uint256)(ptr_predictDeterministicAddress_asm_0 + 0x4c,salt)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - mstore(uint256,uint256)(ptr_predictDeterministicAddress_asm_0 + 0x6c,keccak256(uint256,uint256)(ptr_predictDeterministicAddress_asm_0,0x37))"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - predicted = keccak256(uint256,uint256)(ptr_predictDeterministicAddress_asm_0 + 0x37,0x55)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.ENDASSEMBLY - "]
    Node_11 --> Node_12
    Node_12["12: NodeType.RETURN - predicted"]
```

### Source Mapping
Declared in: `node_modules/@openzeppelin/contracts/proxy/Clones.sol` on lines **58** to **70**

```solidity
    function predictDeterministicAddress(address implementation, bytes32 salt, address deployer) internal pure returns (address predicted) {
        // solhint-disable-next-line no-inline-assembly
        assembly {
            let ptr := mload(0x40)
            mstore(ptr, 0x3d602d80600a3d3981f3363d3d373d3d3d363d73000000000000000000000000)
            mstore(add(ptr, 0x14), shl(0x60, implementation))
            mstore(add(ptr, 0x28), 0x5af43d82803e903d91602b57fd5bf3ff00000000000000000000000000000000)
            mstore(add(ptr, 0x38), shl(0x60, deployer))
            mstore(add(ptr, 0x4c), salt)
            mstore(add(ptr, 0x6c), keccak256(ptr, 0x37))
            predicted := keccak256(add(ptr, 0x37), 0x55)
        }
    }

```
