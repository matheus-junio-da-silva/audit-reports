# Context: FullMath.mulDivRoundingUp

**Contract:** `FullMath` (Inherits: None)
**Signature:** `mulDivRoundingUp(uint256,uint256,uint256) returns (uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool)(result < type()(uint256).max)`

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
    Node_1["1: NodeType.EXPRESSION - result = mulDiv(a,b,denominator)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.IF - mulmod(uint256,uint256,uint256)(a,b,denominator) > 0"]
    Node_2 --> Node_3
    Node_2 --> Node_5
    Node_3["3: NodeType.EXPRESSION - require(bool)(result < type()(uint256).max)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - result ++"]
    Node_4 --> Node_5
    Node_5["5: NodeType.ENDIF - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.RETURN - result"]
```

### Source Mapping
Declared in: `node_modules/@uniswap/v3-core/contracts/libraries/FullMath.sol` on lines **113** to **123**

```solidity
    function mulDivRoundingUp(
        uint256 a,
        uint256 b,
        uint256 denominator
    ) internal pure returns (uint256 result) {
        result = mulDiv(a, b, denominator);
        if (mulmod(a, b, denominator) > 0) {
            require(result < type(uint256).max);
            result++;
        }
    }

```
