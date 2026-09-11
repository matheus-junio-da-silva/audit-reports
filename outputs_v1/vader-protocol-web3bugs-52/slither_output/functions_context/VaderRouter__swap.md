# Context: VaderRouter._swap

**Contract:** `VaderRouter` (Inherits: Ownable, Context, ProtocolConstants, IVaderRouter)
**Signature:** `_swap(uint256,address[],address) returns (uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `private`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** factory
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(path[0] != path[1] && path[1] == factory.nativeAsset() && path[2] != path[1],VaderRouter::_swap: Incorrect Path)`
- require/assert: `require(bool,string)(path.length == 2,VaderRouter::_swap: Incorrect Path Length)`
- require/assert: `require(bool,string)(path[0] != path[1],VaderRouter::_swap: Incorrect Path)`
- require/assert: `require(bool,string)(path[1] == nativeAsset,VaderRouter::_swap: Incorrect Path)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IVaderPool.TMP_232(uint256) = HIGH_LEVEL_CALL, dest:pool(IVaderPool), function:swap, arguments:['0', 'amountIn', 'to']  `
- `IVaderPool.TMP_217(uint256) = HIGH_LEVEL_CALL, dest:pool0(IVaderPool), function:swap, arguments:['amountIn', '0', 'TMP_216']  `
- `SafeERC20.LIBRARY_CALL, dest:SafeERC20, function:SafeERC20.safeTransferFrom(IERC20,address,address,uint256), arguments:['TMP_213', 'msg.sender', 'TMP_214', 'amountIn'] `
- `IVaderPoolFactory.TMP_224(IVaderPool) = HIGH_LEVEL_CALL, dest:factory(IVaderPoolFactory), function:getPool, arguments:['REF_71', 'REF_72']  `
- `IVaderPool.TMP_229(uint256) = HIGH_LEVEL_CALL, dest:pool(IVaderPool), function:swap, arguments:['amountIn', '0', 'to']  `
- `SafeERC20.LIBRARY_CALL, dest:SafeERC20, function:SafeERC20.safeTransferFrom(IERC20,address,address,uint256), arguments:['TMP_225', 'msg.sender', 'TMP_226', 'amountIn'] `
- `IVaderPool.TMP_218(uint256) = HIGH_LEVEL_CALL, dest:pool1(IVaderPool), function:swap, arguments:['0', 'TMP_217', 'to']  `
- `IVaderPoolFactory.TMP_211(IVaderPool) = HIGH_LEVEL_CALL, dest:factory(IVaderPoolFactory), function:getPool, arguments:['REF_57', 'REF_58']  `
- `IVaderPoolFactory.TMP_221(address) = HIGH_LEVEL_CALL, dest:factory(IVaderPoolFactory), function:nativeAsset, arguments:[]  `
- `IVaderPoolFactory.TMP_212(IVaderPool) = HIGH_LEVEL_CALL, dest:factory(IVaderPoolFactory), function:getPool, arguments:['REF_60', 'REF_61']  `
- `IVaderPoolFactory.TMP_205(address) = HIGH_LEVEL_CALL, dest:factory(IVaderPoolFactory), function:nativeAsset, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.IF - path.length == 3"]
    Node_1 --> Node_2
    Node_1 --> Node_7
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(path(0) != path(1) && path(1) == factory.nativeAsset() && path(2) != path(1),VaderRouter::_swap: Incorrect Path)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - pool0 = factory.getPool(path(0),path(1))"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - pool1 = factory.getPool(path(1),path(2))"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - IERC20(path(0)).safeTransferFrom(msg.sender,address(pool0),amountIn)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.RETURN - pool1.swap(0,pool0.swap(amountIn,0,address(pool1)),to)"]
    Node_7["7: NodeType.EXPRESSION - require(bool,string)(path.length == 2,VaderRouter::_swap: Incorrect Path Length)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.VARIABLE - nativeAsset = factory.nativeAsset()"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - require(bool,string)(path(0) != path(1),VaderRouter::_swap: Incorrect Path)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.VARIABLE - pool = factory.getPool(path(0),path(1))"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - IERC20(path(0)).safeTransferFrom(msg.sender,address(pool),amountIn)"]
    Node_11 --> Node_12
    Node_12["12: NodeType.IF - path(0) == nativeAsset"]
    Node_12 --> Node_13
    Node_12 --> Node_14
    Node_13["13: NodeType.RETURN - pool.swap(amountIn,0,to)"]
    Node_14["14: NodeType.EXPRESSION - require(bool,string)(path(1) == nativeAsset,VaderRouter::_swap: Incorrect Path)"]
    Node_14 --> Node_15
    Node_15["15: NodeType.RETURN - pool.swap(0,amountIn,to)"]
    Node_18["18: NodeType.RETURN - amountOut"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/dex/router/VaderRouter.sol` on lines **304** to **351**

```solidity
    function _swap(
        uint256 amountIn,
        address[] calldata path,
        address to
    ) private returns (uint256 amountOut) {
        if (path.length == 3) {
            require(
                path[0] != path[1] &&
                    path[1] == factory.nativeAsset() &&
                    path[2] != path[1],
                "VaderRouter::_swap: Incorrect Path"
            );

            IVaderPool pool0 = factory.getPool(path[0], path[1]);
            IVaderPool pool1 = factory.getPool(path[1], path[2]);

            IERC20(path[0]).safeTransferFrom(
                msg.sender,
                address(pool0),
                amountIn
            );

            return pool1.swap(0, pool0.swap(amountIn, 0, address(pool1)), to);
        } else {
            require(
                path.length == 2,
                "VaderRouter::_swap: Incorrect Path Length"
            );
            address nativeAsset = factory.nativeAsset();
            require(path[0] != path[1], "VaderRouter::_swap: Incorrect Path");

            IVaderPool pool = factory.getPool(path[0], path[1]);
            IERC20(path[0]).safeTransferFrom(
                msg.sender,
                address(pool),
                amountIn
            );
            if (path[0] == nativeAsset) {
                return pool.swap(amountIn, 0, to);
            } else {
                require(
                    path[1] == nativeAsset,
                    "VaderRouter::_swap: Incorrect Path"
                );
                return pool.swap(0, amountIn, to);
            }
        }
    }

```
