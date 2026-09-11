# Context: VaderRouter.removeLiquidity

**Contract:** `VaderRouter` (Inherits: Ownable, Context, ProtocolConstants, IVaderRouter)
**Signature:** `removeLiquidity(address,address,uint256,uint256,uint256,address,uint256) returns (uint256, uint256)`
**Method Selector ID:** `0xbaa2abde`
**Visibility:** `public`
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
- **Reads:** factory, reserve
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(amountA >= amountAMin,UniswapV2Router: INSUFFICIENT_A_AMOUNT)`
- require/assert: `require(bool,string)(amountB >= amountBMin,UniswapV2Router: INSUFFICIENT_B_AMOUNT)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IVaderPool.HIGH_LEVEL_CALL, dest:pool(IVaderPool), function:transferFrom, arguments:['msg.sender', 'TMP_179', 'id']  `
- `IVaderReserve.HIGH_LEVEL_CALL, dest:reserve(IVaderReserve), function:reimburseImpermanentLoss, arguments:['msg.sender', 'coveredLoss']  `
- `IVaderPool.TUPLE_7(uint256,uint256,uint256) = HIGH_LEVEL_CALL, dest:pool(IVaderPool), function:burn, arguments:['id', 'to']  `
- `IVaderPoolFactory.TMP_178(IVaderPool) = HIGH_LEVEL_CALL, dest:factory(IVaderPoolFactory), function:getPool, arguments:['tokenA', 'tokenB']  `
- `IVaderPoolFactory.TMP_187(address) = HIGH_LEVEL_CALL, dest:factory(IVaderPoolFactory), function:nativeAsset, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_11
    Node_1["1: NodeType.VARIABLE - pool = factory.getPool(tokenA,tokenB)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - pool.transferFrom(msg.sender,address(pool),id)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - (amountNative,amountForeign,coveredLoss) = pool.burn(id,to)"]
    Node_6 --> Node_12
    Node_8["8: NodeType.EXPRESSION - require(bool,string)(amountA >= amountAMin,UniswapV2Router: INSUFFICIENT_A_AMOUNT)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - require(bool,string)(amountB >= amountBMin,UniswapV2Router: INSUFFICIENT_B_AMOUNT)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - reserve.reimburseImpermanentLoss(msg.sender,coveredLoss)"]
    Node_10 --> Node_16
    Node_11["11: NodeType.EXPRESSION - ensure(deadline)"]
    Node_11 --> Node_1
    Node_12["12: NodeType.IF - tokenA == factory.nativeAsset()"]
    Node_12 --> Node_13
    Node_12 --> Node_14
    Node_13["13: NodeType.EXPRESSION - (amountA,amountB) = (amountNative,amountForeign)"]
    Node_13 --> Node_15
    Node_14["14: NodeType.EXPRESSION - (amountA,amountB) = (amountForeign,amountNative)"]
    Node_14 --> Node_15
    Node_15["15: NodeType.ENDIF - "]
    Node_15 --> Node_8
    Node_16["16: NodeType.RETURN - (amountA,amountB)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/dex/router/VaderRouter.sol` on lines **169** to **207**

```solidity
    function removeLiquidity(
        address tokenA,
        address tokenB,
        uint256 id,
        uint256 amountAMin,
        uint256 amountBMin,
        address to,
        uint256 deadline
    )
        public
        override
        ensure(deadline)
        returns (uint256 amountA, uint256 amountB)
    {
        IVaderPool pool = factory.getPool(tokenA, tokenB);

        pool.transferFrom(msg.sender, address(pool), id);

        (
            uint256 amountNative,
            uint256 amountForeign,
            uint256 coveredLoss
        ) = pool.burn(id, to);

        (amountA, amountB) = tokenA == factory.nativeAsset()
            ? (amountNative, amountForeign)
            : (amountForeign, amountNative);

        require(
            amountA >= amountAMin,
            "UniswapV2Router: INSUFFICIENT_A_AMOUNT"
        );
        require(
            amountB >= amountBMin,
            "UniswapV2Router: INSUFFICIENT_B_AMOUNT"
        );

        reserve.reimburseImpermanentLoss(msg.sender, coveredLoss);
    }

```
