# Context: YUSDTokenTester.getChainId

**Contract:** `YUSDTokenTester` (Inherits: YUSDToken, IYUSDToken, IERC2612, IERC20, CheckContract)
**Signature:** `getChainId() returns (uint256)`
**Method Selector ID:** `0x3408e470`
**Visibility:** `external`
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
    Node_1["1: NodeType.ASSEMBLY - "]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - chainID = chainid()()"]
    Node_2 --> Node_3
    Node_3["3: NodeType.ENDASSEMBLY - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.RETURN - chainID"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TestContracts/YUSDTokenTester.sol` on lines **51** to **56**

```solidity
    function getChainId() external pure returns (uint256 chainID) {
        //return _chainID(); // it’s private
        assembly {
            chainID := chainid()
        }
    }

```
