# Context: RCNftHubL2.addMarket

**Contract:** `RCNftHubL2` (Inherits: IRCNftHubL2, NativeMetaTransaction, AccessControl, ERC721URIStorage, ERC721, IERC721Metadata, IERC721, ERC165, IERC165, IAccessControl, Ownable, Context)
**Signature:** `addMarket(address)`
**Method Selector ID:** `0x93e30633`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** factoryAddress
- **Writes:** isMarket

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(msgSender() == factoryAddress,Not factory)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(msgSender() == factoryAddress,Not factory)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - isMarket(_newMarket) = true"]
```

### Source Mapping
Declared in: `contracts/nfthubs/RCNftHubL2.sol` on lines **64** to **67**

```solidity
    function addMarket(address _newMarket) external override {
        require(msgSender() == factoryAddress, "Not factory");
        isMarket[_newMarket] = true;
    }

```
