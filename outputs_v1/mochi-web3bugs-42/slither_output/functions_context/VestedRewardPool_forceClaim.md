# Context: VestedRewardPool.forceClaim

**Contract:** `VestedRewardPool` (Inherits: None)
**Signature:** `forceClaim(uint256)`
**Method Selector ID:** `0x808d7526`
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

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IMochi.TMP_25(bool) = HIGH_LEVEL_CALL, dest:mochi(IMochi), function:transfer, arguments:['TMP_23', 'TMP_24']  `
- `IMochi.TMP_22(bool) = HIGH_LEVEL_CALL, dest:mochi(IMochi), function:transfer, arguments:['msg.sender', 'TMP_21']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_5
    Node_1["1: NodeType.EXPRESSION - mochi.transfer(msg.sender,_amount / 2)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - mochi.transfer(address(vMochi),_amount / 2)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - vesting(msg.sender).vested -= _amount"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - mochiUnderManagement -= _amount"]
    Node_5["5: NodeType.EXPRESSION - checkClaimable(msg.sender)"]
    Node_5 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-core/contracts/emission/VestedRewardPool.sol` on lines **66** to **71**

```solidity
    function forceClaim(uint256 _amount) external checkClaimable(msg.sender) {
        mochi.transfer(msg.sender, _amount / 2);
        mochi.transfer(address(vMochi), _amount / 2);
        vesting[msg.sender].vested -= _amount;
        mochiUnderManagement -= _amount;
    }

```
