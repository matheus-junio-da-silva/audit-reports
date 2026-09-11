# Context: AddressUpgradeable._verifyCallResult

**Contract:** `AddressUpgradeable` (Inherits: None)
**Signature:** `_verifyCallResult(bool,bytes,string) returns (bytes)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `private`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- revert: `revert(uint256,uint256)(32 + returndata,returndata_size__verifyCallResult_asm_0)`
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
    Node_1["1: NodeType.IF - success"]
    Node_1 --> Node_2
    Node_1 --> Node_3
    Node_2["2: NodeType.RETURN - returndata"]
    Node_3["3: NodeType.IF - returndata.length > 0"]
    Node_3 --> Node_4
    Node_3 --> Node_9
    Node_4["4: NodeType.ASSEMBLY - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - returndata_size__verifyCallResult_asm_0 = mload(uint256)(returndata)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - revert(uint256,uint256)(32 + returndata,returndata_size__verifyCallResult_asm_0)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.ENDASSEMBLY - "]
    Node_8 --> Node_10
    Node_9["9: NodeType.EXPRESSION - revert(string)(errorMessage)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.ENDIF - "]
    Node_10 --> Node_11
    Node_11["11: NodeType.ENDIF - "]
```

### Source Mapping
Declared in: `node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol` on lines **147** to **164**

```solidity
    function _verifyCallResult(bool success, bytes memory returndata, string memory errorMessage) private pure returns(bytes memory) {
        if (success) {
            return returndata;
        } else {
            // Look for revert reason and bubble it up if present
            if (returndata.length > 0) {
                // The easiest way to bubble the revert reason is using memory via assembly

                // solhint-disable-next-line no-inline-assembly
                assembly {
                    let returndata_size := mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert(errorMessage);
            }
        }
    }

```
