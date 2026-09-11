# Context: Vader._onlyDAO

**Contract:** `Vader` (Inherits: Ownable, ERC20, IERC20Metadata, IERC20, Context, ProtocolConstants, IVader)
**Signature:** `_onlyDAO()`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `private`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** _ZERO_ADDRESS, converter
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(converter != IConverter(_ZERO_ADDRESS),Vader::_onlyDAO: DAO not set yet)`
- require/assert: `require(bool,string)(owner() == _msgSender(),Vader::_onlyDAO: Insufficient Privileges)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(converter != IConverter(_ZERO_ADDRESS),Vader::_onlyDAO: DAO not set yet)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(owner() == _msgSender(),Vader::_onlyDAO: Insufficient Privileges)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/tokens/Vader.sol` on lines **275** to **284**

```solidity
    function _onlyDAO() private view {
        require(
            converter != IConverter(_ZERO_ADDRESS),
            "Vader::_onlyDAO: DAO not set yet"
        );
        require(
            owner() == _msgSender(),
            "Vader::_onlyDAO: Insufficient Privileges"
        );
    }

```
