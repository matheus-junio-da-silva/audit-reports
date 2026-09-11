# Context: VaderPool.tokenURI

**Contract:** `VaderPool` (Inherits: BasePool, ReentrancyGuard, Ownable, ERC721, IERC721Metadata, IVaderPool, IERC721, ERC165, IERC165, Context, GasThrottle, ProtocolConstants, IBasePool)
**Signature:** `tokenURI(uint256) returns (string)`
**Method Selector ID:** `0xc87b56dd`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `Strings.TMP_925(string) = LIBRARY_CALL, dest:Strings, function:Strings.toString(uint256), arguments:['tokenId'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - _requireMinted(tokenId)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - baseURI = _baseURI()"]
    Node_2 --> Node_4
    Node_4["4: NodeType.IF - bytes(baseURI).length > 0"]
    Node_4 --> Node_5
    Node_4 --> Node_6
    Node_5["5: NodeType.RETURN - string(abi.encodePacked(baseURI,tokenId.toString()))"]
    Node_6["6: NodeType.RETURN - "]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol` on lines **93** to **98**

```solidity
    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        _requireMinted(tokenId);

        string memory baseURI = _baseURI();
        return bytes(baseURI).length > 0 ? string(abi.encodePacked(baseURI, tokenId.toString())) : "";
    }

```
