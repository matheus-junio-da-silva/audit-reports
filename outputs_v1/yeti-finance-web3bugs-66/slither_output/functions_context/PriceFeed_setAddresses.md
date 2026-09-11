# Context: PriceFeed.setAddresses

**Contract:** `PriceFeed` (Inherits: IPriceFeed, BaseMath, CheckContract, Ownable)
**Signature:** `setAddresses(address,address)`
**Method Selector ID:** `0x90107afe`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyOwner`
  ```solidity
  modifier onlyOwner() {
          require(isOwner(), "CallerNotOwner");
          _;
      }
  ```

### State Variables Interaction
- **Reads:** None
- **Writes:** priceAggregator, status, tellorCaller

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(! _chainlinkIsBroken(chainlinkResponse,prevChainlinkResponse) && ! _chainlinkIsFrozen(chainlinkResponse),PriceFeed: Chainlink must be working and current)`

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
    Node_0 --> Node_11
    Node_1["1: NodeType.EXPRESSION - checkContract(_priceAggregatorAddress)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - checkContract(_tellorCallerAddress)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - priceAggregator = AggregatorV3Interface(_priceAggregatorAddress)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - tellorCaller = ITellorCaller(_tellorCallerAddress)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - status = Status.chainlinkWorking"]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - chainlinkResponse = _getCurrentChainlinkResponse()"]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - prevChainlinkResponse = _getPrevChainlinkResponse(chainlinkResponse.roundId,chainlinkResponse.decimals)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - require(bool,string)(! _chainlinkIsBroken(chainlinkResponse,prevChainlinkResponse) && ! _chainlinkIsFrozen(chainlinkResponse),PriceFeed: Chainlink must be working and current)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - _storeChainlinkPrice(chainlinkResponse)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - _renounceOwnership()"]
    Node_11["11: NodeType.EXPRESSION - onlyOwner()"]
    Node_11 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/PriceFeed.sol` on lines **87** to **113**

```solidity
    function setAddresses(
        address _priceAggregatorAddress,
        address _tellorCallerAddress
    )
    external
    onlyOwner
    {
        checkContract(_priceAggregatorAddress);
        checkContract(_tellorCallerAddress);

        priceAggregator = AggregatorV3Interface(_priceAggregatorAddress);
        tellorCaller = ITellorCaller(_tellorCallerAddress);

        // Explicitly set initial system status
        status = Status.chainlinkWorking;

        // Get an initial price from Chainlink to serve as first reference for lastGoodPrice
        ChainlinkResponse memory chainlinkResponse = _getCurrentChainlinkResponse();
        ChainlinkResponse memory prevChainlinkResponse = _getPrevChainlinkResponse(chainlinkResponse.roundId, chainlinkResponse.decimals);

        require(!_chainlinkIsBroken(chainlinkResponse, prevChainlinkResponse) && !_chainlinkIsFrozen(chainlinkResponse),
            "PriceFeed: Chainlink must be working and current");

        _storeChainlinkPrice(chainlinkResponse);

        _renounceOwnership();
    }

```
