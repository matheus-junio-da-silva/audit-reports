# Context: VaderRouter.calculateOutGivenIn

**Contract:** `VaderRouter` (Inherits: Ownable, Context, ProtocolConstants, IVaderRouter)
**Signature:** `calculateOutGivenIn(uint256,address[]) returns (uint256)`
**Method Selector ID:** `0xb172c2e1`
**Visibility:** `external`
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
- `IVaderPool.TUPLE_13(uint112,uint112,uint32) = HIGH_LEVEL_CALL, dest:pool1(IVaderPool), function:getReserves, arguments:[]  `
- `IVaderPool.TUPLE_11(uint112,uint112,uint32) = HIGH_LEVEL_CALL, dest:pool(IVaderPool), function:getReserves, arguments:[]  `
- `VaderMath.TMP_251(uint256) = LIBRARY_CALL, dest:VaderMath, function:VaderMath.calculateSwap(uint256,uint256,uint256), arguments:['amountIn', 'nativeReserve', 'foreignReserve'] `
- `IVaderPoolFactory.TMP_253(IVaderPool) = HIGH_LEVEL_CALL, dest:factory(IVaderPoolFactory), function:getPool, arguments:['REF_110', 'REF_111']  `
- `IVaderPoolFactory.TMP_254(IVaderPool) = HIGH_LEVEL_CALL, dest:factory(IVaderPoolFactory), function:getPool, arguments:['REF_113', 'REF_114']  `
- `IVaderPool.TUPLE_12(uint112,uint112,uint32) = HIGH_LEVEL_CALL, dest:pool0(IVaderPool), function:getReserves, arguments:[]  `
- `VaderMath.TMP_256(uint256) = LIBRARY_CALL, dest:VaderMath, function:VaderMath.calculateSwap(uint256,uint256,uint256), arguments:['TMP_255', 'foreignReserve0', 'nativeReserve0'] `
- `IVaderPoolFactory.TMP_249(IVaderPool) = HIGH_LEVEL_CALL, dest:factory(IVaderPoolFactory), function:getPool, arguments:['REF_103', 'REF_104']  `
- `VaderMath.TMP_252(uint256) = LIBRARY_CALL, dest:VaderMath, function:VaderMath.calculateSwap(uint256,uint256,uint256), arguments:['amountIn', 'foreignReserve', 'nativeReserve'] `
- `VaderMath.TMP_255(uint256) = LIBRARY_CALL, dest:VaderMath, function:VaderMath.calculateSwap(uint256,uint256,uint256), arguments:['amountIn', 'nativeReserve1', 'foreignReserve1'] `
- `IVaderPoolFactory.TMP_248(address) = HIGH_LEVEL_CALL, dest:factory(IVaderPoolFactory), function:nativeAsset, arguments:[]  `

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
    Node_8["8: NodeType.RETURN - VaderMath.calculateSwap(amountIn,nativeReserve,foreignReserve)"]
    Node_9["9: NodeType.RETURN - VaderMath.calculateSwap(amountIn,foreignReserve,nativeReserve)"]
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
    Node_19["19: NodeType.RETURN - VaderMath.calculateSwap(VaderMath.calculateSwap(amountIn,nativeReserve1,foreignReserve1),foreignReserve0,nativeReserve0)"]
    Node_21["21: NodeType.RETURN - amountOut"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/dex/router/VaderRouter.sol` on lines **453** to **497**

```solidity
    function calculateOutGivenIn(uint256 amountIn, address[] calldata path)
        external
        view
        returns (uint256 amountOut)
    {
        if (path.length == 2) {
            address nativeAsset = factory.nativeAsset();
            IVaderPool pool = factory.getPool(path[0], path[1]);
            (uint256 nativeReserve, uint256 foreignReserve, ) = pool
                .getReserves();
            if (path[0] == nativeAsset) {
                return
                    VaderMath.calculateSwap(
                        amountIn,
                        nativeReserve,
                        foreignReserve
                    );
            } else {
                return
                    VaderMath.calculateSwap(
                        amountIn,
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
                VaderMath.calculateSwap(
                    VaderMath.calculateSwap(
                        amountIn,
                        nativeReserve1,
                        foreignReserve1
                    ),
                    foreignReserve0,
                    nativeReserve0
                );
        }
    }

```
