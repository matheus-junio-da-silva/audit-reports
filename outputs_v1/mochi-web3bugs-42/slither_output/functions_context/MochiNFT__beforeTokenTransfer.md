# Context: MochiNFT._beforeTokenTransfer

**Contract:** `MochiNFT` (Inherits: ERC721Enumerable, IMochiNFT, IERC721Enumerable, ERC721, IERC721Metadata, IERC721, ERC165, IERC165, Context)
**Signature:** `_beforeTokenTransfer(address,address,uint256,uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- revert: `revert(string)(ERC721Enumerable: consecutive transfers not supported)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `TMP_12(None) = SOLIDITY_CALL revert(string)(ERC721Enumerable: consecutive transfers not supported)`

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - super._beforeTokenTransfer(from,to,firstTokenId,batchSize)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.IF - batchSize > 1"]
    Node_2 --> Node_3
    Node_2 --> Node_4
    Node_3["3: NodeType.EXPRESSION - revert(string)(ERC721Enumerable: consecutive transfers not supported)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.ENDIF - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - tokenId = firstTokenId"]
    Node_5 --> Node_6
    Node_6["6: NodeType.IF - from == address(0)"]
    Node_6 --> Node_7
    Node_6 --> Node_8
    Node_7["7: NodeType.EXPRESSION - _addTokenToAllTokensEnumeration(tokenId)"]
    Node_7 --> Node_11
    Node_8["8: NodeType.IF - from != to"]
    Node_8 --> Node_9
    Node_8 --> Node_10
    Node_9["9: NodeType.EXPRESSION - _removeTokenFromOwnerEnumeration(from,tokenId)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.ENDIF - "]
    Node_10 --> Node_11
    Node_11["11: NodeType.ENDIF - "]
    Node_11 --> Node_12
    Node_12["12: NodeType.IF - to == address(0)"]
    Node_12 --> Node_13
    Node_12 --> Node_14
    Node_13["13: NodeType.EXPRESSION - _removeTokenFromAllTokensEnumeration(tokenId)"]
    Node_13 --> Node_17
    Node_14["14: NodeType.IF - to != from"]
    Node_14 --> Node_15
    Node_14 --> Node_16
    Node_15["15: NodeType.EXPRESSION - _addTokenToOwnerEnumeration(to,tokenId)"]
    Node_15 --> Node_16
    Node_16["16: NodeType.ENDIF - "]
    Node_16 --> Node_17
    Node_17["17: NodeType.ENDIF - "]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-core/node_modules/@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol` on lines **60** to **85**

```solidity
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 firstTokenId,
        uint256 batchSize
    ) internal virtual override {
        super._beforeTokenTransfer(from, to, firstTokenId, batchSize);

        if (batchSize > 1) {
            // Will only trigger during construction. Batch transferring (minting) is not available afterwards.
            revert("ERC721Enumerable: consecutive transfers not supported");
        }

        uint256 tokenId = firstTokenId;

        if (from == address(0)) {
            _addTokenToAllTokensEnumeration(tokenId);
        } else if (from != to) {
            _removeTokenFromOwnerEnumeration(from, tokenId);
        }
        if (to == address(0)) {
            _removeTokenFromAllTokensEnumeration(tokenId);
        } else if (to != from) {
            _addTokenToOwnerEnumeration(to, tokenId);
        }
    }

```
