# Context: RCTreasury.setTokenAddress

**Contract:** `RCTreasury` (Inherits: IRCTreasury, NativeMetaTransaction, Ownable, Context)
**Signature:** `setTokenAddress(address)`
**Method Selector ID:** `0x26a4e8d2`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** uberOwner
- **Writes:** erc20

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(msgSender() == uberOwner,Extremely Verboten)`
- require/assert: `require(bool,string)(_newToken != address(0),Must set an address)`

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
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(_newToken != address(0),Must set an address)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - erc20 = IERC20(_newToken)"]
```

### Source Mapping
Declared in: `contracts/RCTreasury.sol` on lines **251** to **255**

```solidity
    function setTokenAddress(address _newToken) public override {
        require(msgSender() == uberOwner, "Extremely Verboten");
        require(_newToken != address(0), "Must set an address");
        erc20 = IERC20(_newToken);
    }

```
