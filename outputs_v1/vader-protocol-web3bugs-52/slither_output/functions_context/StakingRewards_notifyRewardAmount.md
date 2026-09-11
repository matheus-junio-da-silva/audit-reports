# Context: StakingRewards.notifyRewardAmount

**Contract:** `StakingRewards` (Inherits: Pausable, ReentrancyGuard, RewardsDistributionRecipient, Owned, IStakingRewards)
**Signature:** `notifyRewardAmount(uint256)`
**Method Selector ID:** `0x3c6b16ab`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyRewardsDistribution`
  ```solidity
  modifier onlyRewardsDistribution() {
          require(msg.sender == rewardsDistribution, "not reward distribution");
          _;
      }
  ```
- `updateReward`
  ```solidity
  modifier updateReward(address account) {
          rewardPerTokenStored = rewardPerToken();
          lastUpdateTime = lastTimeRewardApplicable();
          if (account != address(0)) {
              rewards[account] = earned(account);
              userRewardPerTokenPaid[account] = rewardPerTokenStored;
          }
          _;
      }
  ```

### State Variables Interaction
- **Reads:** periodFinish, rewardRate, rewardsDuration, rewardsToken
- **Writes:** lastUpdateTime, periodFinish, rewardRate

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(rewardRate <= balance / rewardsDuration,Provided reward too high)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IERC20.TMP_214(uint256) = HIGH_LEVEL_CALL, dest:rewardsToken(IERC20), function:balanceOf, arguments:['TMP_213']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_12
    Node_1["1: NodeType.IF - block.timestamp >= periodFinish"]
    Node_1 --> Node_2
    Node_1 --> Node_3
    Node_2["2: NodeType.EXPRESSION - rewardRate = reward / rewardsDuration"]
    Node_2 --> Node_6
    Node_3["3: NodeType.VARIABLE - remaining = periodFinish - block.timestamp"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - leftover = remaining * rewardRate"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - rewardRate = (reward + leftover) / rewardsDuration"]
    Node_5 --> Node_6
    Node_6["6: NodeType.ENDIF - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - balance = rewardsToken.balanceOf(address(this))"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - require(bool,string)(rewardRate <= balance / rewardsDuration,Provided reward too high)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - lastUpdateTime = block.timestamp"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - periodFinish = block.timestamp + rewardsDuration"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - RewardAdded(reward)"]
    Node_12["12: NodeType.EXPRESSION - onlyRewardsDistribution()"]
    Node_12 --> Node_13
    Node_13["13: NodeType.EXPRESSION - updateReward(address(0))"]
    Node_13 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/staking-rewards/StakingRewards.sol` on lines **127** to **150**

```solidity
    function notifyRewardAmount(uint reward)
        external
        override
        onlyRewardsDistribution
        updateReward(address(0))
    {
        if (block.timestamp >= periodFinish) {
            rewardRate = reward / rewardsDuration;
        } else {
            uint remaining = periodFinish - block.timestamp;
            uint leftover = remaining * rewardRate;
            rewardRate = (reward + leftover) / rewardsDuration;
        }
        // Ensure the provided reward amount is not more than the balance in the contract.
        // This keeps the reward rate in the right range, preventing overflows due to
        // very high values of rewardRate in the earned and rewardsPerToken functions;
        // Reward + leftover must be less than 2^256 / 10^18 to avoid overflow.
        uint balance = rewardsToken.balanceOf(address(this));
        require(rewardRate <= balance / rewardsDuration, "Provided reward too high");

        lastUpdateTime = block.timestamp;
        periodFinish = block.timestamp + rewardsDuration;
        emit RewardAdded(reward);
    }

```
