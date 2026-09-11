# Context: Repayments.getTotalRepaidAmount

**Contract:** `Repayments` (Inherits: ReentrancyGuard, IRepayment, Initializable)
**Signature:** `getTotalRepaidAmount(address) returns (uint256)`
**Method Selector ID:** `0x1466e3ea`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** repayVariables
- **Writes:** None

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
    Node_0 --> Node_1
    Node_1["1: NodeType.RETURN - repayVariables(_poolID).repaidAmount"]
```

### Source Mapping
Declared in: `contracts/Pool/Repayments.sol` on lines **430** to **432**

```solidity
    function getTotalRepaidAmount(address _poolID) external view override returns (uint256) {
        return repayVariables[_poolID].repaidAmount;
    }

```
