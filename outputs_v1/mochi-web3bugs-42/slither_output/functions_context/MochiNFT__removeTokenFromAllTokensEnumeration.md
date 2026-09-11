# Context: MochiNFT._removeTokenFromAllTokensEnumeration

**Contract:** `MochiNFT` (Inherits: ERC721Enumerable, IMochiNFT, IERC721Enumerable, ERC721, IERC721Metadata, IERC721, ERC165, IERC165, Context)
**Signature:** `_removeTokenFromAllTokensEnumeration(uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `private`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** _allTokens, _allTokensIndex
- **Writes:** _allTokens, _allTokensIndex

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
    Node_1["1: NodeType.VARIABLE - lastTokenIndex = _allTokens.length - 1"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - tokenIndex = _allTokensIndex(tokenId)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - lastTokenId = _allTokens(lastTokenIndex)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - _allTokens(tokenIndex) = lastTokenId"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - _allTokensIndex(lastTokenId) = tokenIndex"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - delete _allTokensIndex(tokenId)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - _allTokens.pop()"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-core/node_modules/@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol` on lines **140** to **158**

```solidity
    function _removeTokenFromAllTokensEnumeration(uint256 tokenId) private {
        // To prevent a gap in the tokens array, we store the last token in the index of the token to delete, and
        // then delete the last slot (swap and pop).

        uint256 lastTokenIndex = _allTokens.length - 1;
        uint256 tokenIndex = _allTokensIndex[tokenId];

        // When the token to delete is the last token, the swap operation is unnecessary. However, since this occurs so
        // rarely (when the last minted token is burnt) that we still do the swap here to avoid the gas cost of adding
        // an 'if' statement (like in _removeTokenFromOwnerEnumeration)
        uint256 lastTokenId = _allTokens[lastTokenIndex];

        _allTokens[tokenIndex] = lastTokenId; // Move the last token to the slot of the to-delete token
        _allTokensIndex[lastTokenId] = tokenIndex; // Update the moved token's index

        // This also deletes the contents at the last position of the array
        delete _allTokensIndex[tokenId];
        _allTokens.pop();
    }

```
