# Context: VaderPoolV2.initialize

**Contract:** `VaderPoolV2` (Inherits: Ownable, BasePoolV2, ReentrancyGuard, ERC721, IERC721Metadata, IVaderPoolV2, IERC721, ERC165, IERC165, Context, GasThrottle, ProtocolConstants, IBasePoolV2)
**Signature:** `initialize(ILPWrapper,ISynthFactory,address)`
**Method Selector ID:** `0xc0c53b8b`
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
- **Reads:** _ZERO_ADDRESS, wrapper
- **Writes:** router, synthFactory, wrapper

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(wrapper == ILPWrapper(_ZERO_ADDRESS),VaderPoolV2::initialize: Already initialized)`
- require/assert: `require(bool,string)(_wrapper != ILPWrapper(_ZERO_ADDRESS),VaderPoolV2::initialize: Incorrect Wrapper Specified)`
- require/assert: `require(bool,string)(_synthFactory != ISynthFactory(_ZERO_ADDRESS),VaderPoolV2::initialize: Incorrect SynthFactory Specified)`
- require/assert: `require(bool,string)(_router != _ZERO_ADDRESS,VaderPoolV2::initialize: Incorrect Router Specified)`

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
    Node_0 --> Node_8
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(wrapper == ILPWrapper(_ZERO_ADDRESS),VaderPoolV2::initialize: Already initialized)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(_wrapper != ILPWrapper(_ZERO_ADDRESS),VaderPoolV2::initialize: Incorrect Wrapper Specified)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - require(bool,string)(_synthFactory != ISynthFactory(_ZERO_ADDRESS),VaderPoolV2::initialize: Incorrect SynthFactory Specified)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - require(bool,string)(_router != _ZERO_ADDRESS,VaderPoolV2::initialize: Incorrect Router Specified)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - wrapper = _wrapper"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - synthFactory = _synthFactory"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - router = _router"]
    Node_8["8: NodeType.EXPRESSION - onlyOwner()"]
    Node_8 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/dex-v2/pool/VaderPoolV2.sol` on lines **89** to **113**

```solidity
    function initialize(
        ILPWrapper _wrapper,
        ISynthFactory _synthFactory,
        address _router
    ) external onlyOwner {
        require(
            wrapper == ILPWrapper(_ZERO_ADDRESS),
            "VaderPoolV2::initialize: Already initialized"
        );
        require(
            _wrapper != ILPWrapper(_ZERO_ADDRESS),
            "VaderPoolV2::initialize: Incorrect Wrapper Specified"
        );
        require(
            _synthFactory != ISynthFactory(_ZERO_ADDRESS),
            "VaderPoolV2::initialize: Incorrect SynthFactory Specified"
        );
        require(
            _router != _ZERO_ADDRESS,
            "VaderPoolV2::initialize: Incorrect Router Specified"
        );
        wrapper = _wrapper;
        synthFactory = _synthFactory;
        router = _router;
    }

```
