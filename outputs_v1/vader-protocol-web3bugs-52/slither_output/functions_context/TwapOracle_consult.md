# Context: TwapOracle.consult

**Contract:** `TwapOracle` (Inherits: Ownable, Context)
**Signature:** `consult(address) returns (uint256)`
**Method Selector ID:** `0x283583c6`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** _aggregators, _pairs
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool)(sumNative != 0)`
- require/assert: `require(bool,string)(answeredInRound >= roundID,TwapOracle::consult: stale chainlink price)`
- require/assert: `require(bool,string)(price != 0,TwapOracle::consult: chainlink malfunction)`
- require/assert: `require(bool,string)(sumNative != 0,TwapOracle::consult: Sum of native is zero)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IERC20Metadata.TMP_415(uint8) = HIGH_LEVEL_CALL, dest:TMP_414(IERC20Metadata), function:decimals, arguments:[]  `
- `FixedPoint.TMP_399(uint144) = LIBRARY_CALL, dest:FixedPoint, function:FixedPoint.decode144(FixedPoint.uq144x112), arguments:['TMP_398'] `
- `AggregatorV3Interface.TUPLE_7(uint80,int256,uint256,uint256,uint80) = HIGH_LEVEL_CALL, dest:TMP_403(AggregatorV3Interface), function:latestRoundData, arguments:[]  `
- `FixedPoint.TMP_398(FixedPoint.uq144x112) = LIBRARY_CALL, dest:FixedPoint, function:FixedPoint.mul(FixedPoint.uq112x112,uint256), arguments:['REF_79', '1'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - pairCount = _pairs.length"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - sumNative = 0"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - sumUSD = 0"]
    Node_3 --> Node_6
    Node_4["4: NodeType.STARTLOOP - "]
    Node_4 --> Node_7
    Node_5["5: NodeType.ENDLOOP - "]
    Node_5 --> Node_23
    Node_6["6: NodeType.VARIABLE - i = 0"]
    Node_6 --> Node_4
    Node_7["7: NodeType.IFLOOP - i < pairCount"]
    Node_7 --> Node_8
    Node_7 --> Node_5
    Node_8["8: NodeType.VARIABLE - pairData = _pairs(i)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.IF - token == pairData.token0"]
    Node_9 --> Node_10
    Node_9 --> Node_21
    Node_10["10: NodeType.EXPRESSION - sumNative += pairData.price1Average.mul(1).decode144()"]
    Node_10 --> Node_11
    Node_11["11: NodeType.IF - pairData.price1Average._x != 0"]
    Node_11 --> Node_12
    Node_11 --> Node_13
    Node_12["12: NodeType.EXPRESSION - require(bool)(sumNative != 0)"]
    Node_12 --> Node_13
    Node_13["13: NodeType.ENDIF - "]
    Node_13 --> Node_14
    Node_14["14: NodeType.VARIABLE - "]
    Node_14 --> Node_15
    Node_15["15: NodeType.VARIABLE - "]
    Node_15 --> Node_16
    Node_16["16: NodeType.VARIABLE - "]
    Node_16 --> Node_17
    Node_17["17: NodeType.EXPRESSION - (roundID,price,None,None,answeredInRound) = AggregatorV3Interface(_aggregators(pairData.token1)).latestRoundData()"]
    Node_17 --> Node_18
    Node_18["18: NodeType.EXPRESSION - require(bool,string)(answeredInRound >= roundID,TwapOracle::consult: stale chainlink price)"]
    Node_18 --> Node_19
    Node_19["19: NodeType.EXPRESSION - require(bool,string)(price != 0,TwapOracle::consult: chainlink malfunction)"]
    Node_19 --> Node_20
    Node_20["20: NodeType.EXPRESSION - sumUSD += uint256(price) * (10 ** 10)"]
    Node_20 --> Node_21
    Node_21["21: NodeType.ENDIF - "]
    Node_21 --> Node_22
    Node_22["22: NodeType.EXPRESSION - i ++"]
    Node_22 --> Node_7
    Node_23["23: NodeType.EXPRESSION - require(bool,string)(sumNative != 0,TwapOracle::consult: Sum of native is zero)"]
    Node_23 --> Node_24
    Node_24["24: NodeType.EXPRESSION - result = ((sumUSD * IERC20Metadata(token).decimals()) / sumNative)"]
    Node_24 --> Node_25
    Node_25["25: NodeType.RETURN - result"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/twap/TwapOracle.sol` on lines **115** to **157**

```solidity
    function consult(address token) public view returns (uint256 result) {
        uint256 pairCount = _pairs.length;
        uint256 sumNative = 0;
        uint256 sumUSD = 0;

        for (uint256 i = 0; i < pairCount; i++) {
            PairData memory pairData = _pairs[i];

            if (token == pairData.token0) {
                //
                // TODO - Review:
                //   Verify price1Average is amount of USDV against 1 unit of token1
                //

                sumNative += pairData.price1Average.mul(1).decode144(); // native asset amount
                if (pairData.price1Average._x != 0) {
                    require(sumNative != 0);
                }

                (
                    uint80 roundID,
                    int256 price,
                    ,
                    ,
                    uint80 answeredInRound
                ) = AggregatorV3Interface(_aggregators[pairData.token1])
                        .latestRoundData();

                require(
                    answeredInRound >= roundID,
                    "TwapOracle::consult: stale chainlink price"
                );
                require(
                    price != 0,
                    "TwapOracle::consult: chainlink malfunction"
                );

                sumUSD += uint256(price) * (10**10);
            }
        }
        require(sumNative != 0, "TwapOracle::consult: Sum of native is zero");
        result = ((sumUSD * IERC20Metadata(token).decimals()) / sumNative);
    }

```
