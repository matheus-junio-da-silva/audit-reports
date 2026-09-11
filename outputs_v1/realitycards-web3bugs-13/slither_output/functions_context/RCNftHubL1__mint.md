# Context: RCNftHubL1._mint

**Contract:** `RCNftHubL1` (Inherits: IRCNftHubL1, NativeMetaTransaction, AccessControl, ERC721URIStorage, ERC721, IERC721Metadata, IERC721, ERC165, IERC165, IAccessControl, Ownable, Context)
**Signature:** `_mint(address,uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** _balances
- **Writes:** _balances, _owners

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(to != address(0),ERC721: mint to the zero address)`
- require/assert: `require(bool,string)(! _exists(tokenId),ERC721: token already minted)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(to != address(0),ERC721: mint to the zero address)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(! _exists(tokenId),ERC721: token already minted)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - _beforeTokenTransfer(address(0),to,tokenId)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - _balances(to) += 1"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - _owners(tokenId) = to"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - Transfer(address(0),to,tokenId)"]
```

### Source Mapping
Declared in: `node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol` on lines **256** to **266**

```solidity
    function _mint(address to, uint256 tokenId) internal virtual {
        require(to != address(0), "ERC721: mint to the zero address");
        require(!_exists(tokenId), "ERC721: token already minted");

        _beforeTokenTransfer(address(0), to, tokenId);

        _balances[to] += 1;
        _owners[tokenId] = to;

        emit Transfer(address(0), to, tokenId);
    }

```
