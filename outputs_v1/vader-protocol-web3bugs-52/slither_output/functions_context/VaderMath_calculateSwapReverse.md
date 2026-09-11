# Context: VaderMath.calculateSwapReverse

**Contract:** `VaderMath` (Inherits: None)
**Signature:** `calculateSwapReverse(uint256,uint256,uint256) returns (uint256)`
**Method Selector ID:** `0x3ae5c69b`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(y4 < reserveOut,VaderMath::calculateSwapReverse: Desired Output Exceeds Maximum Output Possible (1/4 of Liquidity Pool))`

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
    Node_1["1: NodeType.VARIABLE - XY = reserveIn * reserveOut"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - y2 = amountOut * 2"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - y4 = y2 * 2"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - require(bool,string)(y4 < reserveOut,VaderMath::calculateSwapReverse: Desired Output Exceeds Maximum Output Possible (1/4 of Liquidity Pool))"]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - numeratorA = root(XY) * root(reserveIn * (reserveOut - y4))"]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - numeratorB = y2 * reserveIn"]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - numeratorC = XY"]
    Node_7 --> Node_8
    Node_8["8: NodeType.VARIABLE - numerator = numeratorC - numeratorA - numeratorB"]
    Node_8 --> Node_9
    Node_9["9: NodeType.VARIABLE - denominator = y2"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - amountIn = numerator / denominator"]
    Node_10 --> Node_11
    Node_11["11: NodeType.RETURN - amountIn"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/dex/math/VaderMath.sol` on lines **117** to **150**

```solidity
    function calculateSwapReverse(
        uint256 amountOut,
        uint256 reserveIn,
        uint256 reserveOut
    ) public pure returns (uint256 amountIn) {
        // X * Y
        uint256 XY = reserveIn * reserveOut;

        // 2y
        uint256 y2 = amountOut * 2;

        // 4y
        uint256 y4 = y2 * 2;

        require(
            y4 < reserveOut,
            "VaderMath::calculateSwapReverse: Desired Output Exceeds Maximum Output Possible (1/4 of Liquidity Pool)"
        );

        // root(-X^2 * Y * (4y - Y))    =>    root(X^2 * Y * (Y - 4y)) as Y - 4y >= 0    =>    Y >= 4y holds true
        uint256 numeratorA = root(XY) * root(reserveIn * (reserveOut - y4));

        // X * (2y - Y)    =>    2yX - XY
        uint256 numeratorB = y2 * reserveIn;
        uint256 numeratorC = XY;

        // -1 * (root(-X^2 * Y * (4y - Y)) + (X * (2y - Y)))    =>    -1 * (root(X^2 * Y * (Y - 4y)) + 2yX - XY)    =>    XY - root(X^2 * Y * (Y - 4y) - 2yX
        uint256 numerator = numeratorC - numeratorA - numeratorB;

        // 2y
        uint256 denominator = y2;

        amountIn = numerator / denominator;
    }

```
