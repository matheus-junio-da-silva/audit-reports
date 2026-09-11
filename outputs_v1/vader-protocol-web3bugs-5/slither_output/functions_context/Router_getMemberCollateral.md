# Context: Router.getMemberCollateral

**Contract:** `Router` (Inherits: None)
**Signature:** `getMemberCollateral(address,address,address) returns (uint256)`
**Method Selector ID:** `0xfde3bbe9`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** mapMember_Collateral
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
    Node_1["1: NodeType.RETURN - mapMember_Collateral(member).mapCollateral_Debt(collateralAsset).collateral(debtAsset)"]
```

### Source Mapping
Declared in: `contracts/Router.sol` on lines **493** to **495**

```solidity
    function getMemberCollateral(address member, address collateralAsset, address debtAsset) external view returns(uint) {
        return mapMember_Collateral[member].mapCollateral_Debt[collateralAsset].collateral[debtAsset];
    }

```
