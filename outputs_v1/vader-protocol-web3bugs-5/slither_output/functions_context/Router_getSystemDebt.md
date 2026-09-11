# Context: Router.getSystemDebt

**Contract:** `Router` (Inherits: None)
**Signature:** `getSystemDebt(address,address) returns (uint256)`
**Method Selector ID:** `0x82eb7233`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** mapCollateralDebt_Debt
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
    Node_1["1: NodeType.RETURN - mapCollateralDebt_Debt(collateralAsset)(debtAsset)"]
```

### Source Mapping
Declared in: `contracts/Router.sol` on lines **502** to **504**

```solidity
    function getSystemDebt(address collateralAsset, address debtAsset) public view returns(uint) {
        return mapCollateralDebt_Debt[collateralAsset][debtAsset];
    }

```
