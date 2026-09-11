# Context: RCMarket._transferCard

**Contract:** `RCMarket` (Inherits: IRCMarket, NativeMetaTransaction, Initializable)
**Signature:** `_transferCard(address,address,uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** nfthub, totalNftMintCount
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_from != address(0) && _to != address(0),Cannot send to/from zero address)`
- require/assert: `assert(bool)(nfthub.transferNft(_from,_to,_tokenId))`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IRCNftHubL2.TMP_902(bool) = HIGH_LEVEL_CALL, dest:nfthub(IRCNftHubL2), function:transferNft, arguments:['_from', '_to', '_tokenId']  `
- `TMP_900(None) = SOLIDITY_CALL require(bool,string)(TMP_899,Cannot send to/from zero address)`

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(_from != address(0) && _to != address(0),Cannot send to/from zero address)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - _tokenId = _cardId + totalNftMintCount"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - assert(bool)(nfthub.transferNft(_from,_to,_tokenId))"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - LogNewOwner(_cardId,_to)"]
```

### Source Mapping
Declared in: `contracts/RCMarket.sol` on lines **356** to **369**

```solidity
    function _transferCard(
        address _from,
        address _to,
        uint256 _cardId
    ) internal {
        require(
            _from != address(0) && _to != address(0),
            "Cannot send to/from zero address"
        );
        uint256 _tokenId = _cardId + totalNftMintCount;

        assert(nfthub.transferNft(_from, _to, _tokenId));
        emit LogNewOwner(_cardId, _to);
    }

```
