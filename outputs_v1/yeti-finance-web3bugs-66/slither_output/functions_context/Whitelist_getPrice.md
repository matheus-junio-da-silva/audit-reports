# Context: Whitelist.getPrice

**Contract:** `Whitelist` (Inherits: CheckContract, IBaseOracle, IWhitelist, Ownable)
**Signature:** `getPrice(address) returns (uint256)`
**Method Selector ID:** `0x41976e09`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:**
- `exists`
  ```solidity
  modifier exists(address _collateral) {
          _exists(_collateral);
          _;
      }
  ```

### State Variables Interaction
- **Reads:** collateralParams
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IPriceFeed.TMP_364(uint256) = HIGH_LEVEL_CALL, dest:collateral_priceFeed(IPriceFeed), function:fetchPrice_v, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_3
    Node_1["1: NodeType.VARIABLE - collateral_priceFeed = IPriceFeed(collateralParams(_collateral).oracle)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.RETURN - collateral_priceFeed.fetchPrice_v()"]
    Node_3["3: NodeType.EXPRESSION - exists(_collateral)"]
    Node_3 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/Dependencies/Whitelist.sol` on lines **349** to **358**

```solidity
    function getPrice(address _collateral)
        public
        view
        override
        exists(_collateral)
        returns (uint256)
    {
        IPriceFeed collateral_priceFeed = IPriceFeed(collateralParams[_collateral].oracle);
        return collateral_priceFeed.fetchPrice_v();
    }

```
