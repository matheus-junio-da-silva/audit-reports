# Context: Vault.calcReward

**Contract:** `Vault` (Inherits: None)
**Signature:** `calcReward(address,address) returns (uint256)`
**Method Selector ID:** `0xa6dde131`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** POOLS, ROUTER, erasToEarn, mapMember_weight, totalWeight
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `iUTILS.TMP_1267(uint256) = HIGH_LEVEL_CALL, dest:TMP_1265(iUTILS), function:calcShare, arguments:['_weight', 'totalWeight', 'TMP_1266']  `
- `iSYNTH.TMP_1257(address) = HIGH_LEVEL_CALL, dest:TMP_1256(iSYNTH), function:TOKEN, arguments:[]  `
- `iPOOLS.TMP_1258(bool) = HIGH_LEVEL_CALL, dest:TMP_1255(iPOOLS), function:isAsset, arguments:['TMP_1257']  `
- `iROUTER.TMP_1261(uint256) = HIGH_LEVEL_CALL, dest:TMP_1259(iROUTER), function:getUSDVAmount, arguments:['TMP_1260']  `
- `iROUTER.TMP_1270(uint256) = HIGH_LEVEL_CALL, dest:TMP_1268(iROUTER), function:getUSDVAmount, arguments:['TMP_1269']  `
- `iUTILS.TMP_1276(uint256) = HIGH_LEVEL_CALL, dest:TMP_1274(iUTILS), function:calcShare, arguments:['_weight', 'totalWeight', 'TMP_1275']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - _weight = mapMember_weight(member)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.IF - iPOOLS(POOLS).isAsset(iSYNTH(synth).TOKEN())"]
    Node_2 --> Node_3
    Node_2 --> Node_5
    Node_3["3: NodeType.VARIABLE - _adjustedReserve = iROUTER(ROUTER).getUSDVAmount(reserveVADER()) + reserveUSDV()"]
    Node_3 --> Node_4
    Node_4["4: NodeType.RETURN - iUTILS(UTILS()).calcShare(_weight,totalWeight,_adjustedReserve / erasToEarn)"]
    Node_5["5: NodeType.VARIABLE - _adjustedReserve_scope_0 = iROUTER(ROUTER).getUSDVAmount(reserveVADER()) + reserveUSDV()"]
    Node_5 --> Node_6
    Node_6["6: NodeType.RETURN - iUTILS(UTILS()).calcShare(_weight,totalWeight,_adjustedReserve_scope_0 / erasToEarn)"]
    Node_8["8: NodeType.RETURN - reward"]
```

### Source Mapping
Declared in: `contracts/Vault.sol` on lines **138** to **147**

```solidity
    function calcReward(address synth, address member) public view returns(uint reward) {
        uint _weight = mapMember_weight[member];  
        if(iPOOLS(POOLS).isAsset(iSYNTH(synth).TOKEN())){
            uint _adjustedReserve = iROUTER(ROUTER).getUSDVAmount(reserveVADER()) + reserveUSDV();      // Aggregrate reserves
            return iUTILS(UTILS()).calcShare(_weight, totalWeight, _adjustedReserve / erasToEarn);                   // Get member's share of that
        } else{
            uint _adjustedReserve = iROUTER(ROUTER).getUSDVAmount(reserveVADER()) + reserveUSDV();
            return iUTILS(UTILS()).calcShare(_weight, totalWeight, _adjustedReserve / erasToEarn);          
        }
    }

```
