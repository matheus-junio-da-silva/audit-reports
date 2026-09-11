# Context: BasePool._burn

**Contract:** `BasePool` (Inherits: ReentrancyGuard, Ownable, ERC721, IERC721Metadata, IERC721, ERC165, IERC165, Context, GasThrottle, ProtocolConstants, IBasePool)
**Signature:** `_burn(uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** _balances, _owners, _tokenApprovals
- **Writes:** _balances, _owners, _tokenApprovals

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
    Node_1["1: NodeType.VARIABLE - owner = ERC721.ownerOf(tokenId)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - _beforeTokenTransfer(owner,address(0),tokenId,1)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - owner = ERC721.ownerOf(tokenId)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - delete _tokenApprovals(tokenId)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - _balances(owner) -= 1"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - delete _owners(tokenId)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - Transfer(owner,address(0),tokenId)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - _afterTokenTransfer(owner,address(0),tokenId,1)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol` on lines **299** to **320**

```solidity
    function _burn(uint256 tokenId) internal virtual {
        address owner = ERC721.ownerOf(tokenId);

        _beforeTokenTransfer(owner, address(0), tokenId, 1);

        // Update ownership in case tokenId was transferred by `_beforeTokenTransfer` hook
        owner = ERC721.ownerOf(tokenId);

        // Clear approvals
        delete _tokenApprovals[tokenId];

        unchecked {
            // Cannot overflow, as that would require more tokens to be burned/transferred
            // out than the owner initially received through minting and transferring in.
            _balances[owner] -= 1;
        }
        delete _owners[tokenId];

        emit Transfer(owner, address(0), tokenId);

        _afterTokenTransfer(owner, address(0), tokenId, 1);
    }

```
