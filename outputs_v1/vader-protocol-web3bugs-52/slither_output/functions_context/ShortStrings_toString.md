# Context: ShortStrings.toString

**Contract:** `ShortStrings` (Inherits: None)
**Signature:** `toString(ShortString) returns (string)`
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
    Node_1["1: NodeType.VARIABLE - len = byteLength(sstr)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - str = new string(32)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.ASSEMBLY - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - mstore(uint256,uint256)(str,len)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - mstore(uint256,uint256)(str + 0x20,sstr)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.ENDASSEMBLY - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.RETURN - str"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/node_modules/@openzeppelin/contracts/utils/ShortStrings.sol` on lines **63** to **73**

```solidity
    function toString(ShortString sstr) internal pure returns (string memory) {
        uint256 len = byteLength(sstr);
        // using `new string(len)` would work locally but is not memory safe.
        string memory str = new string(32);
        /// @solidity memory-safe-assembly
        assembly {
            mstore(str, len)
            mstore(add(str, 0x20), sstr)
        }
        return str;
    }

```
