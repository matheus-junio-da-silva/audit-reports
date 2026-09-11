# Context: PriceOracle.getChainlinkLatestPrice

**Contract:** `PriceOracle` (Inherits: IPriceOracle, OwnableUpgradeable, ContextUpgradeable, Initializable)
**Signature:** `getChainlinkLatestPrice(address,address) returns (uint256, uint256)`
**Method Selector ID:** `0xf37eace8`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** chainlinkFeedAddresses, decimals
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `AggregatorV3Interface.TUPLE_24(uint80,int256,uint256,uint256,uint80) = HIGH_LEVEL_CALL, dest:TMP_2381(AggregatorV3Interface), function:latestRoundData, arguments:[]  `
- `SafeMath.TMP_2391(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_2389', 'TMP_2390'] `
- `SafeMath.TMP_2389(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['TMP_2387', 'TMP_2388'] `
- `SafeMath.TMP_2395(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['TMP_2393', 'TMP_2394'] `
- `SafeMath.TMP_2397(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_2395', 'TMP_2396'] `
- `SafeMath.TMP_2393(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_2391', 'TMP_2392'] `
- `AggregatorV3Interface.TUPLE_23(uint80,int256,uint256,uint256,uint80) = HIGH_LEVEL_CALL, dest:TMP_2377(AggregatorV3Interface), function:latestRoundData, arguments:[]  `
- `SafeMath.TMP_2387(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['TMP_2385', 'TMP_2386'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - _feedData1 = chainlinkFeedAddresses(num)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - _feedData2 = chainlinkFeedAddresses(den)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.IF - _feedData1.oracle == address(0) || _feedData2.oracle == address(0)"]
    Node_3 --> Node_4
    Node_3 --> Node_5
    Node_4["4: NodeType.RETURN - (0,0)"]
    Node_5["5: NodeType.ENDIF - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - "]
    Node_7 --> Node_8
    Node_8["8: NodeType.VARIABLE - "]
    Node_8 --> Node_9
    Node_9["9: NodeType.VARIABLE - "]
    Node_9 --> Node_10
    Node_10["10: NodeType.VARIABLE - "]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - (roundID1,price1,None,timeStamp1,answeredInRound1) = AggregatorV3Interface(_feedData1.oracle).latestRoundData()"]
    Node_11 --> Node_12
    Node_12["12: NodeType.IF - timeStamp1 == 0 || answeredInRound1 < roundID1"]
    Node_12 --> Node_13
    Node_12 --> Node_14
    Node_13["13: NodeType.RETURN - (0,0)"]
    Node_14["14: NodeType.ENDIF - "]
    Node_14 --> Node_15
    Node_15["15: NodeType.VARIABLE - "]
    Node_15 --> Node_16
    Node_16["16: NodeType.VARIABLE - "]
    Node_16 --> Node_17
    Node_17["17: NodeType.VARIABLE - "]
    Node_17 --> Node_18
    Node_18["18: NodeType.EXPRESSION - (roundID2,price2,None,timeStamp2,answeredInRound2) = AggregatorV3Interface(_feedData2.oracle).latestRoundData()"]
    Node_18 --> Node_19
    Node_19["19: NodeType.IF - timeStamp2 == 0 || answeredInRound2 < roundID2"]
    Node_19 --> Node_20
    Node_19 --> Node_21
    Node_20["20: NodeType.RETURN - (0,0)"]
    Node_21["21: NodeType.ENDIF - "]
    Node_21 --> Node_22
    Node_22["22: NodeType.VARIABLE - price = uint256(price1).mul(10 ** _feedData2.decimals).mul(10 ** 30).div(uint256(price2)).div(10 ** _feedData1.decimals).mul(10 ** decimals(den)).div(10 ** decimals(num))"]
    Node_22 --> Node_23
    Node_23["23: NodeType.RETURN - (price,30)"]
```

### Source Mapping
Declared in: `contracts/PriceOracle.sol` on lines **48** to **94**

```solidity
    function getChainlinkLatestPrice(address num, address den) public view returns (uint256, uint256) {
        PriceData memory _feedData1 = chainlinkFeedAddresses[num];
        PriceData memory _feedData2 = chainlinkFeedAddresses[den];
        if (_feedData1.oracle == address(0) || _feedData2.oracle == address(0)) {
            return (0, 0);
        }
        int256 price1;
        int256 price2;
        {
            uint80 roundID1;
            uint256 timeStamp1;
            uint80 answeredInRound1;
            (
                roundID1,
                price1,
                ,
                timeStamp1,
                answeredInRound1
            ) = AggregatorV3Interface(_feedData1.oracle).latestRoundData();
            if(timeStamp1 == 0 || answeredInRound1 < roundID1) {
                return (0, 0);
            }
        }
        {
            uint80 roundID2;
            uint256 timeStamp2;
            uint80 answeredInRound2;
            (
                roundID2,
                price2,
                ,
                timeStamp2,
                answeredInRound2
            ) = AggregatorV3Interface(_feedData2.oracle).latestRoundData();
            if(timeStamp2 == 0 || answeredInRound2 < roundID2) {
                return (0, 0);
            }
        }
        uint256 price = uint256(price1)
            .mul(10**_feedData2.decimals)
            .mul(10**30)
            .div(uint256(price2))
            .div(10**_feedData1.decimals)
            .mul(10**decimals[den])
            .div(10**decimals[num]);
        return (price, 30);
    }

```
