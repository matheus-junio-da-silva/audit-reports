# Context: RCMarket.ownerOf

**Contract:** `RCMarket` (Inherits: IRCMarket, NativeMetaTransaction, Initializable)
**Signature:** `ownerOf(uint256) returns (address)`
**Method Selector ID:** `0x6352211e`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** nfthub, totalNftMintCount
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IRCNftHubL2.TMP_892(address) = HIGH_LEVEL_CALL, dest:nfthub(IRCNftHubL2), function:ownerOf, arguments:['_tokenId']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - _tokenId = _cardId + totalNftMintCount"]
    Node_1 --> Node_2
    Node_2["2: NodeType.RETURN - nfthub.ownerOf(_tokenId)"]
```

### Source Mapping
Declared in: `contracts/RCMarket.sol` on lines **338** to **341**

```solidity
    function ownerOf(uint256 _cardId) public view override returns (address) {
        uint256 _tokenId = _cardId + totalNftMintCount;
        return nfthub.ownerOf(_tokenId);
    }

```
