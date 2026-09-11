# Context: RCNftHubL1._transfer

**Contract:** `RCNftHubL1` (Inherits: IRCNftHubL1, NativeMetaTransaction, AccessControl, ERC721URIStorage, ERC721, IERC721Metadata, IERC721, ERC165, IERC165, IAccessControl, Ownable, Context)
**Signature:** `_transfer(address,address,uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** _balances
- **Writes:** _balances, _owners

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(ERC721.ownerOf(tokenId) == from,ERC721: transfer of token that is not own)`
- require/assert: `require(bool,string)(to != address(0),ERC721: transfer to the zero address)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `TMP_1998(None) = SOLIDITY_CALL require(bool,string)(TMP_1997,ERC721: transfer to the zero address)`
- `TMP_1995(None) = SOLIDITY_CALL require(bool,string)(TMP_1994,ERC721: transfer of token that is not own)`

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(ERC721.ownerOf(tokenId) == from,ERC721: transfer of token that is not own)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(to != address(0),ERC721: transfer to the zero address)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - _beforeTokenTransfer(from,to,tokenId)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - _approve(address(0),tokenId)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - _balances(from) -= 1"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - _balances(to) += 1"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - _owners(tokenId) = to"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - Transfer(from,to,tokenId)"]
```

### Source Mapping
Declared in: `node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol` on lines **303** to **317**

```solidity
    function _transfer(address from, address to, uint256 tokenId) internal virtual {
        require(ERC721.ownerOf(tokenId) == from, "ERC721: transfer of token that is not own");
        require(to != address(0), "ERC721: transfer to the zero address");

        _beforeTokenTransfer(from, to, tokenId);

        // Clear approvals from the previous owner
        _approve(address(0), tokenId);

        _balances[from] -= 1;
        _balances[to] += 1;
        _owners[tokenId] = to;

        emit Transfer(from, to, tokenId);
    }

```
