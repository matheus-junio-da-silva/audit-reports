# Context: Controller.setBigFishThreshold

**Contract:** `Controller` (Inherits: IController, FixedGTokens, FixedStablecoins, Constants, Whitelist, Ownable, Pausable, Context)
**Signature:** `setBigFishThreshold(uint256,uint256)`
**Method Selector ID:** `0x283c5bbe`
**Visibility:** `external`
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
- **Writes:** bigFishAbsoluteThreshold, bigFishThreshold

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_percent > 0,_whaleLimit is 0)`

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
    Node_0 --> Node_5
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(_percent > 0,_whaleLimit is 0)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - bigFishThreshold = _percent"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - bigFishAbsoluteThreshold = _absolute"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - LogNewBigFishThreshold(_percent,_absolute)"]
    Node_5["5: NodeType.EXPRESSION - onlyOwner()"]
    Node_5 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/Controller.sol` on lines **187** to **192**

```solidity
    function setBigFishThreshold(uint256 _percent, uint256 _absolute) external onlyOwner {
        require(_percent > 0, "_whaleLimit is 0");
        bigFishThreshold = _percent;
        bigFishAbsoluteThreshold = _absolute;
        emit LogNewBigFishThreshold(_percent, _absolute);
    }

```
