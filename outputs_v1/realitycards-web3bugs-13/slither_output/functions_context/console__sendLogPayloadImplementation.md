# Context: console._sendLogPayloadImplementation

**Contract:** `console` (Inherits: None)
**Signature:** `_sendLogPayloadImplementation(bytes)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** CONSOLE_ADDRESS
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
    Node_1["1: NodeType.VARIABLE - consoleAddress = CONSOLE_ADDRESS"]
    Node_1 --> Node_2
    Node_2["2: NodeType.ASSEMBLY - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - pop(uint256)(staticcall(uint256,uint256,uint256,uint256,uint256,uint256)(gas()(),consoleAddress,payload + 32,mload(uint256)(payload),0,0))"]
    Node_3 --> Node_4
    Node_4["4: NodeType.ENDASSEMBLY - "]
```

### Source Mapping
Declared in: `node_modules/hardhat/console.sol` on lines **8** to **23**

```solidity
    function _sendLogPayloadImplementation(bytes memory payload) internal view {
        address consoleAddress = CONSOLE_ADDRESS;
        /// @solidity memory-safe-assembly
        assembly {
            pop(
                staticcall(
                    gas(),
                    consoleAddress,
                    add(payload, 32),
                    mload(payload),
                    0,
                    0
                )
            )
        }
    }

```
