# Context: StabilityPool._updateG

**Contract:** `StabilityPool` (Inherits: IStabilityPool, ICollateralReceiver, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `_updateG(uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** P, currentEpoch, currentScale, epochToScaleToG, totalYUSDDeposits
- **Writes:** epochToScaleToG

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_447(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['YETIPerUnitStaked', 'P'] `
- `SafeMath.TMP_448(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['REF_445', 'marginalYETIGain'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - totalYUSD = totalYUSDDeposits"]
    Node_1 --> Node_2
    Node_2["2: NodeType.IF - totalYUSD == 0 || _YETIIssuance == 0"]
    Node_2 --> Node_3
    Node_2 --> Node_4
    Node_3["3: NodeType.RETURN - "]
    Node_4["4: NodeType.ENDIF - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - YETIPerUnitStaked = _computeYETIPerUnitStaked(_YETIIssuance,totalYUSD)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - marginalYETIGain = YETIPerUnitStaked.mul(P)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - epochToScaleToG(currentEpoch)(currentScale) = epochToScaleToG(currentEpoch)(currentScale).add(marginalYETIGain)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - G_Updated(epochToScaleToG(currentEpoch)(currentScale),currentEpoch,currentScale)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/StabilityPool.sol` on lines **468** to **487**

```solidity
    function _updateG(uint256 _YETIIssuance) internal {
        uint256 totalYUSD = totalYUSDDeposits; // cached to save an SLOAD
        /*
         * When total deposits is 0, G is not updated. In this case, the YETI issued can not be obtained by later
         * depositors - it is missed out on, and remains in the balanceof the CommunityIssuance contract.
         *
         */
        if (totalYUSD == 0 || _YETIIssuance == 0) {
            return;
        }

        uint256 YETIPerUnitStaked;
        YETIPerUnitStaked = _computeYETIPerUnitStaked(_YETIIssuance, totalYUSD);

        uint256 marginalYETIGain = YETIPerUnitStaked.mul(P);
        epochToScaleToG[currentEpoch][currentScale] = epochToScaleToG[currentEpoch][currentScale]
            .add(marginalYETIGain);

        emit G_Updated(epochToScaleToG[currentEpoch][currentScale], currentEpoch, currentScale);
    }

```
