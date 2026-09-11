# Context: Address._revert

**Contract:** `Address` (Inherits: None)
**Signature:** `_revert(bytes,string)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `private`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- revert: `returndata_size__revert_asm_0 = mload(uint256)(returndata)`
- revert: `revert(uint256,uint256)(32 + returndata,returndata_size__revert_asm_0)`
- revert: `revert(string)(errorMessage)`

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
    Node_1["1: NodeType.IF - returndata.length > 0"]
    Node_1 --> Node_2
    Node_1 --> Node_7
    Node_2["2: NodeType.ASSEMBLY - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - returndata_size__revert_asm_0 = mload(uint256)(returndata)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - revert(uint256,uint256)(32 + returndata,returndata_size__revert_asm_0)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.ENDASSEMBLY - "]
    Node_6 --> Node_8
    Node_7["7: NodeType.EXPRESSION - revert(string)(errorMessage)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.ENDIF - "]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/node_modules/@openzeppelin/contracts/utils/Address.sol` on lines **231** to **243**

```solidity
    function _revert(bytes memory returndata, string memory errorMessage) private pure {
        // Look for revert reason and bubble it up if present
        if (returndata.length > 0) {
            // The easiest way to bubble the revert reason is using memory via assembly
            /// @solidity memory-safe-assembly
            assembly {
                let returndata_size := mload(returndata)
                revert(add(32, returndata), returndata_size)
            }
        } else {
            revert(errorMessage);
        }
    }

```
