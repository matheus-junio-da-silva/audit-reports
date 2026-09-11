# Context: Beacon.fallback

**Contract:** `Beacon` (Inherits: None)
**Signature:** `fallback()`
**Method Selector ID:** `0x552079dc`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** _CONTROLLER
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
    Node_1["1: NodeType.IF - msg.sender != _CONTROLLER"]
    Node_1 --> Node_2
    Node_1 --> Node_6
    Node_2["2: NodeType.ASSEMBLY - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - mstore(uint256,uint256)(0,sload(uint256)(0))"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - return(uint256,uint256)(0,32)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.ENDASSEMBLY - "]
    Node_5 --> Node_9
    Node_6["6: NodeType.ASSEMBLY - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - sstore(uint256,uint256)(0,calldataload(uint256)(0))"]
    Node_7 --> Node_8
    Node_8["8: NodeType.ENDASSEMBLY - "]
    Node_8 --> Node_9
    Node_9["9: NodeType.ENDIF - "]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-library/contracts/Beacon.sol` on lines **14** to **25**

```solidity
    fallback() external {
        if (msg.sender != _CONTROLLER) {
            // solhint-disable-next-line no-inline-assembly
          assembly {
            mstore(0, sload(0))
            return(0, 32)
          }
        } else {
            // solhint-disable-next-line no-inline-assembly
          assembly { sstore(0, calldataload(0)) }
        }
    }

```
