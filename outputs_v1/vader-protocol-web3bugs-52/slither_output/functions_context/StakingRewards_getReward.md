# Context: StakingRewards.getReward

**Contract:** `StakingRewards` (Inherits: Pausable, ReentrancyGuard, RewardsDistributionRecipient, Owned, IStakingRewards)
**Signature:** `getReward()`
**Method Selector ID:** `0x3d18b912`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `nonReentrant`
  ```solidity
  modifier nonReentrant() {
          _nonReentrantBefore();
          _;
          _nonReentrantAfter();
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
- **Reads:** rewards, rewardsToken
- **Writes:** rewards

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeERC20.LIBRARY_CALL, dest:SafeERC20, function:SafeERC20.safeTransfer(IERC20,address,uint256), arguments:['rewardsToken', 'msg.sender', 'reward'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_7
    Node_1["1: NodeType.VARIABLE - reward = rewards(msg.sender)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.IF - reward > 0"]
    Node_2 --> Node_3
    Node_2 --> Node_6
    Node_3["3: NodeType.EXPRESSION - rewards(msg.sender) = 0"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - rewardsToken.safeTransfer(msg.sender,reward)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - RewardPaid(msg.sender,reward)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.ENDIF - "]
    Node_7["7: NodeType.EXPRESSION - nonReentrant()"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - updateReward(msg.sender)"]
    Node_8 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/staking-rewards/StakingRewards.sol` on lines **111** to **118**

```solidity
    function getReward() public nonReentrant updateReward(msg.sender) {
        uint reward = rewards[msg.sender];
        if (reward > 0) {
            rewards[msg.sender] = 0;
            rewardsToken.safeTransfer(msg.sender, reward);
            emit RewardPaid(msg.sender, reward);
        }
    }

```
