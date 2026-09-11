# Context: UniswapV2Library.quote

**Contract:** `UniswapV2Library` (Inherits: None)
**Signature:** `quote(uint256,uint256,uint256) returns (uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(amountA > 0,UniswapV2Library: INSUFFICIENT_AMOUNT)`
- require/assert: `require(bool,string)(reserveA > 0 && reserveB > 0,UniswapV2Library: INSUFFICIENT_LIQUIDITY)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_311(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['amountA', 'reserveB'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(amountA > 0,UniswapV2Library: INSUFFICIENT_AMOUNT)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(reserveA > 0 && reserveB > 0,UniswapV2Library: INSUFFICIENT_LIQUIDITY)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - amountB = amountA.mul(reserveB) / reserveA"]
    Node_3 --> Node_4
    Node_4["4: NodeType.RETURN - amountB"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/external/libraries/UniswapV2Library.sol` on lines **66** to **77**

```solidity
    function quote(
        uint256 amountA,
        uint256 reserveA,
        uint256 reserveB
    ) internal pure returns (uint256 amountB) {
        require(amountA > 0, "UniswapV2Library: INSUFFICIENT_AMOUNT");
        require(
            reserveA > 0 && reserveB > 0,
            "UniswapV2Library: INSUFFICIENT_LIQUIDITY"
        );
        amountB = amountA.mul(reserveB) / reserveA;
    }

```
