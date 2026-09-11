# Context: PriceOracle.doesFeedExist

**Contract:** `PriceOracle` (Inherits: IPriceOracle, OwnableUpgradeable, ContextUpgradeable, Initializable)
**Signature:** `doesFeedExist(address,address) returns (bool)`
**Method Selector ID:** `0x633defbd`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** chainlinkFeedAddresses, uniswapPools
- **Writes:** None

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
    Node_1["1: NodeType.IF - chainlinkFeedAddresses(token1).oracle != address(0) && chainlinkFeedAddresses(token2).oracle != address(0)"]
    Node_1 --> Node_2
    Node_1 --> Node_3
    Node_2["2: NodeType.RETURN - true"]
    Node_3["3: NodeType.ENDIF - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - _poolTokensId = getUniswapPoolTokenId(token1,token2)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.IF - uniswapPools(_poolTokensId) != address(0)"]
    Node_5 --> Node_6
    Node_5 --> Node_7
    Node_6["6: NodeType.RETURN - true"]
    Node_7["7: NodeType.ENDIF - "]
    Node_7 --> Node_8
    Node_8["8: NodeType.RETURN - false"]
```

### Source Mapping
Declared in: `contracts/PriceOracle.sol` on lines **169** to **181**

```solidity
    function doesFeedExist(address token1, address token2) external view override returns (bool) {
        if (chainlinkFeedAddresses[token1].oracle != address(0) && chainlinkFeedAddresses[token2].oracle != address(0)) {
            return true;
        }

        bytes32 _poolTokensId = getUniswapPoolTokenId(token1, token2);

        if (uniswapPools[_poolTokensId] != address(0)) {
            return true;
        }

        return false;
    }

```
