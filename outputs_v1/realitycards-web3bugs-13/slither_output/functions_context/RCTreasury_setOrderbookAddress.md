# Context: RCTreasury.setOrderbookAddress

**Contract:** `RCTreasury` (Inherits: IRCTreasury, NativeMetaTransaction, Ownable, Context)
**Signature:** `setOrderbookAddress(address)`
**Method Selector ID:** `0x94937a48`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** uberOwner
- **Writes:** orderbook

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(msgSender() == uberOwner,Extremely Verboten)`
- require/assert: `require(bool,string)(_newOrderbook != address(0),Must set an address)`

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
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(_newOrderbook != address(0),Must set an address)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - orderbook = IRCOrderbook(_newOrderbook)"]
```

### Source Mapping
Declared in: `contracts/RCTreasury.sol` on lines **239** to **243**

```solidity
    function setOrderbookAddress(address _newOrderbook) external {
        require(msgSender() == uberOwner, "Extremely Verboten");
        require(_newOrderbook != address(0), "Must set an address");
        orderbook = IRCOrderbook(_newOrderbook);
    }

```
