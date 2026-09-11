# Context: PriceOracle.setChainlinkFeedAddress

**Contract:** `PriceOracle` (Inherits: IPriceOracle, OwnableUpgradeable, ContextUpgradeable, Initializable)
**Signature:** `setChainlinkFeedAddress(address,address)`
**Method Selector ID:** `0xfa6fc430`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyOwner`
  ```solidity
  modifier onlyOwner() {
          require(owner() == _msgSender(), "Ownable: caller is not the owner");
          _;
      }
  ```

### State Variables Interaction
- **Reads:** None
- **Writes:** chainlinkFeedAddresses, decimals

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `AggregatorV3Interface.TMP_2427(uint8) = HIGH_LEVEL_CALL, dest:TMP_2426(AggregatorV3Interface), function:decimals, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_5
    Node_1["1: NodeType.VARIABLE - priceOracleDecimals = AggregatorV3Interface(priceOracle).decimals()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - chainlinkFeedAddresses(token) = PriceData(priceOracle,priceOracleDecimals)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - decimals(token) = getDecimals(token)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - ChainlinkFeedUpdated(token,priceOracle)"]
    Node_5["5: NodeType.EXPRESSION - onlyOwner()"]
    Node_5 --> Node_1
```

### Source Mapping
Declared in: `contracts/PriceOracle.sol` on lines **189** to **194**

```solidity
    function setChainlinkFeedAddress(address token, address priceOracle) external onlyOwner {
        uint256 priceOracleDecimals = AggregatorV3Interface(priceOracle).decimals();
        chainlinkFeedAddresses[token] = PriceData(priceOracle, priceOracleDecimals);
        decimals[token] = getDecimals(token);
        emit ChainlinkFeedUpdated(token, priceOracle);
    }

```
