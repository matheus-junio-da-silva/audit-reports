# Context: Controller.setPnL

**Contract:** `Controller` (Inherits: IController, FixedGTokens, FixedStablecoins, Constants, Whitelist, Ownable, Pausable, Context)
**Signature:** `setPnL(address)`
**Method Selector ID:** `0x8dc83df8`
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
- **Writes:** pnl

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_pnl != address(0),setPnl: 0x)`

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
    Node_0 --> Node_4
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(_pnl != address(0),setPnl: 0x)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - pnl = _pnl"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - LogNewPnl(_pnl)"]
    Node_4["4: NodeType.EXPRESSION - onlyOwner()"]
    Node_4 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/Controller.sol` on lines **165** to **169**

```solidity
    function setPnL(address _pnl) external onlyOwner {
        require(_pnl != address(0), "setPnl: 0x");
        pnl = _pnl;
        emit LogNewPnl(_pnl);
    }

```
