# Context: Router.repayForMember

**Contract:** `Router` (Inherits: None)
**Signature:** `repayForMember(address,uint256,address,address) returns (uint256)`
**Method Selector ID:** `0xe9b6e448`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** POOLS, USDV, VADER, mapCollateralDebt_Collateral, mapCollateralDebt_Debt, mapCollateralDebt_interestPaid
- **Writes:** mapCollateralDebt_Collateral, mapCollateralDebt_Debt, mapCollateralDebt_interestPaid

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `iPOOLS.TMP_491(bool) = HIGH_LEVEL_CALL, dest:TMP_490(iPOOLS), function:isAsset, arguments:['debtAsset']  `
- `iUTILS.TUPLE_4(uint256,uint256) = HIGH_LEVEL_CALL, dest:TMP_497(iUTILS), function:getDebtValueInCollateral, arguments:['member', '_debt', 'collateralAsset', 'debtAsset']  `
- `iUTILS.TMP_480(uint256) = HIGH_LEVEL_CALL, dest:TMP_478(iUTILS), function:calcPart, arguments:['basisPoints', 'TMP_479']  `
- `iPOOLS.TMP_488(uint256) = HIGH_LEVEL_CALL, dest:TMP_486(iPOOLS), function:swap, arguments:['VADER', 'debtAsset', 'TMP_487', 'True']  `
- `iPOOLS.TMP_484(bool) = HIGH_LEVEL_CALL, dest:TMP_483(iPOOLS), function:isAnchor, arguments:['debtAsset']  `
- `iPOOLS.TMP_495(uint256) = HIGH_LEVEL_CALL, dest:TMP_493(iPOOLS), function:swap, arguments:['USDV', 'debtAsset', 'TMP_494', 'True']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - _amount = iUTILS(UTILS()).calcPart(basisPoints,getMemberDebt(member,collateralAsset,debtAsset))"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - _debt = moveTokenToPools(debtAsset,_amount)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.IF - collateralAsset == VADER || iPOOLS(POOLS).isAnchor(debtAsset)"]
    Node_3 --> Node_4
    Node_3 --> Node_5
    Node_4["4: NodeType.EXPRESSION - iPOOLS(POOLS).swap(VADER,debtAsset,address(this),true)"]
    Node_4 --> Node_8
    Node_5["5: NodeType.IF - collateralAsset == USDV || iPOOLS(POOLS).isAsset(debtAsset)"]
    Node_5 --> Node_6
    Node_5 --> Node_7
    Node_6["6: NodeType.EXPRESSION - iPOOLS(POOLS).swap(USDV,debtAsset,address(this),true)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.ENDIF - "]
    Node_7 --> Node_8
    Node_8["8: NodeType.ENDIF - "]
    Node_8 --> Node_9
    Node_9["9: NodeType.VARIABLE - "]
    Node_9 --> Node_10
    Node_10["10: NodeType.VARIABLE - "]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - (_collateralUnlocked,_memberInterestShare) = iUTILS(UTILS()).getDebtValueInCollateral(member,_debt,collateralAsset,debtAsset)"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - mapCollateralDebt_Collateral(collateralAsset)(debtAsset) -= _collateralUnlocked"]
    Node_12 --> Node_13
    Node_13["13: NodeType.EXPRESSION - mapCollateralDebt_Debt(collateralAsset)(debtAsset) -= _debt"]
    Node_13 --> Node_14
    Node_14["14: NodeType.EXPRESSION - mapCollateralDebt_interestPaid(collateralAsset)(debtAsset) -= _memberInterestShare"]
    Node_14 --> Node_15
    Node_15["15: NodeType.EXPRESSION - _removeDebtFromMember(member,_collateralUnlocked,collateralAsset,_debt,debtAsset)"]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - RemoveCollateral(member,collateralAsset,_collateralUnlocked,debtAsset,_debt)"]
    Node_16 --> Node_17
    Node_17["17: NodeType.EXPRESSION - _handleTransferOut(member,collateralAsset,_collateralUnlocked)"]
    Node_17 --> Node_18
    Node_18["18: NodeType.EXPRESSION - payInterest(collateralAsset,debtAsset)"]
    Node_18 --> Node_19
    Node_19["19: NodeType.RETURN - _collateralUnlocked"]
```

### Source Mapping
Declared in: `contracts/Router.sol` on lines **338** to **355**

```solidity
    function repayForMember(address member, uint basisPoints, address collateralAsset, address debtAsset) public returns (uint){
        uint _amount = iUTILS(UTILS()).calcPart(basisPoints, getMemberDebt(member, collateralAsset, debtAsset));
        uint _debt = moveTokenToPools(debtAsset, _amount);    // Get Debt
        if(collateralAsset == VADER || iPOOLS(POOLS).isAnchor(debtAsset)){
            iPOOLS(POOLS).swap(VADER, debtAsset, address(this), true);           // Swap Debt to Base back here
        } else if(collateralAsset == USDV || iPOOLS(POOLS).isAsset(debtAsset)) {
            iPOOLS(POOLS).swap(USDV, debtAsset, address(this), true);           // Swap Debt to Base back here
        }
        (uint _collateralUnlocked,  uint _memberInterestShare) = iUTILS(UTILS()).getDebtValueInCollateral(member, _debt, collateralAsset, debtAsset); // Unlock collateral that is pro-rata to re-paid debt ($50/$100 = 50%)
        mapCollateralDebt_Collateral[collateralAsset][debtAsset] -= _collateralUnlocked;               // Update collateral 
        mapCollateralDebt_Debt[collateralAsset][debtAsset] -= _debt;                   // Update debt 
        mapCollateralDebt_interestPaid[collateralAsset][debtAsset] -= _memberInterestShare;
        _removeDebtFromMember(member, _collateralUnlocked, collateralAsset, _debt, debtAsset);  // Remove
        emit RemoveCollateral(member, collateralAsset, _collateralUnlocked, debtAsset, _debt);
        _handleTransferOut(member, collateralAsset, _collateralUnlocked);
        payInterest(collateralAsset, debtAsset);
        return _collateralUnlocked;
    }

```
