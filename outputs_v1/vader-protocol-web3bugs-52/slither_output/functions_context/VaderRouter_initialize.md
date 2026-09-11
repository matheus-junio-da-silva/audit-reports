# Context: VaderRouter.initialize

**Contract:** `VaderRouter` (Inherits: Ownable, Context, ProtocolConstants, IVaderRouter)
**Signature:** `initialize(IVaderReserve)`
**Method Selector ID:** `0xc4d66de8`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyOwner`
  ```solidity
  modifier onlyOwner() {
          _checkOwner();
          _;
      }
  ```

### State Variables Interaction
- **Reads:** _ZERO_ADDRESS
- **Writes:** reserve

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_reserve != IVaderReserve(_ZERO_ADDRESS),VaderRouter::initialize: Incorrect Reserve Specified)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(_reserve != IVaderReserve(_ZERO_ADDRESS),VaderRouter::initialize: Incorrect Reserve Specified)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - reserve = _reserve"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - renounceOwnership()"]
    Node_4["4: NodeType.EXPRESSION - onlyOwner()"]
    Node_4 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/dex/router/VaderRouter.sol` on lines **270** to **279**

```solidity
    function initialize(IVaderReserve _reserve) external onlyOwner {
        require(
            _reserve != IVaderReserve(_ZERO_ADDRESS),
            "VaderRouter::initialize: Incorrect Reserve Specified"
        );

        reserve = _reserve;

        renounceOwnership();
    }

```
