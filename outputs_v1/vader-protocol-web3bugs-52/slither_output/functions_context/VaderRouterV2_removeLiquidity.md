# Context: VaderRouterV2.removeLiquidity

**Contract:** `VaderRouterV2` (Inherits: Ownable, Context, ProtocolConstants, IVaderRouterV2)
**Signature:** `removeLiquidity(address,address,uint256,uint256,uint256,address,uint256) returns (uint256, uint256)`
**Method Selector ID:** `0xbaa2abde`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `ensure`
  ```solidity
  modifier ensure(uint256 deadline) {
          require(deadline >= block.timestamp, "VaderRouterV2::ensure: Expired");
          _;
      }
  ```

### State Variables Interaction
- **Reads:** nativeAsset, pool, reserve
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(IERC20(tokenB) == _foreignAsset,VaderRouterV2::removeLiquidity: Incorrect Addresses Specified)`
- require/assert: `require(bool,string)(IERC20(tokenA) == _foreignAsset && IERC20(tokenB) == _nativeAsset,VaderRouterV2::removeLiquidity: Incorrect Addresses Specified)`
- require/assert: `require(bool,string)(amountA >= amountAMin,VaderRouterV2: INSUFFICIENT_A_AMOUNT)`
- require/assert: `require(bool,string)(amountB >= amountBMin,VaderRouterV2: INSUFFICIENT_B_AMOUNT)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IVaderPoolV2.TMP_124(IERC20) = HIGH_LEVEL_CALL, dest:pool(IVaderPoolV2), function:positionForeignAsset, arguments:['id']  `
- `IVaderPoolV2.HIGH_LEVEL_CALL, dest:pool(IVaderPoolV2), function:transferFrom, arguments:['msg.sender', 'TMP_136', 'id']  `
- `IVaderPoolV2.TUPLE_5(uint256,uint256,uint256) = HIGH_LEVEL_CALL, dest:pool(IVaderPoolV2), function:burn, arguments:['id', 'to']  `
- `IVaderReserve.HIGH_LEVEL_CALL, dest:reserve(IVaderReserve), function:reimburseImpermanentLoss, arguments:['msg.sender', 'coveredLoss']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_17
    Node_1["1: NodeType.VARIABLE - _foreignAsset = pool.positionForeignAsset(id)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - _nativeAsset = nativeAsset"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - isNativeA = _nativeAsset == IERC20(tokenA)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.IF - isNativeA"]
    Node_4 --> Node_5
    Node_4 --> Node_6
    Node_5["5: NodeType.EXPRESSION - require(bool,string)(IERC20(tokenB) == _foreignAsset,VaderRouterV2::removeLiquidity: Incorrect Addresses Specified)"]
    Node_5 --> Node_7
    Node_6["6: NodeType.EXPRESSION - require(bool,string)(IERC20(tokenA) == _foreignAsset && IERC20(tokenB) == _nativeAsset,VaderRouterV2::removeLiquidity: Incorrect Addresses Specified)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.ENDIF - "]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - pool.transferFrom(msg.sender,address(pool),id)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.VARIABLE - "]
    Node_9 --> Node_10
    Node_10["10: NodeType.VARIABLE - "]
    Node_10 --> Node_11
    Node_11["11: NodeType.VARIABLE - "]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - (amountNative,amountForeign,coveredLoss) = pool.burn(id,to)"]
    Node_12 --> Node_18
    Node_14["14: NodeType.EXPRESSION - require(bool,string)(amountA >= amountAMin,VaderRouterV2: INSUFFICIENT_A_AMOUNT)"]
    Node_14 --> Node_15
    Node_15["15: NodeType.EXPRESSION - require(bool,string)(amountB >= amountBMin,VaderRouterV2: INSUFFICIENT_B_AMOUNT)"]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - reserve.reimburseImpermanentLoss(msg.sender,coveredLoss)"]
    Node_16 --> Node_22
    Node_17["17: NodeType.EXPRESSION - ensure(deadline)"]
    Node_17 --> Node_1
    Node_18["18: NodeType.IF - isNativeA"]
    Node_18 --> Node_19
    Node_18 --> Node_20
    Node_19["19: NodeType.EXPRESSION - (amountA,amountB) = (amountNative,amountForeign)"]
    Node_19 --> Node_21
    Node_20["20: NodeType.EXPRESSION - (amountA,amountB) = (amountForeign,amountNative)"]
    Node_20 --> Node_21
    Node_21["21: NodeType.ENDIF - "]
    Node_21 --> Node_14
    Node_22["22: NodeType.RETURN - (amountA,amountB)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/dex-v2/router/VaderRouterV2.sol` on lines **174** to **228**

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
        IERC20 _foreignAsset = pool.positionForeignAsset(id);
        IERC20 _nativeAsset = nativeAsset;

        bool isNativeA = _nativeAsset == IERC20(tokenA);

        if (isNativeA) {
            require(
                IERC20(tokenB) == _foreignAsset,
                "VaderRouterV2::removeLiquidity: Incorrect Addresses Specified"
            );
        } else {
            require(
                IERC20(tokenA) == _foreignAsset &&
                    IERC20(tokenB) == _nativeAsset,
                "VaderRouterV2::removeLiquidity: Incorrect Addresses Specified"
            );
        }

        pool.transferFrom(msg.sender, address(pool), id);

        (
            uint256 amountNative,
            uint256 amountForeign,
            uint256 coveredLoss
        ) = pool.burn(id, to);

        (amountA, amountB) = isNativeA
            ? (amountNative, amountForeign)
            : (amountForeign, amountNative);

        require(
            amountA >= amountAMin,
            "VaderRouterV2: INSUFFICIENT_A_AMOUNT"
        );
        require(
            amountB >= amountBMin,
            "VaderRouterV2: INSUFFICIENT_B_AMOUNT"
        );

        reserve.reimburseImpermanentLoss(msg.sender, coveredLoss);
    }

```
