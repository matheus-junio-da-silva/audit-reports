# Context: VestedRewardPool.vest

**Contract:** `VestedRewardPool` (Inherits: None)
**Signature:** `vest(address)`
**Method Selector ID:** `0xf3c5f51e`
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
- **Reads:** mochi, mochiUnderManagement, vesting
- **Writes:** mochiUnderManagement, vesting

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IMochi.TMP_3(uint256) = HIGH_LEVEL_CALL, dest:mochi(IMochi), function:balanceOf, arguments:['TMP_2']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_6
    Node_1["1: NodeType.VARIABLE - amount = mochi.balanceOf(address(this)) - mochiUnderManagement"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - weightedEnd = (vesting(_recipient).vested * vesting(_recipient).ends + amount * (block.timestamp + 7776000)) / (vesting(_recipient).vested + amount)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - vesting(_recipient).vested += amount"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - vesting(_recipient).ends = weightedEnd"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - mochiUnderManagement += amount"]
    Node_6["6: NodeType.EXPRESSION - checkClaimable(_recipient)"]
    Node_6 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-core/contracts/emission/VestedRewardPool.sol` on lines **36** to **46**

```solidity
    function vest(address _recipient) external checkClaimable(_recipient) {
        uint256 amount = mochi.balanceOf(address(this)) - mochiUnderManagement;
        uint256 weightedEnd = (vesting[_recipient].vested *
            vesting[_recipient].ends +
            amount *
            (block.timestamp + 90 days)) /
            (vesting[_recipient].vested + amount);
        vesting[_recipient].vested += amount;
        vesting[_recipient].ends = weightedEnd;
        mochiUnderManagement += amount;
    }

```
