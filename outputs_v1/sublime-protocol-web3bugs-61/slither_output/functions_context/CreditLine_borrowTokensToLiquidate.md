# Context: CreditLine.borrowTokensToLiquidate

**Contract:** `CreditLine` (Inherits: OwnableUpgradeable, ContextUpgradeable, Initializable, ReentrancyGuard)
**Signature:** `borrowTokensToLiquidate(uint256) returns (uint256)`
**Method Selector ID:** `0x65b59b5d`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** creditLineConstants
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
    Node_1["1: NodeType.VARIABLE - _collateralAsset = creditLineConstants(_id).collateralAsset"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - _totalCollateralTokens = calculateTotalCollateralTokens(_id)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - _borrowAsset = creditLineConstants(_id).borrowAsset"]
    Node_3 --> Node_4
    Node_4["4: NodeType.RETURN - _borrowTokensToLiquidate(_borrowAsset,_collateralAsset,_totalCollateralTokens)"]
```

### Source Mapping
Declared in: `contracts/CreditLine/CreditLine.sol` on lines **1037** to **1043**

```solidity
    function borrowTokensToLiquidate(uint256 _id) external returns (uint256) {
        address _collateralAsset = creditLineConstants[_id].collateralAsset;
        uint256 _totalCollateralTokens = calculateTotalCollateralTokens(_id);
        address _borrowAsset = creditLineConstants[_id].borrowAsset;

        return _borrowTokensToLiquidate(_borrowAsset, _collateralAsset, _totalCollateralTokens);
    }

```
