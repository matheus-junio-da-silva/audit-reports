# Context: BoringERC20.returnDataToString

**Contract:** `BoringERC20` (Inherits: None)
**Signature:** `returnDataToString(bytes) returns (string)`
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
    Node_1["1: NodeType.IF - data.length >= 64"]
    Node_1 --> Node_2
    Node_1 --> Node_3
    Node_2["2: NodeType.RETURN - abi.decode(data,(string))"]
    Node_3["3: NodeType.IF - data.length == 32"]
    Node_3 --> Node_4
    Node_3 --> Node_17
    Node_4["4: NodeType.VARIABLE - i = 0"]
    Node_4 --> Node_5
    Node_5["5: NodeType.STARTLOOP - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.IFLOOP - i < 32 && data(i) != 0"]
    Node_6 --> Node_7
    Node_6 --> Node_8
    Node_7["7: NodeType.EXPRESSION - ++ i"]
    Node_7 --> Node_6
    Node_8["8: NodeType.ENDLOOP - "]
    Node_8 --> Node_9
    Node_9["9: NodeType.VARIABLE - bytesArray = new bytes(i)"]
    Node_9 --> Node_12
    Node_10["10: NodeType.STARTLOOP - "]
    Node_10 --> Node_13
    Node_11["11: NodeType.ENDLOOP - "]
    Node_11 --> Node_16
    Node_12["12: NodeType.EXPRESSION - i = 0"]
    Node_12 --> Node_10
    Node_13["13: NodeType.IFLOOP - i < 32 && data(i) != 0"]
    Node_13 --> Node_14
    Node_13 --> Node_11
    Node_14["14: NodeType.EXPRESSION - bytesArray(i) = data(i)"]
    Node_14 --> Node_15
    Node_15["15: NodeType.EXPRESSION - ++ i"]
    Node_15 --> Node_13
    Node_16["16: NodeType.RETURN - string(bytesArray)"]
    Node_17["17: NodeType.RETURN - ???"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/YETI/BoringCrypto/BoringERC20.sol` on lines **15** to **31**

```solidity
    function returnDataToString(bytes memory data) internal pure returns (string memory) {
        if (data.length >= 64) {
            return abi.decode(data, (string));
        } else if (data.length == 32) {
            uint8 i = 0;
            while(i < 32 && data[i] != 0) {
                ++i;
            }
            bytes memory bytesArray = new bytes(i);
            for (i = 0; i < 32 && data[i] != 0; ++i) {
                bytesArray[i] = data[i];
            }
            return string(bytesArray);
        } else {
            return "???";
        }
    }

```
