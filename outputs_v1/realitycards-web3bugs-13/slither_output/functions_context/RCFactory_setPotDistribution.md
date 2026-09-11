# Context: RCFactory.setPotDistribution

**Contract:** `RCFactory` (Inherits: IRCFactory, NativeMetaTransaction, Ownable, Context)
**Signature:** `setPotDistribution(uint256,uint256,uint256,uint256,uint256)`
**Method Selector ID:** `0x1b549e3e`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyOwner`
  ```solidity
  modifier onlyOwner() {
          require(owner() == _msgSender(), "Ownable: caller is not the owner");
          _;
      }
  ```

### State Variables Interaction
- **Reads:** None
- **Writes:** potDistribution

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_artistCut + _winnerCut + _creatorCut + _affiliateCut + _cardAffiliateCut <= 1000,Cuts too big)`

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
    Node_0 --> Node_7
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(_artistCut + _winnerCut + _creatorCut + _affiliateCut + _cardAffiliateCut <= 1000,Cuts too big)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - potDistribution(0) = _artistCut"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - potDistribution(1) = _winnerCut"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - potDistribution(2) = _creatorCut"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - potDistribution(3) = _affiliateCut"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - potDistribution(4) = _cardAffiliateCut"]
    Node_7["7: NodeType.EXPRESSION - onlyOwner()"]
    Node_7 --> Node_1
```

### Source Mapping
Declared in: `contracts/RCFactory.sol` on lines **234** to **255**

```solidity
    function setPotDistribution(
        uint256 _artistCut,
        uint256 _winnerCut,
        uint256 _creatorCut,
        uint256 _affiliateCut,
        uint256 _cardAffiliateCut
    ) public onlyOwner {
        require(
            _artistCut +
                _winnerCut +
                _creatorCut +
                _affiliateCut +
                _cardAffiliateCut <=
                1000,
            "Cuts too big"
        );
        potDistribution[0] = _artistCut;
        potDistribution[1] = _winnerCut;
        potDistribution[2] = _creatorCut;
        potDistribution[3] = _affiliateCut;
        potDistribution[4] = _cardAffiliateCut;
    }

```
