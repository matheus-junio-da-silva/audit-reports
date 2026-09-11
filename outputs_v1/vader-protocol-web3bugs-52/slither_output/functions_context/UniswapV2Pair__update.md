# Context: UniswapV2Pair._update

**Contract:** `UniswapV2Pair` (Inherits: UniswapV2ERC20, IUniswapV2Pair, IUniswapV2ERC20)
**Signature:** `_update(uint256,uint256,uint112,uint112)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `private`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** blockTimestampLast, price0CumulativeLast, price1CumulativeLast, reserve0, reserve1
- **Writes:** blockTimestampLast, price0CumulativeLast, price1CumulativeLast, reserve0, reserve1

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(balance0 <= type()(uint112).max && balance1 <= type()(uint112).max,UniswapV2: OVERFLOW)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `UQ112x112.TMP_109(uint224) = LIBRARY_CALL, dest:UQ112x112, function:UQ112x112.encode(uint112), arguments:['_reserve1'] `
- `UQ112x112.TMP_113(uint224) = LIBRARY_CALL, dest:UQ112x112, function:UQ112x112.encode(uint112), arguments:['_reserve0'] `
- `UQ112x112.TMP_114(uint224) = LIBRARY_CALL, dest:UQ112x112, function:UQ112x112.uqdiv(uint224,uint112), arguments:['TMP_113', '_reserve1'] `
- `UQ112x112.TMP_110(uint224) = LIBRARY_CALL, dest:UQ112x112, function:UQ112x112.uqdiv(uint224,uint112), arguments:['TMP_109', '_reserve0'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(balance0 <= type()(uint112).max && balance1 <= type()(uint112).max,UniswapV2: OVERFLOW)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - blockTimestamp = uint32(block.timestamp % 2 ** 32)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - timeElapsed = blockTimestamp - blockTimestampLast"]
    Node_3 --> Node_4
    Node_4["4: NodeType.IF - timeElapsed > 0 && _reserve0 != 0 && _reserve1 != 0"]
    Node_4 --> Node_5
    Node_4 --> Node_7
    Node_5["5: NodeType.EXPRESSION - price0CumulativeLast += uint256(UQ112x112.encode(_reserve1).uqdiv(_reserve0)) * timeElapsed"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - price1CumulativeLast += uint256(UQ112x112.encode(_reserve0).uqdiv(_reserve1)) * timeElapsed"]
    Node_6 --> Node_7
    Node_7["7: NodeType.ENDIF - "]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - reserve0 = uint112(balance0)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - reserve1 = uint112(balance1)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - blockTimestampLast = blockTimestamp"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - Sync(reserve0,reserve1)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/external/UniswapV2Pair.sol` on lines **80** to **105**

```solidity
    function _update(
        uint256 balance0,
        uint256 balance1,
        uint112 _reserve0,
        uint112 _reserve1
    ) private {
        require(
            balance0 <= type(uint112).max && balance1 <= type(uint112).max,
            "UniswapV2: OVERFLOW"
        );
        uint32 blockTimestamp = uint32(block.timestamp % 2**32);
        uint32 timeElapsed = blockTimestamp - blockTimestampLast; // overflow is desired
        if (timeElapsed > 0 && _reserve0 != 0 && _reserve1 != 0) {
            // * never overflows, and + overflow is desired
            price0CumulativeLast +=
                uint256(UQ112x112.encode(_reserve1).uqdiv(_reserve0)) *
                timeElapsed;
            price1CumulativeLast +=
                uint256(UQ112x112.encode(_reserve0).uqdiv(_reserve1)) *
                timeElapsed;
        }
        reserve0 = uint112(balance0);
        reserve1 = uint112(balance1);
        blockTimestampLast = blockTimestamp;
        emit Sync(reserve0, reserve1);
    }

```
