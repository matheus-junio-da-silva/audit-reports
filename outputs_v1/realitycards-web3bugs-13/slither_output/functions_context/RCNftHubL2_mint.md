# Context: RCNftHubL2.mint

**Contract:** `RCNftHubL2` (Inherits: IRCNftHubL2, NativeMetaTransaction, AccessControl, ERC721URIStorage, ERC721, IERC721Metadata, IERC721, ERC165, IERC165, IAccessControl, Ownable, Context)
**Signature:** `mint(address,uint256,string) returns (bool)`
**Method Selector ID:** `0xd3fc9864`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** factoryAddress, withdrawnTokens
- **Writes:** marketTracker

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(! withdrawnTokens[_tokenId],ChildMintableERC721: TOKEN_EXISTS_ON_ROOT_CHAIN)`
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
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(! withdrawnTokens(_tokenId),ChildMintableERC721: TOKEN_EXISTS_ON_ROOT_CHAIN)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(msgSender() == factoryAddress,Not factory)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - _mint(_originalOwner,_tokenId)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - _setTokenURI(_tokenId,_tokenURI)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - marketTracker(_tokenId) = _originalOwner"]
    Node_5 --> Node_6
    Node_6["6: NodeType.RETURN - true"]
```

### Source Mapping
Declared in: `contracts/nfthubs/RCNftHubL2.sol` on lines **84** to **98**

```solidity
    function mint(
        address _originalOwner,
        uint256 _tokenId,
        string calldata _tokenURI
    ) external override returns (bool) {
        require(
            !withdrawnTokens[_tokenId],
            "ChildMintableERC721: TOKEN_EXISTS_ON_ROOT_CHAIN"
        );
        require(msgSender() == factoryAddress, "Not factory");
        _mint(_originalOwner, _tokenId);
        _setTokenURI(_tokenId, _tokenURI);
        marketTracker[_tokenId] = _originalOwner;
        return true;
    }

```
