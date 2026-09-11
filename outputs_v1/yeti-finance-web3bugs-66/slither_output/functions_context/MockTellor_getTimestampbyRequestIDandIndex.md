# Context: MockTellor.getTimestampbyRequestIDandIndex

**Contract:** `MockTellor` (Inherits: None)
**Signature:** `getTimestampbyRequestIDandIndex(uint256,uint256) returns (uint256)`
**Method Selector ID:** `0x77fbb663`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** updateTime
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
    Node_1["1: NodeType.RETURN - updateTime"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TestContracts/MockTellor.sol` on lines **36** to **38**

```solidity
    function getTimestampbyRequestIDandIndex(uint, uint) external view returns (uint) {
        return updateTime;
    }

```
