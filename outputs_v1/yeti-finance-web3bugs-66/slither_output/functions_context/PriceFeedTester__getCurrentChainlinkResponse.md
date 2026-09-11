# Context: PriceFeedTester._getCurrentChainlinkResponse

**Contract:** `PriceFeedTester` (Inherits: PriceFeed, IPriceFeed, BaseMath, CheckContract, Ownable)
**Signature:** `_getCurrentChainlinkResponse() returns (PriceFeed.ChainlinkResponse)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** priceAggregator
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `AggregatorV3Interface.TUPLE_4(uint80,int256,uint256,uint256,uint80) = HIGH_LEVEL_CALL, dest:priceAggregator(AggregatorV3Interface), function:latestRoundData, arguments:[]  `
- `AggregatorV3Interface.TMP_489(uint8) = HIGH_LEVEL_CALL, dest:priceAggregator(AggregatorV3Interface), function:decimals, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.TRY - decimals = priceAggregator.decimals()"]
    Node_1 --> Node_2
    Node_1 --> Node_4
    Node_1 --> Node_6
    Node_2["2: NodeType.CATCH - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - chainlinkResponse.decimals = decimals"]
    Node_3 --> Node_6
    Node_4["4: NodeType.CATCH - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.RETURN - chainlinkResponse"]
    Node_6["6: NodeType.TRY - (roundId,answer,timestamp) = priceAggregator.latestRoundData()"]
    Node_6 --> Node_7
    Node_6 --> Node_13
    Node_7["7: NodeType.CATCH - "]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - chainlinkResponse.roundId = roundId"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - chainlinkResponse.answer = answer"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - chainlinkResponse.timestamp = timestamp"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - chainlinkResponse.success = true"]
    Node_11 --> Node_12
    Node_12["12: NodeType.RETURN - chainlinkResponse"]
    Node_13["13: NodeType.CATCH - "]
    Node_13 --> Node_14
    Node_14["14: NodeType.RETURN - chainlinkResponse"]
    Node_15["15: NodeType.RETURN - chainlinkResponse"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/PriceFeed.sol` on lines **739** to **769**

```solidity
    function _getCurrentChainlinkResponse() internal view returns (ChainlinkResponse memory chainlinkResponse) {
        // First, try to get current decimal precision:
        try priceAggregator.decimals() returns (uint8 decimals) {
            // If call to Chainlink succeeds, record the current decimal precision
            chainlinkResponse.decimals = decimals;
        } catch {
            // If call to Chainlink aggregator reverts, return a zero response with success = false
            return chainlinkResponse;
        }

        // Secondly, try to get latest price data:
        try priceAggregator.latestRoundData() returns
        (
            uint80 roundId,
            int256 answer,
            uint256 /* startedAt */,
            uint256 timestamp,
            uint80 /* answeredInRound */
        )
        {
            // If call to Chainlink succeeds, return the response and success = true
            chainlinkResponse.roundId = roundId;
            chainlinkResponse.answer = answer;
            chainlinkResponse.timestamp = timestamp;
            chainlinkResponse.success = true;
            return chainlinkResponse;
        } catch {
            // If call to Chainlink aggregator reverts, return a zero response with success = false
            return chainlinkResponse;
        }
    }

```
