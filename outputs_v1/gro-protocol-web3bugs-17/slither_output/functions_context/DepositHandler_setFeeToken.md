# Context: DepositHandler.setFeeToken

**Contract:** `DepositHandler` (Inherits: IDepositHandler, FixedVaults, FixedStablecoins, Constants, Controllable, Ownable, Context)
**Signature:** `setFeeToken(uint256)`
**Method Selector ID:** `0xc73af168`
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
- **Reads:** ctrl
- **Writes:** feeToken

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(token != address(0),setFeeToken: !invalid token)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IController.TMP_48(address[3]) = HIGH_LEVEL_CALL, dest:ctrl(IController), function:stablecoins, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_5
    Node_1["1: NodeType.VARIABLE - token = ctrl.stablecoins()(index)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(token != address(0),setFeeToken: !invalid token)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - feeToken(index) = true"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - LogNewFeeToken(token,index)"]
    Node_5["5: NodeType.EXPRESSION - onlyOwner()"]
    Node_5 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/DepositHandler.sol` on lines **70** to **75**

```solidity
    function setFeeToken(uint256 index) external onlyOwner {
        address token = ctrl.stablecoins()[index];
        require(token != address(0), "setFeeToken: !invalid token");
        feeToken[index] = true;
        emit LogNewFeeToken(token, index);
    }

```
