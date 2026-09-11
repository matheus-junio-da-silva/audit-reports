# Context: PriceOracle.setUniswapFeedAddress

**Contract:** `PriceOracle` (Inherits: IPriceOracle, OwnableUpgradeable, ContextUpgradeable, Initializable)
**Signature:** `setUniswapFeedAddress(address,address,address)`
**Method Selector ID:** `0x0626a92b`
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
- **Writes:** uniswapPools

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(token1 != token2,token1 and token2 should be different addresses)`

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
    Node_0 --> Node_5
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(token1 != token2,token1 and token2 should be different addresses)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - _poolTokensId = getUniswapPoolTokenId(token1,token2)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - uniswapPools(_poolTokensId) = pool"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - UniswapFeedUpdated(token1,token2,_poolTokensId,pool)"]
    Node_5["5: NodeType.EXPRESSION - onlyOwner()"]
    Node_5 --> Node_1
```

### Source Mapping
Declared in: `contracts/PriceOracle.sol` on lines **203** to **212**

```solidity
    function setUniswapFeedAddress(
        address token1,
        address token2,
        address pool
    ) external onlyOwner {
        require(token1 != token2, 'token1 and token2 should be different addresses');
        bytes32 _poolTokensId = getUniswapPoolTokenId(token1, token2);
        uniswapPools[_poolTokensId] = pool;
        emit UniswapFeedUpdated(token1, token2, _poolTokensId, pool);
    }

```
