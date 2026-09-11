# Context: LiquitySafeMath128Tester.sub

**Contract:** `LiquitySafeMath128Tester` (Inherits: None)
**Signature:** `sub(uint128,uint128) returns (uint128)`
**Method Selector ID:** `0xa6fd0085`
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
- `LiquitySafeMath128.TMP_7(uint128) = LIBRARY_CALL, dest:LiquitySafeMath128, function:LiquitySafeMath128.sub(uint128,uint128), arguments:['a', 'b'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.RETURN - a.sub(b)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TestContracts/LiquitySafeMath128Tester.sol` on lines **16** to **18**

```solidity
    function sub(uint128 a, uint128 b) external pure returns (uint128) {
        return a.sub(b);
    }

```
