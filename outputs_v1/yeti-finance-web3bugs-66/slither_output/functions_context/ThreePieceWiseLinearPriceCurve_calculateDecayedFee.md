# Context: ThreePieceWiseLinearPriceCurve.calculateDecayedFee

**Contract:** `ThreePieceWiseLinearPriceCurve` (Inherits: Ownable, IPriceCurve)
**Signature:** `calculateDecayedFee() returns (uint256)`
**Method Selector ID:** `0xd26e6aa4`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** decayTime, lastFeePercent, lastFeeTime
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_112(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['lastFeePercent', 'decay'] `
- `SafeMath.TMP_113(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_112', 'cachedDecayTime'] `
- `SafeMath.TMP_110(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['block.timestamp', 'lastFeeTime'] `
- `SafeMath.TMP_114(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['lastFeePercent', 'TMP_113'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - decay = block.timestamp.sub(lastFeeTime)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - cachedDecayTime = decayTime"]
    Node_2 --> Node_3
    Node_3["3: NodeType.IF - decay <= cachedDecayTime"]
    Node_3 --> Node_4
    Node_3 --> Node_5
    Node_4["4: NodeType.EXPRESSION - fee = lastFeePercent.sub(lastFeePercent.mul(decay).div(cachedDecayTime))"]
    Node_4 --> Node_6
    Node_5["5: NodeType.EXPRESSION - fee = 0"]
    Node_5 --> Node_6
    Node_6["6: NodeType.ENDIF - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.RETURN - fee"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/PriceCurves/ThreePieceWiseLinearPriceCurve.sol` on lines **176** to **186**

```solidity
    function calculateDecayedFee() public override view returns (uint256 fee) {
        uint256 decay = block.timestamp.sub(lastFeeTime);
        // Decay within bounds of decay time, then decay the fee. 
        uint256 cachedDecayTime = decayTime;
        if (decay <= cachedDecayTime) {
            fee = lastFeePercent.sub(lastFeePercent.mul(decay).div(cachedDecayTime));
        } else {
            // If it has been longer than decay time, then reset fee to 0.
            fee = 0;
        }
    }

```
