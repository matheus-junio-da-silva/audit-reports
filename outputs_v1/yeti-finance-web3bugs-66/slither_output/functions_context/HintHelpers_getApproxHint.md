# Context: HintHelpers.getApproxHint

**Contract:** `HintHelpers` (Inherits: CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `getApproxHint(uint256,uint256,uint256) returns (address, uint256, uint256)`
**Method Selector ID:** `0x7b41bdbe`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** sortedTroves, troveManager
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `ITroveManager.TMP_369(uint256) = HIGH_LEVEL_CALL, dest:troveManager(ITroveManager), function:getTroveOwnersCount, arguments:[]  `
- `ISortedTroves.TMP_372(address) = HIGH_LEVEL_CALL, dest:sortedTroves(ISortedTroves), function:getLast, arguments:[]  `
- `ITroveManager.TMP_380(address) = HIGH_LEVEL_CALL, dest:troveManager(ITroveManager), function:getTroveFromTroveOwnersArray, arguments:['arrayIndex']  `
- `ISortedTroves.TMP_381(uint256) = HIGH_LEVEL_CALL, dest:sortedTroves(ISortedTroves), function:getOldICR, arguments:['currentAddress']  `
- `LiquityMath.TMP_382(uint256) = LIBRARY_CALL, dest:LiquityMath, function:LiquityMath._getAbsoluteDifference(uint256,uint256), arguments:['currentICR', '_CR'] `
- `LiquityMath.TMP_374(uint256) = LIBRARY_CALL, dest:LiquityMath, function:LiquityMath._getAbsoluteDifference(uint256,uint256), arguments:['_CR', 'TMP_373'] `
- `ISortedTroves.TMP_373(uint256) = HIGH_LEVEL_CALL, dest:sortedTroves(ISortedTroves), function:getOldICR, arguments:['hintAddress']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - arrayLength = troveManager.getTroveOwnersCount()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.IF - arrayLength == 0"]
    Node_2 --> Node_3
    Node_2 --> Node_4
    Node_3["3: NodeType.RETURN - (address(0),0,_inputRandomSeed)"]
    Node_4["4: NodeType.ENDIF - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - hintAddress = sortedTroves.getLast()"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - diff = LiquityMath._getAbsoluteDifference(_CR,sortedTroves.getOldICR(hintAddress))"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - latestRandomSeed = _inputRandomSeed"]
    Node_7 --> Node_8
    Node_8["8: NodeType.VARIABLE - i = 1"]
    Node_8 --> Node_9
    Node_9["9: NodeType.STARTLOOP - "]
    Node_9 --> Node_10
    Node_10["10: NodeType.IFLOOP - i < _numTrials"]
    Node_10 --> Node_11
    Node_10 --> Node_21
    Node_11["11: NodeType.EXPRESSION - latestRandomSeed = uint256(keccak256(bytes)(abi.encodePacked(latestRandomSeed)))"]
    Node_11 --> Node_12
    Node_12["12: NodeType.VARIABLE - arrayIndex = latestRandomSeed % arrayLength"]
    Node_12 --> Node_13
    Node_13["13: NodeType.VARIABLE - currentAddress = troveManager.getTroveFromTroveOwnersArray(arrayIndex)"]
    Node_13 --> Node_14
    Node_14["14: NodeType.VARIABLE - currentICR = sortedTroves.getOldICR(currentAddress)"]
    Node_14 --> Node_15
    Node_15["15: NodeType.VARIABLE - currentDiff = LiquityMath._getAbsoluteDifference(currentICR,_CR)"]
    Node_15 --> Node_16
    Node_16["16: NodeType.IF - currentDiff < diff"]
    Node_16 --> Node_17
    Node_16 --> Node_19
    Node_17["17: NodeType.EXPRESSION - diff = currentDiff"]
    Node_17 --> Node_18
    Node_18["18: NodeType.EXPRESSION - hintAddress = currentAddress"]
    Node_18 --> Node_19
    Node_19["19: NodeType.ENDIF - "]
    Node_19 --> Node_20
    Node_20["20: NodeType.EXPRESSION - ++ i"]
    Node_20 --> Node_10
    Node_21["21: NodeType.ENDLOOP - "]
    Node_21 --> Node_22
    Node_22["22: NodeType.RETURN - (hintAddress,diff,latestRandomSeed)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/HintHelpers.sol` on lines **159** to **192**

```solidity
    function getApproxHint(uint _CR, uint _numTrials, uint _inputRandomSeed)
        external
        view
        returns (address hintAddress, uint diff, uint latestRandomSeed)
    {
        uint arrayLength = troveManager.getTroveOwnersCount();

        if (arrayLength == 0) {
            return (address(0), 0, _inputRandomSeed);
        }

        hintAddress = sortedTroves.getLast();
        diff = LiquityMath._getAbsoluteDifference(_CR, sortedTroves.getOldICR(hintAddress));
        latestRandomSeed = _inputRandomSeed;

        uint i = 1;

        while (i < _numTrials) {
            latestRandomSeed = uint(keccak256(abi.encodePacked(latestRandomSeed)));

            uint arrayIndex = latestRandomSeed % arrayLength;
            address currentAddress = troveManager.getTroveFromTroveOwnersArray(arrayIndex);
            uint currentICR = sortedTroves.getOldICR(currentAddress);

            // check if abs(current - CR) > abs(closest - CR), and update closest if current is closer
            uint currentDiff = LiquityMath._getAbsoluteDifference(currentICR, _CR);

            if (currentDiff < diff) {
                diff = currentDiff;
                hintAddress = currentAddress;
            }
            ++i;
        }
    }

```
