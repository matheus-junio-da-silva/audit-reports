# Context: RCOrderbook.setFactoryAddress

**Contract:** `RCOrderbook` (Inherits: IRCOrderbook, NativeMetaTransaction, Ownable, Context)
**Signature:** `setFactoryAddress(address)`
**Method Selector ID:** `0x83c17c55`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** uberOwner
- **Writes:** factoryAddress

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(msgSender() == uberOwner,Extremely Verboten)`
- require/assert: `require(bool)(_newFactory != address(0))`

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
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(msgSender() == uberOwner,Extremely Verboten)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool)(_newFactory != address(0))"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - factoryAddress = _newFactory"]
```

### Source Mapping
Declared in: `contracts/RCOrderbook.sol` on lines **123** to **127**

```solidity
    function setFactoryAddress(address _newFactory) external override {
        require(msgSender() == uberOwner, "Extremely Verboten");
        require(_newFactory != address(0));
        factoryAddress = _newFactory;
    }

```
