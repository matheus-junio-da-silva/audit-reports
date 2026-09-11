# Context: EchidnaProxy.redeemCollateralPrx

**Contract:** `EchidnaProxy` (Inherits: None)
**Signature:** `redeemCollateralPrx(uint256,uint256,address,address,address,uint256,uint256)`
**Method Selector ID:** `0x014ea00f`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** troveManager
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `TroveManager.HIGH_LEVEL_CALL, dest:troveManager(TroveManager), function:redeemCollateral, arguments:['_YUSDAmount', '_YUSDMaxFee', '_firstRedemptionHint', '_upperPartialRedemptionHint', '_lowerPartialRedemptionHint', '_partialRedemptionHintNICR', '_maxIterations']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - troveManager.redeemCollateral(_YUSDAmount,_YUSDMaxFee,_firstRedemptionHint,_upperPartialRedemptionHint,_lowerPartialRedemptionHint,_partialRedemptionHintNICR,_maxIterations)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TestContracts/EchidnaProxy.sol` on lines **48** to **59**

```solidity
    function redeemCollateralPrx(
        uint _YUSDAmount,
        uint _YUSDMaxFee,
        address _firstRedemptionHint,
        address _upperPartialRedemptionHint,
        address _lowerPartialRedemptionHint,
        uint _partialRedemptionHintNICR,
        uint _maxIterations
        // uint _maxFee
    ) external {
        troveManager.redeemCollateral(_YUSDAmount, _YUSDMaxFee, _firstRedemptionHint, _upperPartialRedemptionHint, _lowerPartialRedemptionHint, _partialRedemptionHintNICR, _maxIterations);
    }

```
