# Context: AAVEOracle.fetchPrice

**Contract:** `AAVEOracle` (Inherits: Ownable)
**Signature:** `fetchPrice() returns (uint256)`
**Method Selector ID:** `0x0fdb11cf`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** WAAVE, base, underlying
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IWAAVE.TMP_40(uint256) = HIGH_LEVEL_CALL, dest:WAAVE(IWAAVE), function:aavePerShare, arguments:[]  `
- `IBaseOracle.TMP_41(uint256) = HIGH_LEVEL_CALL, dest:base(IBaseOracle), function:getPrice, arguments:['underlying']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.RETURN - WAAVE.aavePerShare() * base.getPrice(underlying) / 1e18"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/Oracles/AAVETokenOracle.sol` on lines **31** to **33**

```solidity
  function fetchPrice() external returns (uint) {
    return WAAVE.aavePerShare()*base.getPrice(underlying)/1e18;
  }

```
