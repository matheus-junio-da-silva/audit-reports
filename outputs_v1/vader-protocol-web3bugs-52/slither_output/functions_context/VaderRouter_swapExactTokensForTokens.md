# Context: VaderRouter.swapExactTokensForTokens

**Contract:** `VaderRouter` (Inherits: Ownable, Context, ProtocolConstants, IVaderRouter)
**Signature:** `swapExactTokensForTokens(uint256,uint256,address[],address,uint256) returns (uint256)`
**Method Selector ID:** `0x38ed1739`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `ensure`
  ```solidity
  modifier ensure(uint256 deadline) {
          require(deadline >= block.timestamp, "VaderRouter::ensure: Expired");
          _;
      }
  ```

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(amountOut >= amountOutMin,VaderRouter::swapExactTokensForTokens: Insufficient Trade Output)`

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
    Node_0 --> Node_3
    Node_1["1: NodeType.EXPRESSION - amountOut = _swap(amountIn,path,to)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(amountOut >= amountOutMin,VaderRouter::swapExactTokensForTokens: Insufficient Trade Output)"]
    Node_2 --> Node_4
    Node_3["3: NodeType.EXPRESSION - ensure(deadline)"]
    Node_3 --> Node_1
    Node_4["4: NodeType.RETURN - amountOut"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/dex/router/VaderRouter.sol` on lines **219** to **232**

```solidity
    function swapExactTokensForTokens(
        uint256 amountIn,
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external virtual override ensure(deadline) returns (uint256 amountOut) {
        amountOut = _swap(amountIn, path, to);

        require(
            amountOut >= amountOutMin,
            "VaderRouter::swapExactTokensForTokens: Insufficient Trade Output"
        );
    }

```
