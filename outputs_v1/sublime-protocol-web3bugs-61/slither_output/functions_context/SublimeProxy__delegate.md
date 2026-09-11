# Context: SublimeProxy._delegate

**Contract:** `SublimeProxy` (Inherits: TransparentUpgradeableProxy, UpgradeableProxy, Proxy)
**Signature:** `_delegate(address)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- revert: `revert(uint256,uint256)(0,returndatasize()())`

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
    Node_2["2: NodeType.EXPRESSION - calldatacopy(uint256,uint256,uint256)(0,0,calldatasize()())"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - result__delegate_asm_0 = delegatecall(uint256,uint256,uint256,uint256,uint256,uint256)(gas()(),implementation,0,calldatasize()(),0,0)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - returndatacopy(uint256,uint256,uint256)(0,0,returndatasize()())"]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - switch_expr_1606_164_14__delegate_asm_0 = result__delegate_asm_0"]
    Node_7 --> Node_8
    Node_8["8: NodeType.IF - switch_expr_1606_164_14__delegate_asm_0 == 0"]
    Node_8 --> Node_10
    Node_8 --> Node_11
    Node_9["9: NodeType.ENDIF - "]
    Node_9 --> Node_12
    Node_10["10: NodeType.EXPRESSION - revert(uint256,uint256)(0,returndatasize()())"]
    Node_10 --> Node_9
    Node_11["11: NodeType.EXPRESSION - return(uint256,uint256)(0,returndatasize()())"]
    Node_11 --> Node_9
    Node_12["12: NodeType.ENDASSEMBLY - "]
```

### Source Mapping
Declared in: `node_modules/@openzeppelin/contracts/proxy/Proxy.sol` on lines **21** to **41**

```solidity
    function _delegate(address implementation) internal virtual {
        // solhint-disable-next-line no-inline-assembly
        assembly {
            // Copy msg.data. We take full control of memory in this inline assembly
            // block because it will not return to Solidity code. We overwrite the
            // Solidity scratch pad at memory position 0.
            calldatacopy(0, 0, calldatasize())

            // Call the implementation.
            // out and outsize are 0 because we don't know the size yet.
            let result := delegatecall(gas(), implementation, 0, calldatasize(), 0, 0)

            // Copy the returned data.
            returndatacopy(0, 0, returndatasize())

            switch result
            // delegatecall returns 0 on error.
            case 0 { revert(0, returndatasize()) }
            default { return(0, returndatasize()) }
        }
    }

```
