# Context: Vader.setComponents

**Contract:** `Vader` (Inherits: Ownable, ERC20, IERC20Metadata, IERC20, Context, ProtocolConstants, IVader)
**Signature:** `setComponents(IConverter,ILinearVesting,IUSDV,address)`
**Method Selector ID:** `0x45afdc8d`
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
- **Reads:** _TEAM_ALLOCATION, _VETH_ALLOCATION, _ZERO_ADDRESS, converter
- **Writes:** converter, untaxed, usdv, vest

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_converter != IConverter(_ZERO_ADDRESS) && _vest != ILinearVesting(_ZERO_ADDRESS) && _usdv != IUSDV(_ZERO_ADDRESS) && dao != _ZERO_ADDRESS,Vader::setComponents: Incorrect Arguments)`
- require/assert: `require(bool,string)(converter == IConverter(_ZERO_ADDRESS),Vader::setComponents: Already Set)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `ILinearVesting.HIGH_LEVEL_CALL, dest:_vest(ILinearVesting), function:begin, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_14
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(_converter != IConverter(_ZERO_ADDRESS) && _vest != ILinearVesting(_ZERO_ADDRESS) && _usdv != IUSDV(_ZERO_ADDRESS) && dao != _ZERO_ADDRESS,Vader::setComponents: Incorrect Arguments)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(converter == IConverter(_ZERO_ADDRESS),Vader::setComponents: Already Set)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - converter = _converter"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - vest = _vest"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - usdv = _usdv"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - untaxed(address(_converter)) = true"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - untaxed(address(_vest)) = true"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - untaxed(address(_usdv)) = true"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - _mint(address(_converter),_VETH_ALLOCATION)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - _mint(address(_vest),_TEAM_ALLOCATION)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - _vest.begin()"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - transferOwnership(dao)"]
    Node_12 --> Node_13
    Node_13["13: NodeType.EXPRESSION - ProtocolInitialized(address(_converter),address(_vest),address(_usdv),dao)"]
    Node_14["14: NodeType.EXPRESSION - onlyOwner()"]
    Node_14 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/tokens/Vader.sol` on lines **148** to **186**

```solidity
    function setComponents(
        IConverter _converter,
        ILinearVesting _vest,
        IUSDV _usdv,
        address dao
    ) external onlyOwner {
        require(
            _converter != IConverter(_ZERO_ADDRESS) &&
                _vest != ILinearVesting(_ZERO_ADDRESS) &&
                _usdv != IUSDV(_ZERO_ADDRESS) &&
                dao != _ZERO_ADDRESS,
            "Vader::setComponents: Incorrect Arguments"
        );
        require(
            converter == IConverter(_ZERO_ADDRESS),
            "Vader::setComponents: Already Set"
        );

        converter = _converter;
        vest = _vest;
        usdv = _usdv;

        untaxed[address(_converter)] = true;
        untaxed[address(_vest)] = true;
        untaxed[address(_usdv)] = true;

        _mint(address(_converter), _VETH_ALLOCATION);
        _mint(address(_vest), _TEAM_ALLOCATION);

        _vest.begin();
        transferOwnership(dao);

        emit ProtocolInitialized(
            address(_converter),
            address(_vest),
            address(_usdv),
            dao
        );
    }

```
