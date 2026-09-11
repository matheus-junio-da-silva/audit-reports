# Context: dummyUniV2Router.swap

**Contract:** `dummyUniV2Router` (Inherits: BoringOwnable, BoringOwnableData, IsYETIRouter)
**Signature:** `swap(uint256,uint256,address) returns (uint256[])`
**Method Selector ID:** `0x6d9a640a`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** JOERouter, JOERouterAddress, path, yusdToken
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool)(cachedYUSDToken.approve(cachedJOERouterAddress,0))`
- require/assert: `require(bool)(cachedYUSDToken.increaseAllowance(cachedJOERouterAddress,_YUSDAmount))`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IRouter.TMP_40(uint256[]) = HIGH_LEVEL_CALL, dest:JOERouter(IRouter), function:swapExactTokensForTokens, arguments:['_YUSDAmount', '_minYETIOut', 'path', '_to', 'block.timestamp']  `
- `IERC20.TMP_36(bool) = HIGH_LEVEL_CALL, dest:cachedYUSDToken(IERC20), function:approve, arguments:['cachedJOERouterAddress', '0']  `
- `IERC20.TMP_38(bool) = HIGH_LEVEL_CALL, dest:cachedYUSDToken(IERC20), function:increaseAllowance, arguments:['cachedJOERouterAddress', '_YUSDAmount']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - cachedJOERouterAddress = JOERouterAddress"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - cachedYUSDToken = yusdToken"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - require(bool)(cachedYUSDToken.approve(cachedJOERouterAddress,0))"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - require(bool)(cachedYUSDToken.increaseAllowance(cachedJOERouterAddress,_YUSDAmount))"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - amounts = JOERouter.swapExactTokensForTokens(_YUSDAmount,_minYETIOut,path,_to,block.timestamp)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.RETURN - amounts"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/YETI/YUSDToYETIRouters/dummyUniV2Router.sol` on lines **29** to **35**

```solidity
    function swap(uint256 _YUSDAmount, uint256 _minYETIOut, address _to) external override returns (uint256[] memory amounts) {
        address cachedJOERouterAddress = JOERouterAddress;
        IERC20 cachedYUSDToken = yusdToken;
        require(cachedYUSDToken.approve(cachedJOERouterAddress, 0));
        require(cachedYUSDToken.increaseAllowance(cachedJOERouterAddress, _YUSDAmount));
        amounts = JOERouter.swapExactTokensForTokens(_YUSDAmount, _minYETIOut, path, _to, block.timestamp);
    }

```
