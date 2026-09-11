# Context: MochiNFT.tokenByIndex

**Contract:** `MochiNFT` (Inherits: ERC721Enumerable, IMochiNFT, IERC721Enumerable, ERC721, IERC721Metadata, IERC721, ERC165, IERC165, Context)
**Signature:** `tokenByIndex(uint256) returns (uint256)`
**Method Selector ID:** `0x4f6ccce7`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** _allTokens
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(index < ERC721Enumerable.totalSupply(),ERC721Enumerable: global index out of bounds)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(index < ERC721Enumerable.totalSupply(),ERC721Enumerable: global index out of bounds)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.RETURN - _allTokens(index)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-core/node_modules/@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol` on lines **52** to **55**

```solidity
    function tokenByIndex(uint256 index) public view virtual override returns (uint256) {
        require(index < ERC721Enumerable.totalSupply(), "ERC721Enumerable: global index out of bounds");
        return _allTokens[index];
    }

```
