# Context: PriceOracle.getLatestPrice

**Contract:** `PriceOracle` (Inherits: IPriceOracle, OwnableUpgradeable, ContextUpgradeable, Initializable)
**Signature:** `getLatestPrice(address,address) returns (uint256, uint256)`
**Method Selector ID:** `0x10603c11`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- revert: `revert(string)(PriceOracle::getLatestPrice - Price Feed doesn't exist)`

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
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - (_price,_decimals) = getChainlinkLatestPrice(num,den)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.IF - _decimals != 0"]
    Node_4 --> Node_5
    Node_4 --> Node_6
    Node_5["5: NodeType.RETURN - (_price,_decimals)"]
    Node_6["6: NodeType.ENDIF - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - (_price,_decimals) = getUniswapLatestPrice(num,den)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.IF - _decimals != 0"]
    Node_8 --> Node_9
    Node_8 --> Node_10
    Node_9["9: NodeType.RETURN - (_price,_decimals)"]
    Node_10["10: NodeType.ENDIF - "]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - revert(string)(PriceOracle::getLatestPrice - Price Feed doesn't exist)"]
```

### Source Mapping
Declared in: `contracts/PriceOracle.sol` on lines **149** to **161**

```solidity
    function getLatestPrice(address num, address den) external view override returns (uint256, uint256) {
        uint256 _price;
        uint256 _decimals;
        (_price, _decimals) = getChainlinkLatestPrice(num, den);
        if (_decimals != 0) {
            return (_price, _decimals);
        }
        (_price, _decimals) = getUniswapLatestPrice(num, den);
        if (_decimals != 0) {
            return (_price, _decimals);
        }
        revert("PriceOracle::getLatestPrice - Price Feed doesn't exist");
    }

```
