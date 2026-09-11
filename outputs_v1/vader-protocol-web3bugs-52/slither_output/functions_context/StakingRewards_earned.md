# Context: StakingRewards.earned

**Contract:** `StakingRewards` (Inherits: Pausable, ReentrancyGuard, RewardsDistributionRecipient, Owned, IStakingRewards)
**Signature:** `earned(address) returns (uint256)`
**Method Selector ID:** `0x008cc262`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** _balances, rewards, userRewardPerTokenPaid
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
    Node_1["1: NodeType.RETURN - _balances(account) * ((rewardPerToken() - userRewardPerTokenPaid(account)) / 1e18) + rewards(account)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/staking-rewards/StakingRewards.sol` on lines **77** to **82**

```solidity
    function earned(address account) public view returns (uint) {
        return
            _balances[account] *
            ((rewardPerToken() - userRewardPerTokenPaid[account]) / 1e18) +
            rewards[account];
    }

```
