# Context: SushiswapV2Library.getAmountIn

**Contract:** `SushiswapV2Library` (Inherits: None)
**Signature:** `getAmountIn(uint256,uint256,uint256) returns (uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(amountOut > 0,UniswapV2Library: INSUFFICIENT_OUTPUT_AMOUNT)`
- require/assert: `require(bool,string)(reserveIn > 0 && reserveOut > 0,UniswapV2Library: INSUFFICIENT_LIQUIDITY)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(amountOut > 0,UniswapV2Library: INSUFFICIENT_OUTPUT_AMOUNT)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(reserveIn > 0 && reserveOut > 0,UniswapV2Library: INSUFFICIENT_LIQUIDITY)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - numerator = reserveIn * amountOut * 1000"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - denominator = (reserveOut - amountOut) * 997"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - amountIn = (numerator / denominator) + 1"]
    Node_5 --> Node_6
    Node_6["6: NodeType.RETURN - amountIn"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-library/contracts/SushiswapV2Library.sol` on lines **53** to **59**

```solidity
    function getAmountIn(uint amountOut, uint reserveIn, uint reserveOut) internal pure returns (uint amountIn) {
        require(amountOut > 0, 'UniswapV2Library: INSUFFICIENT_OUTPUT_AMOUNT');
        require(reserveIn > 0 && reserveOut > 0, 'UniswapV2Library: INSUFFICIENT_LIQUIDITY');
        uint numerator = reserveIn * amountOut * 1000;
        uint denominator = (reserveOut - amountOut) * 997;
        amountIn = (numerator / denominator) + 1;
    }

```
