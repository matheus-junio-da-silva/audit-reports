# Context: Controller.setLifeGuard

**Contract:** `Controller` (Inherits: IController, FixedGTokens, FixedStablecoins, Constants, Whitelist, Ownable, Pausable, Context)
**Signature:** `setLifeGuard(address)`
**Method Selector ID:** `0x01c71360`
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
- **Writes:** buoy, lifeGuard

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_lifeGuard != address(0),setLifeGuard: 0x)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `ILifeGuard.TMP_73(address) = HIGH_LEVEL_CALL, dest:TMP_72(ILifeGuard), function:getBuoy, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_5
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(_lifeGuard != address(0),setLifeGuard: 0x)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - lifeGuard = _lifeGuard"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - buoy = ILifeGuard(_lifeGuard).getBuoy()"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - LogNewLifeguard(_lifeGuard)"]
    Node_5["5: NodeType.EXPRESSION - onlyOwner()"]
    Node_5 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/Controller.sol` on lines **152** to **157**

```solidity
    function setLifeGuard(address _lifeGuard) external onlyOwner {
        require(_lifeGuard != address(0), "setLifeGuard: 0x");
        lifeGuard = _lifeGuard;
        buoy = ILifeGuard(_lifeGuard).getBuoy();
        emit LogNewLifeguard(_lifeGuard);
    }

```
