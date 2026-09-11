# Context: Router.repay

**Contract:** `Router` (Inherits: None)
**Signature:** `repay(uint256,address,address) returns (uint256)`
**Method Selector ID:** `0xc883b2e5`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
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
    Node_1["1: NodeType.RETURN - repayForMember(msg.sender,amount,collateralAsset,debtAsset)"]
```

### Source Mapping
Declared in: `contracts/Router.sol` on lines **334** to **336**

```solidity
    function repay(uint amount, address collateralAsset, address debtAsset) public returns (uint){
        return repayForMember(msg.sender, amount, collateralAsset, debtAsset);
    }

```
