# Context: Controller.setCurveVault

**Contract:** `Controller` (Inherits: IController, FixedGTokens, FixedStablecoins, Constants, Whitelist, Ownable, Pausable, Context)
**Signature:** `setCurveVault(address)`
**Method Selector ID:** `0xa1c317fd`
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
- **Reads:** N_COINS
- **Writes:** curveVault, vaultIndexes

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_curveVault != address(0),setCurveVault: 0x)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(_curveVault != address(0),setCurveVault: 0x)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - curveVault = _curveVault"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - vaultIndexes(_curveVault) = N_COINS + 1"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - LogNewCurveVault(_curveVault)"]
    Node_5["5: NodeType.EXPRESSION - onlyOwner()"]
    Node_5 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/Controller.sol` on lines **145** to **150**

```solidity
    function setCurveVault(address _curveVault) external onlyOwner {
        require(_curveVault != address(0), "setCurveVault: 0x");
        curveVault = _curveVault;
        vaultIndexes[_curveVault] = N_COINS + 1;
        emit LogNewCurveVault(_curveVault);
    }

```
