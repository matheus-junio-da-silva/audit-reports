# Context: VaderMath.calculateSwap

**Contract:** `VaderMath` (Inherits: None)
**Signature:** `calculateSwap(uint256,uint256,uint256) returns (uint256)`
**Method Selector ID:** `0xec6341b3`
**Visibility:** `public`
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
    Node_1["1: NodeType.VARIABLE - numerator = amountIn * reserveIn * reserveOut"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - denominator = pow(amountIn + reserveIn)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - amountOut = numerator / denominator"]
    Node_3 --> Node_4
    Node_4["4: NodeType.RETURN - amountOut"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/dex/math/VaderMath.sol` on lines **99** to **111**

```solidity
    function calculateSwap(
        uint256 amountIn,
        uint256 reserveIn,
        uint256 reserveOut
    ) public pure returns (uint256 amountOut) {
        // x * Y * X
        uint256 numerator = amountIn * reserveIn * reserveOut;

        // (x + X) ^ 2
        uint256 denominator = pow(amountIn + reserveIn);

        amountOut = numerator / denominator;
    }

```
