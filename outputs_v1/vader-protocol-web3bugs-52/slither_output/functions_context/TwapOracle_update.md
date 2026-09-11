# Context: TwapOracle.update

**Contract:** `TwapOracle` (Inherits: Ownable, Context)
**Signature:** `update()`
**Method Selector ID:** `0xa2e62045`
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
- **Reads:** VADER, _pairs, _updatePeriod, _vaderPool
- **Writes:** _pairs

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(timeElapsed >= _updatePeriod,TwapOracle::update: Period not elapsed)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IVaderPoolV2.TUPLE_12(uint256,uint256,uint32) = HIGH_LEVEL_CALL, dest:_vaderPool(IVaderPoolV2), function:cumulativePrices, arguments:['TMP_502']  `
- `UniswapV2OracleLibrary.TUPLE_11(uint256,uint256,uint32) = LIBRARY_CALL, dest:UniswapV2OracleLibrary, function:UniswapV2OracleLibrary.currentCumulativePrices(address), arguments:['REF_117'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_19
    Node_1["1: NodeType.VARIABLE - pairCount = _pairs.length"]
    Node_1 --> Node_4
    Node_2["2: NodeType.STARTLOOP - "]
    Node_2 --> Node_5
    Node_3["3: NodeType.ENDLOOP - "]
    Node_4["4: NodeType.VARIABLE - i = 0"]
    Node_4 --> Node_2
    Node_5["5: NodeType.IFLOOP - i < pairCount"]
    Node_5 --> Node_6
    Node_5 --> Node_3
    Node_6["6: NodeType.VARIABLE - pairData = _pairs(i)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - "]
    Node_7 --> Node_8
    Node_8["8: NodeType.VARIABLE - "]
    Node_8 --> Node_9
    Node_9["9: NodeType.VARIABLE - "]
    Node_9 --> Node_21
    Node_11["11: NodeType.VARIABLE - timeElapsed = blockTimestamp - pairData.blockTimestampLast"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - require(bool,string)(timeElapsed >= _updatePeriod,TwapOracle::update: Period not elapsed)"]
    Node_12 --> Node_13
    Node_13["13: NodeType.EXPRESSION - pairData.price0Average = FixedPoint.uq112x112(uint224((price0Cumulative - pairData.price0CumulativeLast) / timeElapsed))"]
    Node_13 --> Node_14
    Node_14["14: NodeType.EXPRESSION - pairData.price1Average = FixedPoint.uq112x112(uint224((price1Cumulative - pairData.price1CumulativeLast) / timeElapsed))"]
    Node_14 --> Node_15
    Node_15["15: NodeType.EXPRESSION - pairData.price0CumulativeLast = price0Cumulative"]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - pairData.price1CumulativeLast = price1Cumulative"]
    Node_16 --> Node_17
    Node_17["17: NodeType.EXPRESSION - pairData.blockTimestampLast = blockTimestamp"]
    Node_17 --> Node_18
    Node_18["18: NodeType.EXPRESSION - i ++"]
    Node_18 --> Node_5
    Node_19["19: NodeType.EXPRESSION - onlyOwner()"]
    Node_19 --> Node_20
    Node_20["20: NodeType.EXPRESSION - initialized()"]
    Node_20 --> Node_1
    Node_21["21: NodeType.IF - (pairData.token0 == VADER)"]
    Node_21 --> Node_22
    Node_21 --> Node_23
    Node_22["22: NodeType.EXPRESSION - (price0Cumulative,price1Cumulative,blockTimestamp) = UniswapV2OracleLibrary.currentCumulativePrices(pairData.pair)"]
    Node_22 --> Node_24
    Node_23["23: NodeType.EXPRESSION - (price0Cumulative,price1Cumulative,blockTimestamp) = _vaderPool.cumulativePrices(IERC20(pairData.token1))"]
    Node_23 --> Node_24
    Node_24["24: NodeType.ENDIF - "]
    Node_24 --> Node_11
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/twap/TwapOracle.sol` on lines **322** to **369**

```solidity
    function update() external onlyOwner initialized {
        uint256 pairCount = _pairs.length;

        // Update all of the registered pairs in the TWAP oracle.
        for (uint256 i = 0; i < pairCount; i++) {
            PairData storage pairData = _pairs[i];

            // Get the current cumulative prices and block timestamp of the current pairing.
            (
                uint256 price0Cumulative,
                uint256 price1Cumulative,
                uint32 blockTimestamp
            ) = (pairData.token0 == VADER)
                    ? UniswapV2OracleLibrary.currentCumulativePrices(
                        pairData.pair
                    )
                    : _vaderPool.cumulativePrices(IERC20(pairData.token1));

            unchecked {
                // Ensure that at least one full period has passed since the pairing was last update.
                uint32 timeElapsed = blockTimestamp -
                    pairData.blockTimestampLast;
                require(
                    timeElapsed >= _updatePeriod,
                    "TwapOracle::update: Period not elapsed"
                );

                // Cumulative price is in (uq112x112 price * seconds) units so we simply wrap it after division by time elapsed.
                pairData.price0Average = FixedPoint.uq112x112(
                    uint224(
                        (price0Cumulative - pairData.price0CumulativeLast) /
                            timeElapsed
                    )
                );
                pairData.price1Average = FixedPoint.uq112x112(
                    uint224(
                        (price1Cumulative - pairData.price1CumulativeLast) /
                            timeElapsed
                    )
                );
            }

            // Update the stored pairing data
            pairData.price0CumulativeLast = price0Cumulative;
            pairData.price1CumulativeLast = price1Cumulative;
            pairData.blockTimestampLast = blockTimestamp;
        }
    }

```
