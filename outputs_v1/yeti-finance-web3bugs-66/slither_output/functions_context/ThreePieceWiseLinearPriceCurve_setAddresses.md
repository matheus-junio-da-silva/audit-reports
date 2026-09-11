# Context: ThreePieceWiseLinearPriceCurve.setAddresses

**Contract:** `ThreePieceWiseLinearPriceCurve` (Inherits: Ownable, IPriceCurve)
**Signature:** `setAddresses(address)`
**Method Selector ID:** `0x81d3c435`
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
- **Reads:** addressesSet
- **Writes:** addressesSet, whitelistAddress

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(! addressesSet,addresses already set)`

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
    Node_0 --> Node_4
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(! addressesSet,addresses already set)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - whitelistAddress = _whitelistAddress"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - addressesSet = true"]
    Node_4["4: NodeType.EXPRESSION - onlyOwner()"]
    Node_4 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/PriceCurves/ThreePieceWiseLinearPriceCurve.sol` on lines **79** to **83**

```solidity
    function setAddresses(address _whitelistAddress) external override onlyOwner {
        require(!addressesSet, "addresses already set");
        whitelistAddress = _whitelistAddress;
        addressesSet = true;
    }

```
