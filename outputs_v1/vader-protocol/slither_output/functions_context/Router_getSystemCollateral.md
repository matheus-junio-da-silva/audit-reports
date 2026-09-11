# Context: Router.getSystemCollateral

**Contract:** `Router` (Inherits: None)
**Signature:** `getSystemCollateral(address,address) returns (uint256)`
**Method Selector ID:** `0xe672f6ad`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** mapCollateralDebt_Collateral
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
    Node_1["1: NodeType.RETURN - mapCollateralDebt_Collateral(collateralAsset)(debtAsset)"]
```

### Source Mapping
Declared in: `contracts/Router.sol` on lines **499** to **501**

```solidity
    function getSystemCollateral(address collateralAsset, address debtAsset) public view returns(uint) {
        return mapCollateralDebt_Collateral[collateralAsset][debtAsset];
    }

```
