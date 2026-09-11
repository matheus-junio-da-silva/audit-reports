# Context: Allocation.calcProtocolExposureDelta

**Contract:** `Allocation` (Inherits: IAllocation, Whitelist, Controllable, Ownable, Context, Constants)
**Signature:** `calcProtocolExposureDelta(uint256[],SystemState) returns (uint256, uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `private`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** PERCENTAGE_DECIMAL_FACTOR
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_193(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['TMP_192', 'REF_138'] `
- `SafeMath.TMP_191(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['REF_132', 'REF_134'] `
- `SafeMath.TMP_194(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_193', 'PERCENTAGE_DECIMAL_FACTOR'] `
- `SafeMath.TMP_192(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['REF_135', 'target'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_3
    Node_1["1: NodeType.STARTLOOP - "]
    Node_1 --> Node_4
    Node_2["2: NodeType.ENDLOOP - "]
    Node_2 --> Node_11
    Node_3["3: NodeType.VARIABLE - i = 0"]
    Node_3 --> Node_1
    Node_4["4: NodeType.IFLOOP - i < protocolExposure.length"]
    Node_4 --> Node_5
    Node_4 --> Node_2
    Node_5["5: NodeType.IF - protocolExposedDeltaUsd == 0 && protocolExposure(i) > sysState.rebalanceThreshold"]
    Node_5 --> Node_6
    Node_5 --> Node_9
    Node_6["6: NodeType.VARIABLE - target = sysState.rebalanceThreshold.sub(sysState.targetBuffer)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - protocolExposedDeltaUsd = protocolExposure(i).sub(target).mul(sysState.totalCurrentAssetsUsd).div(PERCENTAGE_DECIMAL_FACTOR)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - protocolExposedIndex = i"]
    Node_8 --> Node_9
    Node_9["9: NodeType.ENDIF - "]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - i ++"]
    Node_10 --> Node_4
    Node_11["11: NodeType.RETURN - (protocolExposedDeltaUsd,protocolExposedIndex)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/insurance/Allocation.sol` on lines **286** to **302**

```solidity
    function calcProtocolExposureDelta(uint256[] memory protocolExposure, SystemState memory sysState)
        private
        pure
        returns (uint256 protocolExposedDeltaUsd, uint256 protocolExposedIndex)
    {
        for (uint256 i = 0; i < protocolExposure.length; i++) {
            // If the exposure is greater than the rebalance threshold...
            if (protocolExposedDeltaUsd == 0 && protocolExposure[i] > sysState.rebalanceThreshold) {
                // ...Calculate the delta between exposure and target
                uint256 target = sysState.rebalanceThreshold.sub(sysState.targetBuffer);
                protocolExposedDeltaUsd = protocolExposure[i].sub(target).mul(sysState.totalCurrentAssetsUsd).div(
                    PERCENTAGE_DECIMAL_FACTOR
                );
                protocolExposedIndex = i;
            }
        }
    }

```
