# Context: Router.borrowForMember

**Contract:** `Router` (Inherits: None)
**Signature:** `borrowForMember(address,uint256,address,address) returns (uint256)`
**Method Selector ID:** `0x1ab73ef5`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** POOLS, USDV, VADER, mapCollateralDebt_Collateral, mapCollateralDebt_Debt
- **Writes:** mapCollateralDebt_Collateral, mapCollateralDebt_Debt

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `iPOOLS.TMP_465(uint256) = HIGH_LEVEL_CALL, dest:TMP_464(iPOOLS), function:swap, arguments:['VADER', 'debtAsset', 'member', 'False']  `
- `iPOOLS.TMP_473(uint256) = HIGH_LEVEL_CALL, dest:TMP_472(iPOOLS), function:swap, arguments:['USDV', 'debtAsset', 'member', 'False']  `
- `iERC20.TMP_463(bool) = HIGH_LEVEL_CALL, dest:TMP_462(iERC20), function:transfer, arguments:['POOLS', '_baseBorrowed']  `
- `iPOOLS.TMP_460(bool) = HIGH_LEVEL_CALL, dest:TMP_459(iPOOLS), function:isAnchor, arguments:['debtAsset']  `
- `iPOOLS.TMP_468(bool) = HIGH_LEVEL_CALL, dest:TMP_467(iPOOLS), function:isAsset, arguments:['debtAsset']  `
- `iUTILS.TUPLE_3(uint256,uint256) = HIGH_LEVEL_CALL, dest:TMP_456(iUTILS), function:getCollateralValueInBase, arguments:['member', '_collateral', 'collateralAsset', 'debtAsset']  `
- `iUTILS.HIGH_LEVEL_CALL, dest:TMP_452(iUTILS), function:assetChecks, arguments:['collateralAsset', 'debtAsset']  `
- `iERC20.TMP_471(bool) = HIGH_LEVEL_CALL, dest:TMP_470(iERC20), function:transfer, arguments:['POOLS', '_baseBorrowed']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - iUTILS(UTILS()).assetChecks(collateralAsset,debtAsset)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - _collateral = _handleTransferIn(member,collateralAsset,amount)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - (_debtIssued,_baseBorrowed) = iUTILS(UTILS()).getCollateralValueInBase(member,_collateral,collateralAsset,debtAsset)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - mapCollateralDebt_Collateral(collateralAsset)(debtAsset) += _collateral"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - mapCollateralDebt_Debt(collateralAsset)(debtAsset) += _debtIssued"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - _addDebtToMember(member,_collateral,collateralAsset,_debtIssued,debtAsset)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.IF - collateralAsset == VADER || iPOOLS(POOLS).isAnchor(debtAsset)"]
    Node_9 --> Node_10
    Node_9 --> Node_12
    Node_10["10: NodeType.EXPRESSION - iERC20(VADER).transfer(POOLS,_baseBorrowed)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - iPOOLS(POOLS).swap(VADER,debtAsset,member,false)"]
    Node_11 --> Node_16
    Node_12["12: NodeType.IF - collateralAsset == USDV || iPOOLS(POOLS).isAsset(debtAsset)"]
    Node_12 --> Node_13
    Node_12 --> Node_15
    Node_13["13: NodeType.EXPRESSION - iERC20(USDV).transfer(POOLS,_baseBorrowed)"]
    Node_13 --> Node_14
    Node_14["14: NodeType.EXPRESSION - iPOOLS(POOLS).swap(USDV,debtAsset,member,false)"]
    Node_14 --> Node_15
    Node_15["15: NodeType.ENDIF - "]
    Node_15 --> Node_16
    Node_16["16: NodeType.ENDIF - "]
    Node_16 --> Node_17
    Node_17["17: NodeType.EXPRESSION - AddCollateral(member,collateralAsset,amount,debtAsset,_debtIssued)"]
    Node_17 --> Node_18
    Node_18["18: NodeType.EXPRESSION - payInterest(collateralAsset,debtAsset)"]
    Node_18 --> Node_19
    Node_19["19: NodeType.RETURN - _debtIssued"]
```

### Source Mapping
Declared in: `contracts/Router.sol` on lines **314** to **331**

```solidity
    function borrowForMember(address member, uint amount, address collateralAsset, address debtAsset) public returns(uint) {
        iUTILS(UTILS()).assetChecks(collateralAsset, debtAsset);
        uint _collateral = _handleTransferIn(member, collateralAsset, amount);                  // get collateral 
        (uint _debtIssued, uint _baseBorrowed) = iUTILS(UTILS()).getCollateralValueInBase(member, _collateral, collateralAsset, debtAsset);
        mapCollateralDebt_Collateral[collateralAsset][debtAsset] += _collateral;               // Record collateral 
        mapCollateralDebt_Debt[collateralAsset][debtAsset] += _debtIssued;                            // Record debt
        _addDebtToMember(member, _collateral, collateralAsset, _debtIssued, debtAsset);    // Update member details
        if(collateralAsset == VADER || iPOOLS(POOLS).isAnchor(debtAsset)){
            iERC20(VADER).transfer(POOLS, _baseBorrowed);                                  // Send to pools
            iPOOLS(POOLS).swap(VADER, debtAsset, member, false);                         // Execute swap to member
        } else if(collateralAsset == USDV || iPOOLS(POOLS).isAsset(debtAsset)) {
            iERC20(USDV).transfer(POOLS, _baseBorrowed);                                  // Send to pools
            iPOOLS(POOLS).swap(USDV, debtAsset, member, false);                         // Execute swap to member
        }
        emit AddCollateral(member, collateralAsset, amount, debtAsset, _debtIssued);               // Event
        payInterest(collateralAsset, debtAsset);
        return _debtIssued;
    }

```
