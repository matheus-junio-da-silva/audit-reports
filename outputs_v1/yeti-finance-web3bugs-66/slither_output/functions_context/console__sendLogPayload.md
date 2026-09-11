# Context: console._sendLogPayload

**Contract:** `console` (Inherits: None)
**Signature:** `_sendLogPayload(bytes)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `private`
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
- `TMP_2(uint256) = SOLIDITY_CALL staticcall(uint256,uint256,uint256,uint256,uint256,uint256)(TMP_1,consoleAddress,payloadStart__sendLogPayload_asm_0,payloadLength,0,0)`

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - payloadLength = payload.length"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - consoleAddress = CONSOLE_ADDRESS"]
    Node_2 --> Node_3
    Node_3["3: NodeType.ASSEMBLY - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - payloadStart__sendLogPayload_asm_0 = payload + 32"]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - r__sendLogPayload_asm_0 = staticcall(uint256,uint256,uint256,uint256,uint256,uint256)(gas()(),consoleAddress,payloadStart__sendLogPayload_asm_0,payloadLength,0,0)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.ENDASSEMBLY - "]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/node_modules/hardhat/console.sol` on lines **7** to **14**

```solidity
	function _sendLogPayload(bytes memory payload) private view {
		uint256 payloadLength = payload.length;
		address consoleAddress = CONSOLE_ADDRESS;
		assembly {
			let payloadStart := add(payload, 32)
			let r := staticcall(gas(), consoleAddress, payloadStart, payloadLength, 0, 0)
		}
	}

```
