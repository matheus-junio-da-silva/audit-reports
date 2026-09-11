# Context: ActivePool.sendSingleCollateral

**Contract:** `ActivePool` (Inherits: YetiCustomBase, BaseMath, IActivePool, IPool, ICollateralReceiver, CheckContract, Ownable)
**Signature:** `sendSingleCollateral(address,address,uint256) returns (bool)`
**Method Selector ID:** `0x62f6105b`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
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
    Node_1["1: NodeType.EXPRESSION - _requireCallerIsBorrowerOperations()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - _sendCollateral(_to,_token,_amount)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.RETURN - true"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/ActivePool.sol` on lines **200** to **204**

```solidity
    function sendSingleCollateral(address _to, address _token, uint256 _amount) external override returns (bool) {
        _requireCallerIsBorrowerOperations();
        _sendCollateral(_to, _token, _amount); // reverts if send fails
        return true;
    }

```
