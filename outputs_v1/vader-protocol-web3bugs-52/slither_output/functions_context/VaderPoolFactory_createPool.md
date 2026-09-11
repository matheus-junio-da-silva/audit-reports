# Context: VaderPoolFactory.createPool

**Contract:** `VaderPoolFactory` (Inherits: Ownable, Context, ProtocolConstants, IVaderPoolFactory)
**Signature:** `createPool(address,address) returns (IVaderPool)`
**Method Selector ID:** `0xe3433615`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** _ZERO_ADDRESS, allPools, getPool, nativeAsset, queueActive
- **Writes:** allPools, getPool

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(token0 != token1,VaderPoolFactory::createPool: Identical Tokens)`
- require/assert: `require(bool,string)(token1 != _ZERO_ADDRESS,VaderPoolFactory::createPool: Inexistent Token)`
- require/assert: `require(bool,string)(getPool[token0][token1] == IVaderPool(_ZERO_ADDRESS),VaderPoolFactory::createPool: Pair Exists)`

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
    Node_1["1: NodeType.VARIABLE - "]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - "]
    Node_2 --> Node_12
    Node_4["4: NodeType.EXPRESSION - require(bool,string)(token0 != token1,VaderPoolFactory::createPool: Identical Tokens)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - require(bool,string)(token1 != _ZERO_ADDRESS,VaderPoolFactory::createPool: Inexistent Token)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - require(bool,string)(getPool(token0)(token1) == IVaderPool(_ZERO_ADDRESS),VaderPoolFactory::createPool: Pair Exists)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - pool = new VaderPool(queueActive,IERC20Extended(token0),IERC20Extended(token1))"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - getPool(token0)(token1) = pool"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - getPool(token1)(token0) = pool"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - allPools.push(pool)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - PoolCreated(token0,token1,pool,allPools.length)"]
    Node_11 --> Node_20
    Node_12["12: NodeType.IF - tokenA == nativeAsset"]
    Node_12 --> Node_13
    Node_12 --> Node_16
    Node_13["13: NodeType.EXPRESSION - (token0,token1) = (tokenA,tokenB)"]
    Node_13 --> Node_15
    Node_15["15: NodeType.ENDIF - "]
    Node_15 --> Node_4
    Node_16["16: NodeType.IF - tokenB == nativeAsset"]
    Node_16 --> Node_17
    Node_16 --> Node_18
    Node_17["17: NodeType.EXPRESSION - (token0,token1) = (tokenB,tokenA)"]
    Node_17 --> Node_19
    Node_18["18: NodeType.EXPRESSION - (token0,token1) = (_ZERO_ADDRESS,_ZERO_ADDRESS)"]
    Node_18 --> Node_19
    Node_19["19: NodeType.ENDIF - "]
    Node_19 --> Node_15
    Node_20["20: NodeType.RETURN - pool"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/dex/pool/VaderPoolFactory.sol` on lines **54** to **89**

```solidity
    function createPool(address tokenA, address tokenB)
        external
        override
        returns (IVaderPool pool)
    {
        (address token0, address token1) = tokenA == nativeAsset
            ? (tokenA, tokenB)
            : tokenB == nativeAsset
            ? (tokenB, tokenA)
            : (_ZERO_ADDRESS, _ZERO_ADDRESS);

        require(
            token0 != token1,
            "VaderPoolFactory::createPool: Identical Tokens"
        );

        require(
            token1 != _ZERO_ADDRESS,
            "VaderPoolFactory::createPool: Inexistent Token"
        );

        require(
            getPool[token0][token1] == IVaderPool(_ZERO_ADDRESS),
            "VaderPoolFactory::createPool: Pair Exists"
        ); // single check is sufficient

        pool = new VaderPool(
            queueActive,
            IERC20Extended(token0),
            IERC20Extended(token1)
        );
        getPool[token0][token1] = pool;
        getPool[token1][token0] = pool; // populate mapping in the reverse direction
        allPools.push(pool);
        emit PoolCreated(token0, token1, pool, allPools.length);
    }

```
