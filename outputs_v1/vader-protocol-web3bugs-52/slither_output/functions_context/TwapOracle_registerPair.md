# Context: TwapOracle.registerPair

**Contract:** `TwapOracle` (Inherits: Ownable, Context)
**Signature:** `registerPair(address,address,address)`
**Method Selector ID:** `0xbfbd0297`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyOwner`
  ```solidity
  modifier onlyOwner() {
          _checkOwner();
          _;
      }
  ```
- `initialized`
  ```solidity
  modifier initialized() {
          require(
              VADER != address(0) && USDV != address(0),
              "TwapOracle::initialized: not initialized"
          );
          _;
      }
  ```

### State Variables Interaction
- **Reads:** USDV, VADER, _pairs, _vaderPool
- **Writes:** _pairExists, _pairs

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(token0 == VADER || token0 == USDV,TwapOracle::registerPair: Invalid token0 address)`
- require/assert: `require(bool,string)(token0 != token1,TwapOracle::registerPair: Same token address)`
- require/assert: `require(bool,string)(! pairExists(token0,token1),TwapOracle::registerPair: Pair exists)`
- require/assert: `require(bool,string)(reserve0 != 0 && reserve1 != 0,TwapOracle::registerPair: No reserves)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IUniswapV2Pair.TMP_468(uint256) = HIGH_LEVEL_CALL, dest:pair(IUniswapV2Pair), function:price1CumulativeLast, arguments:[]  `
- `IVaderPoolV2.TUPLE_10(uint112,uint112,uint32) = HIGH_LEVEL_CALL, dest:_vaderPool(IVaderPoolV2), function:getReserves, arguments:['TMP_471']  `
- `IVaderPoolV2.TUPLE_9(uint256,uint256,uint32) = HIGH_LEVEL_CALL, dest:_vaderPool(IVaderPoolV2), function:cumulativePrices, arguments:['TMP_470']  `
- `IUniswapV2Factory.TMP_464(address) = HIGH_LEVEL_CALL, dest:TMP_463(IUniswapV2Factory), function:getPair, arguments:['token0', 'token1']  `
- `IUniswapV2Pair.TUPLE_8(uint112,uint112,uint32) = HIGH_LEVEL_CALL, dest:pair(IUniswapV2Pair), function:getReserves, arguments:[]  `
- `IUniswapV2Pair.TMP_467(uint256) = HIGH_LEVEL_CALL, dest:pair(IUniswapV2Pair), function:price0CumulativeLast, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_23
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(token0 == VADER || token0 == USDV,TwapOracle::registerPair: Invalid token0 address)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(token0 != token1,TwapOracle::registerPair: Same token address)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - require(bool,string)(! pairExists(token0,token1),TwapOracle::registerPair: Pair exists)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - "]
    Node_7 --> Node_8
    Node_8["8: NodeType.VARIABLE - "]
    Node_8 --> Node_9
    Node_9["9: NodeType.VARIABLE - "]
    Node_9 --> Node_10
    Node_10["10: NodeType.IF - token0 == VADER"]
    Node_10 --> Node_11
    Node_10 --> Node_16
    Node_11["11: NodeType.VARIABLE - pair = IUniswapV2Pair(IUniswapV2Factory(factory).getPair(token0,token1))"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - pairAddr = address(pair)"]
    Node_12 --> Node_13
    Node_13["13: NodeType.EXPRESSION - price0CumulativeLast = pair.price0CumulativeLast()"]
    Node_13 --> Node_14
    Node_14["14: NodeType.EXPRESSION - price1CumulativeLast = pair.price1CumulativeLast()"]
    Node_14 --> Node_15
    Node_15["15: NodeType.EXPRESSION - (reserve0,reserve1,blockTimestampLast) = pair.getReserves()"]
    Node_15 --> Node_19
    Node_16["16: NodeType.EXPRESSION - pairAddr = address(_vaderPool)"]
    Node_16 --> Node_17
    Node_17["17: NodeType.EXPRESSION - (price0CumulativeLast,price1CumulativeLast,None) = _vaderPool.cumulativePrices(IERC20(token1))"]
    Node_17 --> Node_18
    Node_18["18: NodeType.EXPRESSION - (reserve0,reserve1,blockTimestampLast) = _vaderPool.getReserves(IERC20(token1))"]
    Node_18 --> Node_19
    Node_19["19: NodeType.ENDIF - "]
    Node_19 --> Node_20
    Node_20["20: NodeType.EXPRESSION - require(bool,string)(reserve0 != 0 && reserve1 != 0,TwapOracle::registerPair: No reserves)"]
    Node_20 --> Node_21
    Node_21["21: NodeType.EXPRESSION - _pairExists(keccak256(bytes)(abi.encodePacked(token0,token1))) = true"]
    Node_21 --> Node_22
    Node_22["22: NodeType.EXPRESSION - _pairs.push(PairData((pair:pairAddr,token0:token0,token1:token1,price0CumulativeLast:price0CumulativeLast,price1CumulativeLast:price1CumulativeLast,blockTimestampLast:blockTimestampLast,price0Average:FixedPoint.uq112x112((_x:0)),price1Average:FixedPoint.uq112x112((_x:0)))))"]
    Node_23["23: NodeType.EXPRESSION - onlyOwner()"]
    Node_23 --> Node_24
    Node_24["24: NodeType.EXPRESSION - initialized()"]
    Node_24 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/twap/TwapOracle.sol` on lines **256** to **317**

```solidity
    function registerPair(
        address factory,
        address token0,
        address token1
    ) external onlyOwner initialized {
        require(
            token0 == VADER || token0 == USDV,
            "TwapOracle::registerPair: Invalid token0 address"
        );
        require(
            token0 != token1,
            "TwapOracle::registerPair: Same token address"
        );
        require(
            !pairExists(token0, token1),
            "TwapOracle::registerPair: Pair exists"
        );

        address pairAddr;
        uint256 price0CumulativeLast;
        uint256 price1CumulativeLast;
        uint112 reserve0;
        uint112 reserve1;
        uint32 blockTimestampLast;

        if (token0 == VADER) {
            IUniswapV2Pair pair = IUniswapV2Pair(
                IUniswapV2Factory(factory).getPair(token0, token1)
            );
            pairAddr = address(pair);
            price0CumulativeLast = pair.price0CumulativeLast();
            price1CumulativeLast = pair.price1CumulativeLast();
            (reserve0, reserve1, blockTimestampLast) = pair.getReserves();
        } else {
            pairAddr = address(_vaderPool);
            (price0CumulativeLast, price1CumulativeLast, ) = _vaderPool
                .cumulativePrices(IERC20(token1));
            (reserve0, reserve1, blockTimestampLast) = _vaderPool.getReserves(
                IERC20(token1)
            );
        }

        require(
            reserve0 != 0 && reserve1 != 0,
            "TwapOracle::registerPair: No reserves"
        );

        _pairExists[keccak256(abi.encodePacked(token0, token1))] = true;

        _pairs.push(
            PairData({
                pair: pairAddr,
                token0: token0,
                token1: token1,
                price0CumulativeLast: price0CumulativeLast,
                price1CumulativeLast: price1CumulativeLast,
                blockTimestampLast: blockTimestampLast,
                price0Average: FixedPoint.uq112x112({_x: 0}),
                price1Average: FixedPoint.uq112x112({_x: 0})
            })
        );
    }

```
