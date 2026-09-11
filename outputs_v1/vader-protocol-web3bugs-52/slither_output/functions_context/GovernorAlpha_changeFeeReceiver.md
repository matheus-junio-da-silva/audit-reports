# Context: GovernorAlpha.changeFeeReceiver

**Contract:** `GovernorAlpha` (Inherits: None)
**Signature:** `changeFeeReceiver(address)`
**Method Selector ID:** `0x7c08b964`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyGuardian`
  ```solidity
  modifier onlyGuardian() {
          _onlyGuardian();
          _;
      }
  ```

### State Variables Interaction
- **Reads:** feeReceiver
- **Writes:** feeReceiver

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
    Node_0 --> Node_3
    Node_1["1: NodeType.EXPRESSION - FeeReceiverChanged(feeReceiver,feeReceiver_)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - feeReceiver = feeReceiver_"]
    Node_3["3: NodeType.EXPRESSION - onlyGuardian()"]
    Node_3 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/governance/GovernorAlpha.sol` on lines **534** to **537**

```solidity
    function changeFeeReceiver(address feeReceiver_) external onlyGuardian {
        emit FeeReceiverChanged(feeReceiver, feeReceiver_);
        feeReceiver = feeReceiver_;
    }

```
