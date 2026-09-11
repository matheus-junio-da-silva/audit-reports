# Context: BlockVerifier.revertWithReason

**Contract:** `BlockVerifier` (Inherits: None)
**Signature:** `revertWithReason(uint256,uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `private`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- revert: `mstore(uint256,uint256)(0x24,length_extractStateRootAndTimestamp_asm_0_revertWithReason)`
- revert: `mstore(uint256,uint256)(0x44,message_extractStateRootAndTimestamp_asm_0_revertWithReason)`
- revert: `revert(uint256,uint256)(0,0x44 + length_extractStateRootAndTimestamp_asm_0_revertWithReason)`

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
    Node_4["4: NodeType.EXPRESSION - mstore(uint256,uint256)(0,0x08c379a000000000000000000000000000000000000000000000000000000000)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - mstore(uint256,uint256)(4,0x20)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - mstore(uint256,uint256)(0x24,length_extractStateRootAndTimestamp_asm_0_revertWithReason)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - mstore(uint256,uint256)(0x44,message_extractStateRootAndTimestamp_asm_0_revertWithReason)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - revert(uint256,uint256)(0,0x44 + length_extractStateRootAndTimestamp_asm_0_revertWithReason)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-library/contracts/BlockVerifier.sol` on lines **8** to **14**

```solidity
            function revertWithReason(message, length) {
                mstore(0, 0x08c379a000000000000000000000000000000000000000000000000000000000)
                mstore(4, 0x20)
                mstore(0x24, length)
                mstore(0x44, message)
                revert(0, add(0x44, length))
            }

```
