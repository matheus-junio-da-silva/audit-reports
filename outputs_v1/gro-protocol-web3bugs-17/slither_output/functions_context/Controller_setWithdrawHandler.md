# Context: Controller.setWithdrawHandler

**Contract:** `Controller` (Inherits: IController, FixedGTokens, FixedStablecoins, Constants, Whitelist, Ownable, Pausable, Context)
**Signature:** `setWithdrawHandler(address,address)`
**Method Selector ID:** `0xb1c4dbc3`
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
- **Writes:** emergencyHandler, withdrawHandler

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_withdrawHandler != address(0),setWithdrawHandler: 0x)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(_withdrawHandler != address(0),setWithdrawHandler: 0x)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - withdrawHandler = _withdrawHandler"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - emergencyHandler = _emergencyHandler"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - LogNewWithdrawHandler(_withdrawHandler)"]
    Node_5["5: NodeType.EXPRESSION - onlyOwner()"]
    Node_5 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/Controller.sol` on lines **105** to **110**

```solidity
    function setWithdrawHandler(address _withdrawHandler, address _emergencyHandler) external onlyOwner {
        require(_withdrawHandler != address(0), "setWithdrawHandler: 0x");
        withdrawHandler = _withdrawHandler;
        emergencyHandler = _emergencyHandler;
        emit LogNewWithdrawHandler(_withdrawHandler);
    }

```
