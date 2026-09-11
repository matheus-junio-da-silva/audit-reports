# Context: Converter.constructor

**Contract:** `Converter` (Inherits: ProtocolConstants, IConverter)
**Signature:** `constructor(IERC20,IERC20,ILinearVesting,bytes32)`
**Method Selector ID:** `0x45aea35c`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** _ZERO_ADDRESS
- **Writes:** root, vader, vesting, vether

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_vether != IERC20(_ZERO_ADDRESS) && _vader != IERC20(_ZERO_ADDRESS) && _vesting != ILinearVesting(_ZERO_ADDRESS),Converter::constructor: Misconfiguration)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IERC20.TMP_159(bool) = HIGH_LEVEL_CALL, dest:_vader(IERC20), function:approve, arguments:['TMP_156', 'TMP_158']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(_vether != IERC20(_ZERO_ADDRESS) && _vader != IERC20(_ZERO_ADDRESS) && _vesting != ILinearVesting(_ZERO_ADDRESS),Converter::constructor: Misconfiguration)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - vether = _vether"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - vader = _vader"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - _vader.approve(address(_vesting),type()(uint256).max)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - vesting = _vesting"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - root = _root"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/tokens/converter/Converter.sol` on lines **62** to **82**

```solidity
    constructor(
        IERC20 _vether,
        IERC20 _vader,
        ILinearVesting _vesting,
        bytes32 _root
    ) {
        require(
            _vether != IERC20(_ZERO_ADDRESS) &&
                _vader != IERC20(_ZERO_ADDRESS) &&
                _vesting != ILinearVesting(_ZERO_ADDRESS),
            "Converter::constructor: Misconfiguration"
        );

        vether = _vether;
        vader = _vader;

        _vader.approve(address(_vesting), type(uint256).max);

        vesting = _vesting;
        root = _root;
    }

```
