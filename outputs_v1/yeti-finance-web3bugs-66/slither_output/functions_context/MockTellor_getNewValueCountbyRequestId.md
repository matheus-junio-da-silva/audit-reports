# Context: MockTellor.getNewValueCountbyRequestId

**Contract:** `MockTellor` (Inherits: None)
**Signature:** `getNewValueCountbyRequestId(uint256) returns (uint256)`
**Method Selector ID:** `0x46eee1c4`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** revertRequest
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(1 == 0,Tellor request reverted)`

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
    Node_1["1: NodeType.IF - revertRequest"]
    Node_1 --> Node_2
    Node_1 --> Node_3
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(1 == 0,Tellor request reverted)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.ENDIF - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.RETURN - 1"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TestContracts/MockTellor.sol` on lines **40** to **43**

```solidity
    function getNewValueCountbyRequestId(uint) external view returns (uint) {
        if (revertRequest) {require (1 == 0, "Tellor request reverted");}
        return 1;
    }

```
