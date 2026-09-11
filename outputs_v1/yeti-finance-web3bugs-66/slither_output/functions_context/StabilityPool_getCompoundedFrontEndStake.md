# Context: StabilityPool.getCompoundedFrontEndStake

**Contract:** `StabilityPool` (Inherits: IStabilityPool, ICollateralReceiver, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `getCompoundedFrontEndStake(address) returns (uint256)`
**Method Selector ID:** `0xdf9cd84f`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** frontEndSnapshots, frontEndStakes
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- None

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - frontEndStake = frontEndStakes(_frontEnd)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.IF - frontEndStake == 0"]
    Node_2 --> Node_3
    Node_2 --> Node_4
    Node_3["3: NodeType.RETURN - 0"]
    Node_4["4: NodeType.ENDIF - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - snapshots = frontEndSnapshots(_frontEnd)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - compoundedFrontEndStake = _getCompoundedStakeFromSnapshots(frontEndStake,snapshots)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.RETURN - compoundedFrontEndStake"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/StabilityPool.sol` on lines **865** to **875**

```solidity
    function getCompoundedFrontEndStake(address _frontEnd) public view override returns (uint256) {
        uint256 frontEndStake = frontEndStakes[_frontEnd];
        if (frontEndStake == 0) {
            return 0;
        }

        Snapshots storage snapshots = frontEndSnapshots[_frontEnd];

        uint256 compoundedFrontEndStake = _getCompoundedStakeFromSnapshots(frontEndStake, snapshots);
        return compoundedFrontEndStake;
    }

```
