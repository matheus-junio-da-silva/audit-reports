# Context: HintHelpers.getRedemptionHints

**Contract:** `HintHelpers` (Inherits: CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `getRedemptionHints(uint256,uint256) returns (address, uint256, uint256)`
**Method Selector ID:** `0x8ac54b0d`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** MCR, MIN_NET_DEBT, sortedTroves, troveManager
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `ITroveManager.TMP_345(uint256) = HIGH_LEVEL_CALL, dest:troveManager(ITroveManager), function:getPendingYUSDDebtReward, arguments:['currentTroveuser']  `
- `ITroveManager.TMP_343(uint256) = HIGH_LEVEL_CALL, dest:troveManager(ITroveManager), function:getTroveDebt, arguments:['currentTroveuser']  `
- `ISortedTroves.TMP_332(address) = HIGH_LEVEL_CALL, dest:sortedTrovesCached(ISortedTroves), function:getPrev, arguments:['currentTroveuser']  `
- `ISortedTroves.TMP_329(uint256) = HIGH_LEVEL_CALL, dest:sortedTroves(ISortedTroves), function:getOldICR, arguments:['currentTroveuser']  `
- `SafeMath.TMP_352(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['netYUSDDebt', 'maxRedeemableYUSD'] `
- `SafeMath.TMP_349(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['netYUSDDebt', 'MIN_NET_DEBT'] `
- `SafeMath.TMP_358(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['_YUSDamount', 'remainingYUSD'] `
- `SafeMath.TMP_355(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['remainingYUSD', 'maxRedeemableYUSD'] `
- `SafeMath.TMP_346(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['TMP_344', 'TMP_345'] `
- `LiquityMath.TMP_354(uint256) = LIBRARY_CALL, dest:LiquityMath, function:LiquityMath._computeCR(uint256,uint256), arguments:['newColl', 'compositeDebt'] `
- `LiquityMath.TMP_350(uint256) = LIBRARY_CALL, dest:LiquityMath, function:LiquityMath._min(uint256,uint256), arguments:['remainingYUSD', 'TMP_349'] `
- `ISortedTroves.TMP_357(address) = HIGH_LEVEL_CALL, dest:sortedTrovesCached(ISortedTroves), function:getPrev, arguments:['currentTroveuser']  `
- `SafeMath.TMP_356(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['remainingYUSD', 'netYUSDDebt'] `
- `ISortedTroves.TMP_326(address) = HIGH_LEVEL_CALL, dest:sortedTrovesCached(ISortedTroves), function:getLast, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - sortedTrovesCached = sortedTroves"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - remainingYUSD = _YUSDamount"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - currentTroveuser = sortedTrovesCached.getLast()"]
    Node_3 --> Node_4
    Node_4["4: NodeType.STARTLOOP - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.IFLOOP - currentTroveuser != address(0) && sortedTroves.getOldICR(currentTroveuser) < MCR"]
    Node_5 --> Node_6
    Node_5 --> Node_7
    Node_6["6: NodeType.EXPRESSION - currentTroveuser = sortedTrovesCached.getPrev(currentTroveuser)"]
    Node_6 --> Node_5
    Node_7["7: NodeType.ENDLOOP - "]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - firstRedemptionHint = currentTroveuser"]
    Node_8 --> Node_9
    Node_9["9: NodeType.IF - _maxIterations == 0"]
    Node_9 --> Node_10
    Node_9 --> Node_11
    Node_10["10: NodeType.EXPRESSION - _maxIterations = uint256(- 1)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.ENDIF - "]
    Node_11 --> Node_12
    Node_12["12: NodeType.STARTLOOP - "]
    Node_12 --> Node_13
    Node_13["13: NodeType.IFLOOP - currentTroveuser != address(0) && remainingYUSD != 0 && _maxIterations -- != 0"]
    Node_13 --> Node_14
    Node_13 --> Node_28
    Node_14["14: NodeType.VARIABLE - netYUSDDebt = _getNetDebt(troveManager.getTroveDebt(currentTroveuser)).add(troveManager.getPendingYUSDDebtReward(currentTroveuser))"]
    Node_14 --> Node_15
    Node_15["15: NodeType.IF - netYUSDDebt > remainingYUSD"]
    Node_15 --> Node_16
    Node_15 --> Node_25
    Node_16["16: NodeType.IF - netYUSDDebt > MIN_NET_DEBT"]
    Node_16 --> Node_17
    Node_16 --> Node_23
    Node_17["17: NodeType.VARIABLE - maxRedeemableYUSD = LiquityMath._min(remainingYUSD,netYUSDDebt.sub(MIN_NET_DEBT))"]
    Node_17 --> Node_18
    Node_18["18: NodeType.VARIABLE - newColl = _calculateVCAfterRedemption(currentTroveuser,maxRedeemableYUSD)"]
    Node_18 --> Node_19
    Node_19["19: NodeType.VARIABLE - newDebt = netYUSDDebt.sub(maxRedeemableYUSD)"]
    Node_19 --> Node_20
    Node_20["20: NodeType.VARIABLE - compositeDebt = _getCompositeDebt(newDebt)"]
    Node_20 --> Node_21
    Node_21["21: NodeType.EXPRESSION - partialRedemptionHintICR = LiquityMath._computeCR(newColl,compositeDebt)"]
    Node_21 --> Node_22
    Node_22["22: NodeType.EXPRESSION - remainingYUSD = remainingYUSD.sub(maxRedeemableYUSD)"]
    Node_22 --> Node_23
    Node_23["23: NodeType.ENDIF - "]
    Node_23 --> Node_24
    Node_24["24: NodeType.BREAK - "]
    Node_24 --> Node_28
    Node_25["25: NodeType.EXPRESSION - remainingYUSD = remainingYUSD.sub(netYUSDDebt)"]
    Node_25 --> Node_26
    Node_26["26: NodeType.ENDIF - "]
    Node_26 --> Node_27
    Node_27["27: NodeType.EXPRESSION - currentTroveuser = sortedTrovesCached.getPrev(currentTroveuser)"]
    Node_27 --> Node_13
    Node_28["28: NodeType.ENDLOOP - "]
    Node_28 --> Node_29
    Node_29["29: NodeType.EXPRESSION - truncatedYUSDamount = _YUSDamount.sub(remainingYUSD)"]
    Node_29 --> Node_30
    Node_30["30: NodeType.RETURN - (firstRedemptionHint,partialRedemptionHintICR,truncatedYUSDamount)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/HintHelpers.sol` on lines **73** to **125**

```solidity
    function getRedemptionHints(
        uint _YUSDamount, 
        uint _maxIterations
    )
        external
        view
        returns (
            address firstRedemptionHint,
            uint partialRedemptionHintICR,
            uint truncatedYUSDamount
        )
    {
        ISortedTroves sortedTrovesCached = sortedTroves;

        uint remainingYUSD = _YUSDamount;
        address currentTroveuser = sortedTrovesCached.getLast();

        while (currentTroveuser != address(0) && sortedTroves.getOldICR(currentTroveuser) < MCR) {
            currentTroveuser = sortedTrovesCached.getPrev(currentTroveuser);
        }

        firstRedemptionHint = currentTroveuser;

        if (_maxIterations == 0) {
            _maxIterations = uint(-1);
        }

        while (currentTroveuser != address(0) && remainingYUSD != 0 && _maxIterations-- != 0) {
            uint netYUSDDebt = _getNetDebt(troveManager.getTroveDebt(currentTroveuser))
                .add(troveManager.getPendingYUSDDebtReward(currentTroveuser));

            if (netYUSDDebt > remainingYUSD) { // Partial redemption
                if (netYUSDDebt > MIN_NET_DEBT) { // MIN NET DEBT = 1800
                    uint maxRedeemableYUSD = LiquityMath._min(remainingYUSD, netYUSDDebt.sub(MIN_NET_DEBT));

                    uint newColl = _calculateVCAfterRedemption(currentTroveuser, maxRedeemableYUSD);
                    uint newDebt = netYUSDDebt.sub(maxRedeemableYUSD);

                    uint compositeDebt = _getCompositeDebt(newDebt);
                    partialRedemptionHintICR = LiquityMath._computeCR(newColl, compositeDebt);

                    remainingYUSD = remainingYUSD.sub(maxRedeemableYUSD);
                }
                break;
            } else { // Full redemption in this case
                remainingYUSD = remainingYUSD.sub(netYUSDDebt);
            }

            currentTroveuser = sortedTrovesCached.getPrev(currentTroveuser);
        }

        truncatedYUSDamount = _YUSDamount.sub(remainingYUSD);
    }

```
