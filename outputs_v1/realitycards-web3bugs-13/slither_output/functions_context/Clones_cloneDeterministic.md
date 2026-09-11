# Context: Clones.cloneDeterministic

**Contract:** `Clones` (Inherits: None)
**Signature:** `cloneDeterministic(address,bytes32) returns (address)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(instance != address(0),ERC1167: create2 failed)`

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
    Node_3["3: NodeType.EXPRESSION - ptr_cloneDeterministic_asm_0 = mload(uint256)(0x40)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - mstore(uint256,uint256)(ptr_cloneDeterministic_asm_0,0x3d602d80600a3d3981f3363d3d373d3d3d363d73000000000000000000000000)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - mstore(uint256,uint256)(ptr_cloneDeterministic_asm_0 + 0x14,implementation << 0x60)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - mstore(uint256,uint256)(ptr_cloneDeterministic_asm_0 + 0x28,0x5af43d82803e903d91602b57fd5bf30000000000000000000000000000000000)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - instance = create2(uint256,uint256,uint256,uint256)(0,ptr_cloneDeterministic_asm_0,0x37,salt)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.ENDASSEMBLY - "]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - require(bool,string)(instance != address(0),ERC1167: create2 failed)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.RETURN - instance"]
```

### Source Mapping
Declared in: `node_modules/@openzeppelin/contracts/proxy/Clones.sol` on lines **43** to **53**

```solidity
    function cloneDeterministic(address implementation, bytes32 salt) internal returns (address instance) {
        // solhint-disable-next-line no-inline-assembly
        assembly {
            let ptr := mload(0x40)
            mstore(ptr, 0x3d602d80600a3d3981f3363d3d373d3d3d363d73000000000000000000000000)
            mstore(add(ptr, 0x14), shl(0x60, implementation))
            mstore(add(ptr, 0x28), 0x5af43d82803e903d91602b57fd5bf30000000000000000000000000000000000)
            instance := create2(0, ptr, 0x37, salt)
        }
        require(instance != address(0), "ERC1167: create2 failed");
    }

```
