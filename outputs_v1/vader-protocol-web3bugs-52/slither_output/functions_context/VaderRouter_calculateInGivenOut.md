# Context: VaderRouter.calculateInGivenOut

**Contract:** `VaderRouter` (Inherits: Ownable, Context, ProtocolConstants, IVaderRouter)
**Signature:** `calculateInGivenOut(uint256,address[]) returns (uint256)`
**Method Selector ID:** `0x6f6eced2`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** factory
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IVaderPoolFactory.TMP_243(IVaderPool) = HIGH_LEVEL_CALL, dest:factory(IVaderPoolFactory), function:getPool, arguments:['REF_91', 'REF_92']  `
- `IVaderPoolFactory.TMP_244(IVaderPool) = HIGH_LEVEL_CALL, dest:factory(IVaderPoolFactory), function:getPool, arguments:['REF_94', 'REF_95']  `
- `VaderMath.TMP_245(uint256) = LIBRARY_CALL, dest:VaderMath, function:VaderMath.calculateSwapReverse(uint256,uint256,uint256), arguments:['amountOut', 'nativeReserve1', 'foreignReserve1'] `
- `VaderMath.TMP_246(uint256) = LIBRARY_CALL, dest:VaderMath, function:VaderMath.calculateSwapReverse(uint256,uint256,uint256), arguments:['TMP_245', 'foreignReserve0', 'nativeReserve0'] `
- `IVaderPool.TUPLE_8(uint112,uint112,uint32) = HIGH_LEVEL_CALL, dest:pool(IVaderPool), function:getReserves, arguments:[]  `
- `IVaderPoolFactory.TMP_238(address) = HIGH_LEVEL_CALL, dest:factory(IVaderPoolFactory), function:nativeAsset, arguments:[]  `
- `VaderMath.TMP_242(uint256) = LIBRARY_CALL, dest:VaderMath, function:VaderMath.calculateSwapReverse(uint256,uint256,uint256), arguments:['amountOut', 'foreignReserve', 'nativeReserve'] `
- `IVaderPool.TUPLE_9(uint112,uint112,uint32) = HIGH_LEVEL_CALL, dest:pool0(IVaderPool), function:getReserves, arguments:[]  `
- `VaderMath.TMP_241(uint256) = LIBRARY_CALL, dest:VaderMath, function:VaderMath.calculateSwapReverse(uint256,uint256,uint256), arguments:['amountOut', 'nativeReserve', 'foreignReserve'] `
- `IVaderPoolFactory.TMP_239(IVaderPool) = HIGH_LEVEL_CALL, dest:factory(IVaderPoolFactory), function:getPool, arguments:['REF_84', 'REF_85']  `
- `IVaderPool.TUPLE_10(uint112,uint112,uint32) = HIGH_LEVEL_CALL, dest:pool1(IVaderPool), function:getReserves, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.IF - path.length == 2"]
    Node_1 --> Node_2
    Node_1 --> Node_11
    Node_2["2: NodeType.VARIABLE - nativeAsset = factory.nativeAsset()"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - pool = factory.getPool(path(0),path(1))"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - (nativeReserve,foreignReserve,None) = pool.getReserves()"]
    Node_6 --> Node_7
    Node_7["7: NodeType.IF - path(0) == nativeAsset"]
    Node_7 --> Node_8
    Node_7 --> Node_9
    Node_8["8: NodeType.RETURN - VaderMath.calculateSwapReverse(amountOut,nativeReserve,foreignReserve)"]
    Node_9["9: NodeType.RETURN - VaderMath.calculateSwapReverse(amountOut,foreignReserve,nativeReserve)"]
    Node_11["11: NodeType.VARIABLE - pool0 = factory.getPool(path(0),path(1))"]
    Node_11 --> Node_12
    Node_12["12: NodeType.VARIABLE - pool1 = factory.getPool(path(1),path(2))"]
    Node_12 --> Node_13
    Node_13["13: NodeType.VARIABLE - "]
    Node_13 --> Node_14
    Node_14["14: NodeType.VARIABLE - "]
    Node_14 --> Node_15
    Node_15["15: NodeType.EXPRESSION - (nativeReserve0,foreignReserve0,None) = pool0.getReserves()"]
    Node_15 --> Node_16
    Node_16["16: NodeType.VARIABLE - "]
    Node_16 --> Node_17
    Node_17["17: NodeType.VARIABLE - "]
    Node_17 --> Node_18
    Node_18["18: NodeType.EXPRESSION - (nativeReserve1,foreignReserve1,None) = pool1.getReserves()"]
    Node_18 --> Node_19
    Node_19["19: NodeType.RETURN - VaderMath.calculateSwapReverse(VaderMath.calculateSwapReverse(amountOut,nativeReserve1,foreignReserve1),foreignReserve0,nativeReserve0)"]
    Node_21["21: NodeType.RETURN - amountIn"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/dex/router/VaderRouter.sol` on lines **394** to **438**

```solidity
    function calculateInGivenOut(uint256 amountOut, address[] calldata path)
        public
        view
        returns (uint256 amountIn)
    {
        if (path.length == 2) {
            address nativeAsset = factory.nativeAsset();
            IVaderPool pool = factory.getPool(path[0], path[1]);
            (uint256 nativeReserve, uint256 foreignReserve, ) = pool
                .getReserves();
            if (path[0] == nativeAsset) {
                return
                    VaderMath.calculateSwapReverse(
                        amountOut,
                        nativeReserve,
                        foreignReserve
                    );
            } else {
                return
                    VaderMath.calculateSwapReverse(
                        amountOut,
                        foreignReserve,
                        nativeReserve
                    );
            }
        } else {
            IVaderPool pool0 = factory.getPool(path[0], path[1]);
            IVaderPool pool1 = factory.getPool(path[1], path[2]);
            (uint256 nativeReserve0, uint256 foreignReserve0, ) = pool0
                .getReserves();
            (uint256 nativeReserve1, uint256 foreignReserve1, ) = pool1
                .getReserves();

            return
                VaderMath.calculateSwapReverse(
                    VaderMath.calculateSwapReverse(
                        amountOut,
                        nativeReserve1,
                        foreignReserve1
                    ),
                    foreignReserve0,
                    nativeReserve0
                );
        }
    }

```
