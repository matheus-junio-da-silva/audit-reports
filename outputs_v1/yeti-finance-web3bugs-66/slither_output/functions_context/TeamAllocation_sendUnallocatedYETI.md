# Context: TeamAllocation.sendUnallocatedYETI

**Contract:** `TeamAllocation` (Inherits: None)
**Signature:** `sendUnallocatedYETI(address,uint256)`
**Method Selector ID:** `0xe05faf07`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyTeam`
  ```solidity
  modifier onlyTeam() {
          require(msg.sender == teamWallet, "Not a team wallet");
          _;
      }
  ```

### State Variables Interaction
- **Reads:** YETI, allocationClaimed
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(allocationClaimed,sendUnallocatedYETI: allocation already claimed)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeERC20.LIBRARY_CALL, dest:SafeERC20, function:SafeERC20.safeTransfer(IERC20,address,uint256), arguments:['YETI', '_to', '_amount'] `
- `TMP_79(None) = SOLIDITY_CALL require(bool,string)(allocationClaimed,sendUnallocatedYETI: allocation already claimed)`

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_3
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(allocationClaimed,sendUnallocatedYETI: allocation already claimed)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - YETI.safeTransfer(_to,_amount)"]
    Node_3["3: NodeType.EXPRESSION - onlyTeam()"]
    Node_3 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TeamAllocation.sol` on lines **81** to **84**

```solidity
    function sendUnallocatedYETI(address _to, uint _amount) external onlyTeam {
        require(allocationClaimed, "sendUnallocatedYETI: allocation already claimed");
        YETI.safeTransfer(_to, _amount);
    }

```
