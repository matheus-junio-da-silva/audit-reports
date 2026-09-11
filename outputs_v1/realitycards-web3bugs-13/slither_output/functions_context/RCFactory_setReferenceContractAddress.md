# Context: RCFactory.setReferenceContractAddress

**Contract:** `RCFactory` (Inherits: IRCFactory, NativeMetaTransaction, Ownable, Context)
**Signature:** `setReferenceContractAddress(address)`
**Method Selector ID:** `0xa72f5286`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** referenceContractVersion, uberOwner
- **Writes:** referenceContractAddress, referenceContractVersion

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(msgSender() == uberOwner,Extremely Verboten)`
- require/assert: `require(bool)(_newAddress != address(0))`
- require/assert: `assert(bool)(newContractVariable.isMarket())`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IRCMarket.TMP_757(bool) = HIGH_LEVEL_CALL, dest:newContractVariable(IRCMarket), function:isMarket, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(msgSender() == uberOwner,Extremely Verboten)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool)(_newAddress != address(0))"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - newContractVariable = IRCMarket(_newAddress)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - assert(bool)(newContractVariable.isMarket())"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - referenceContractAddress = _newAddress"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - referenceContractVersion += 1"]
```

### Source Mapping
Declared in: `contracts/RCFactory.sol` on lines **432** to **442**

```solidity
    function setReferenceContractAddress(address _newAddress) external {
        require(msgSender() == uberOwner, "Extremely Verboten");
        require(_newAddress != address(0));
        // check it's an RC contract
        IRCMarket newContractVariable = IRCMarket(_newAddress);
        assert(newContractVariable.isMarket());
        // set
        referenceContractAddress = _newAddress;
        // increment version
        referenceContractVersion += 1;
    }

```
