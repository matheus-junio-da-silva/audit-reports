# Context: ActivePool._sendCollateral

**Contract:** `ActivePool` (Inherits: YetiCustomBase, BaseMath, IActivePool, IPool, ICollateralReceiver, CheckContract, Ownable)
**Signature:** `_sendCollateral(address,address,uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** poolColl, whitelist
- **Writes:** poolColl

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IWhitelist.TMP_91(uint256) = HIGH_LEVEL_CALL, dest:whitelist(IWhitelist), function:getIndex, arguments:['_collateral']  `
- `SafeMath.TMP_92(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['REF_120', '_amount'] `
- `SafeERC20.LIBRARY_CALL, dest:SafeERC20, function:SafeERC20.safeTransfer(IERC20,address,uint256), arguments:['TMP_93', '_to', '_amount'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - index = whitelist.getIndex(_collateral)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - poolColl.amounts(index) = poolColl.amounts(index).sub(_amount)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - IERC20(_collateral).safeTransfer(_to,_amount)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - ActivePoolBalanceUpdated(_collateral,_amount)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - CollateralSent(_collateral,_to,_amount)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/ActivePool.sol` on lines **149** to **156**

```solidity
    function _sendCollateral(address _to, address _collateral, uint _amount) internal {
        uint index = whitelist.getIndex(_collateral);
        poolColl.amounts[index] = poolColl.amounts[index].sub(_amount);
        IERC20(_collateral).safeTransfer(_to, _amount);

        emit ActivePoolBalanceUpdated(_collateral, _amount);
        emit CollateralSent(_collateral, _to, _amount);
    }

```
