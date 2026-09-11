# Context: UniswapV2Library.getAmountsOut

**Contract:** `UniswapV2Library` (Inherits: None)
**Signature:** `getAmountsOut(address,uint256,address[]) returns (uint256[])`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(path.length >= 2,UniswapV2Library: INVALID_PATH)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(path.length >= 2,UniswapV2Library: INVALID_PATH)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - amounts = new uint256()(path.length)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - amounts(0) = amountIn"]
    Node_3 --> Node_6
    Node_4["4: NodeType.STARTLOOP - "]
    Node_4 --> Node_7
    Node_5["5: NodeType.ENDLOOP - "]
    Node_5 --> Node_13
    Node_6["6: NodeType.VARIABLE - "]
    Node_6 --> Node_4
    Node_7["7: NodeType.IFLOOP - i < path.length - 1"]
    Node_7 --> Node_8
    Node_7 --> Node_5
    Node_8["8: NodeType.VARIABLE - "]
    Node_8 --> Node_9
    Node_9["9: NodeType.VARIABLE - "]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - (reserveIn,reserveOut) = getReserves(factory,path(i),path(i + 1))"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - amounts(i + 1) = getAmountOut(amounts(i),reserveIn,reserveOut)"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - i ++"]
    Node_12 --> Node_7
    Node_13["13: NodeType.RETURN - amounts"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/external/libraries/UniswapV2Library.sol` on lines **113** to **129**

```solidity
    function getAmountsOut(
        address factory,
        uint256 amountIn,
        address[] memory path
    ) internal view returns (uint256[] memory amounts) {
        require(path.length >= 2, "UniswapV2Library: INVALID_PATH");
        amounts = new uint256[](path.length);
        amounts[0] = amountIn;
        for (uint256 i; i < path.length - 1; i++) {
            (uint256 reserveIn, uint256 reserveOut) = getReserves(
                factory,
                path[i],
                path[i + 1]
            );
            amounts[i + 1] = getAmountOut(amounts[i], reserveIn, reserveOut);
        }
    }

```
