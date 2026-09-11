# Context: VestedRewardPool.lock

**Contract:** `VestedRewardPool` (Inherits: None)
**Signature:** `lock(uint256)`
**Method Selector ID:** `0xdd467064`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `checkClaimable`
  ```solidity
  modifier checkClaimable(address recipient) {
          if (vesting[recipient].ends < block.timestamp) {
              vesting[recipient].claimable += vesting[recipient].vested;
              vesting[recipient].vested = 0;
              vesting[recipient].ends = 0;
          }
          _;
      }
  ```

### State Variables Interaction
- **Reads:** mochi, mochiUnderManagement, vMochi, vesting
- **Writes:** mochiUnderManagement, vesting

### Assertion Checks & Business Requirements
- revert: `revert(string)(lock should be longer than 90 days)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IVMochi.HIGH_LEVEL_CALL, dest:vMochi(IVMochi), function:depositFor, arguments:['msg.sender', '_amount']  `
- `IVMochi.TUPLE_0(int128,uint256) = HIGH_LEVEL_CALL, dest:vMochi(IVMochi), function:locked, arguments:['msg.sender']  `
- `IMochi.TMP_15(bool) = HIGH_LEVEL_CALL, dest:mochi(IMochi), function:approve, arguments:['TMP_14', '_amount']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_10
    Node_1["1: NodeType.EXPRESSION - mochi.approve(address(vMochi),_amount)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - (None,end) = vMochi.locked(msg.sender)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.IF - end >= block.timestamp + 7776000"]
    Node_4 --> Node_5
    Node_4 --> Node_6
    Node_5["5: NodeType.EXPRESSION - vMochi.depositFor(msg.sender,_amount)"]
    Node_5 --> Node_7
    Node_6["6: NodeType.EXPRESSION - revert(string)(lock should be longer than 90 days)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.ENDIF - "]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - vesting(msg.sender).vested -= _amount"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - mochiUnderManagement -= _amount"]
    Node_10["10: NodeType.EXPRESSION - checkClaimable(msg.sender)"]
    Node_10 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-core/contracts/emission/VestedRewardPool.sol` on lines **54** to **64**

```solidity
    function lock(uint256 _amount) external checkClaimable(msg.sender) {
        mochi.approve(address(vMochi), _amount);
        (, uint256 end) = vMochi.locked(msg.sender);
        if (end >= block.timestamp + 90 days) {
            vMochi.depositFor(msg.sender, _amount);
        } else {
            revert("lock should be longer than 90 days");
        }
        vesting[msg.sender].vested -= _amount;
        mochiUnderManagement -= _amount;
    }

```
