# Context: RCMarket.upgradeCard

**Contract:** `RCMarket` (Inherits: IRCMarket, NativeMetaTransaction, Initializable)
**Signature:** `upgradeCard(uint256)`
**Method Selector ID:** `0xa16db5b5`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyTokenOwner`
  ```solidity
  modifier onlyTokenOwner(uint256 _token) {
          require(msgSender() == ownerOf(_token), "Not owner");
          _;
      }
  ```

### State Variables Interaction
- **Reads:** factory, nfthub, totalNftMintCount
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(! factory.trapIfUnapproved() || factory.isMarketApproved(address(this)),Upgrade blocked)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IRCNftHubL2.HIGH_LEVEL_CALL, dest:nfthub(IRCNftHubL2), function:withdrawWithMetadata, arguments:['_tokenId']  `
- `IRCFactory.TMP_878(bool) = HIGH_LEVEL_CALL, dest:factory(IRCFactory), function:trapIfUnapproved, arguments:[]  `
- `IRCFactory.TMP_881(bool) = HIGH_LEVEL_CALL, dest:factory(IRCFactory), function:isMarketApproved, arguments:['TMP_880']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_7
    Node_1["1: NodeType.EXPRESSION - _checkState(States.WITHDRAW)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(! factory.trapIfUnapproved() || factory.isMarketApproved(address(this)),Upgrade blocked)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - _tokenId = _card + totalNftMintCount"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - _transferCard(ownerOf(_card),address(this),_card)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - nfthub.withdrawWithMetadata(_tokenId)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - LogNftUpgraded(_card,_tokenId)"]
    Node_7["7: NodeType.EXPRESSION - onlyTokenOwner(_card)"]
    Node_7 --> Node_1
```

### Source Mapping
Declared in: `contracts/RCMarket.sol` on lines **324** to **335**

```solidity
    function upgradeCard(uint256 _card) external onlyTokenOwner(_card) {
        _checkState(States.WITHDRAW);
        require(
            !factory.trapIfUnapproved() ||
                factory.isMarketApproved(address(this)),
            "Upgrade blocked"
        );
        uint256 _tokenId = _card + totalNftMintCount;
        _transferCard(ownerOf(_card), address(this), _card); // contract becomes final resting place
        nfthub.withdrawWithMetadata(_tokenId);
        emit LogNftUpgraded(_card, _tokenId);
    }

```
