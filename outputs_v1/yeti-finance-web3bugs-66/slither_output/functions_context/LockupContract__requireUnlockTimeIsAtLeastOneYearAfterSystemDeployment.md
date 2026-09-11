# Context: LockupContract._requireUnlockTimeIsAtLeastOneYearAfterSystemDeployment

**Contract:** `LockupContract` (Inherits: None)
**Signature:** `_requireUnlockTimeIsAtLeastOneYearAfterSystemDeployment(uint256,IYETIToken)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** SECONDS_IN_ONE_YEAR
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_unlockTime >= systemDeploymentTime.add(SECONDS_IN_ONE_YEAR),LockupContract: unlock time must be at least one year after system deployment)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IYETIToken.TMP_46(uint256) = HIGH_LEVEL_CALL, dest:_yetiToken(IYETIToken), function:getDeploymentStartTime, arguments:[]  `
- `SafeMath.TMP_47(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['systemDeploymentTime', 'SECONDS_IN_ONE_YEAR'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - systemDeploymentTime = _yetiToken.getDeploymentStartTime()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(_unlockTime >= systemDeploymentTime.add(SECONDS_IN_ONE_YEAR),LockupContract: unlock time must be at least one year after system deployment)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/YETI/LockupContract.sol` on lines **77** to **80**

```solidity
    function _requireUnlockTimeIsAtLeastOneYearAfterSystemDeployment(uint _unlockTime, IYETIToken _yetiToken) internal view {
        uint systemDeploymentTime = _yetiToken.getDeploymentStartTime();
        require(_unlockTime >= systemDeploymentTime.add(SECONDS_IN_ONE_YEAR), "LockupContract: unlock time must be at least one year after system deployment");
    }

```
