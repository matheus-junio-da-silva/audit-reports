# Context: Utils.getInterestOwed

**Contract:** `Utils` (Inherits: None)
**Signature:** `getInterestOwed(address,address,uint256) returns (uint256)`
**Method Selector ID:** `0x945821af`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** FACTORY, _year
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `iFACTORY.TMP_995(bool) = HIGH_LEVEL_CALL, dest:TMP_994(iFACTORY), function:isSynth, arguments:['collateralAsset']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - _interestPayment = calcShare(timeElapsed,_year,getInterestPayment(collateralAsset,debtAsset))"]
    Node_1 --> Node_2
    Node_2["2: NodeType.IF - isBase(collateralAsset)"]
    Node_2 --> Node_3
    Node_2 --> Node_4
    Node_3["3: NodeType.EXPRESSION - interestOwed = calcValueInBase(debtAsset,_interestPayment)"]
    Node_3 --> Node_7
    Node_4["4: NodeType.IF - iFACTORY(FACTORY).isSynth(collateralAsset)"]
    Node_4 --> Node_5
    Node_4 --> Node_6
    Node_5["5: NodeType.EXPRESSION - interestOwed = calcValueOfTokenInToken(debtAsset,_interestPayment,collateralAsset)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.ENDIF - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.ENDIF - "]
    Node_7 --> Node_8
    Node_8["8: NodeType.RETURN - interestOwed"]
```

### Source Mapping
Declared in: `contracts/Utils.sol` on lines **175** to **182**

```solidity
    function getInterestOwed(address collateralAsset, address debtAsset, uint timeElapsed) external view returns(uint interestOwed) {
        uint _interestPayment = calcShare(timeElapsed, _year, getInterestPayment(collateralAsset, debtAsset)); // Share of the payment over 1 year
        if(isBase(collateralAsset)){
            interestOwed = calcValueInBase(debtAsset, _interestPayment); // Back to base
        } else if(iFACTORY(FACTORY).isSynth(collateralAsset)) {
            interestOwed = calcValueOfTokenInToken(debtAsset, _interestPayment, collateralAsset); // Get value of Synth in debtAsset (doubleSwap)
        }
    }

```
