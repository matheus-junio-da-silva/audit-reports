# Context: RCNftHubL2.withdrawWithMetadata

**Contract:** `RCNftHubL2` (Inherits: IRCNftHubL2, NativeMetaTransaction, AccessControl, ERC721URIStorage, ERC721, IERC721Metadata, IERC721, ERC165, IERC165, IAccessControl, Ownable, Context)
**Signature:** `withdrawWithMetadata(uint256)`
**Method Selector ID:** `0xa5e584dc`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** isMarket
- **Writes:** withdrawnTokens

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(isMarket[msgSender()],Not market)`
- require/assert: `require(bool,string)(msgSender() == ownerOf(tokenId),ChildMintableERC721: INVALID_TOKEN_OWNER)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `RCNftHubL2.TMP_2270(bytes) = HIGH_LEVEL_CALL, dest:this(address), function:encodeTokenMetadata, arguments:['tokenId']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(isMarket(msgSender()),Not market)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(msgSender() == ownerOf(tokenId),ChildMintableERC721: INVALID_TOKEN_OWNER)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - withdrawnTokens(tokenId) = true"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - TransferWithMetadata(ownerOf(tokenId),address(0),tokenId,this.encodeTokenMetadata(tokenId))"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - _burn(tokenId)"]
```

### Source Mapping
Declared in: `contracts/nfthubs/RCNftHubL2.sol` on lines **167** to **184**

```solidity
    function withdrawWithMetadata(uint256 tokenId) external override {
        require(isMarket[msgSender()], "Not market");
        require(
            msgSender() == ownerOf(tokenId),
            "ChildMintableERC721: INVALID_TOKEN_OWNER"
        );
        withdrawnTokens[tokenId] = true;

        // Encoding metadata associated with tokenId & emitting event
        emit TransferWithMetadata(
            ownerOf(tokenId),
            address(0),
            tokenId,
            this.encodeTokenMetadata(tokenId)
        );

        _burn(tokenId);
    }

```
