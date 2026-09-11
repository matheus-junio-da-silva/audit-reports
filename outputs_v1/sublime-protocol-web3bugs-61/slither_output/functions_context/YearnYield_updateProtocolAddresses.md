# Context: YearnYield.updateProtocolAddresses

**Contract:** `YearnYield` (Inherits: ReentrancyGuard, OwnableUpgradeable, ContextUpgradeable, Initializable, IYield)
**Signature:** `updateProtocolAddresses(address,address)`
**Method Selector ID:** `0x050470f1`
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
- **Writes:** liquidityToken

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
    Node_0 --> Node_3
    Node_1["1: NodeType.EXPRESSION - liquidityToken(_asset) = _liquidityToken"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - ProtocolAddressesUpdated(_asset,_liquidityToken)"]
    Node_3["3: NodeType.EXPRESSION - onlyOwner()"]
    Node_3 --> Node_1
```

### Source Mapping
Declared in: `contracts/yield/YearnYield.sol` on lines **80** to **83**

```solidity
    function updateProtocolAddresses(address _asset, address _liquidityToken) external onlyOwner {
        liquidityToken[_asset] = _liquidityToken;
        emit ProtocolAddressesUpdated(_asset, _liquidityToken);
    }

```
