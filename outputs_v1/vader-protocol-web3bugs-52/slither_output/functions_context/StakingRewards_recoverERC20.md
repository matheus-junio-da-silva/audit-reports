# Context: StakingRewards.recoverERC20

**Contract:** `StakingRewards` (Inherits: Pausable, ReentrancyGuard, RewardsDistributionRecipient, Owned, IStakingRewards)
**Signature:** `recoverERC20(address,uint256)`
**Method Selector ID:** `0x8980f11f`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyOwner`
  ```solidity
  modifier onlyOwner {
          _onlyOwner();
          _;
      }
  ```

### State Variables Interaction
- **Reads:** stakingToken
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(tokenAddress != address(stakingToken),Cannot withdraw the staking token)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeERC20.LIBRARY_CALL, dest:SafeERC20, function:SafeERC20.safeTransfer(IERC20,address,uint256), arguments:['TMP_226', 'msg.sender', 'tokenAmount'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_4
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(tokenAddress != address(stakingToken),Cannot withdraw the staking token)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - IERC20(tokenAddress).safeTransfer(msg.sender,tokenAmount)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - Recovered(tokenAddress,tokenAmount)"]
    Node_4["4: NodeType.EXPRESSION - onlyOwner()"]
    Node_4 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/staking-rewards/StakingRewards.sol` on lines **153** to **160**

```solidity
    function recoverERC20(address tokenAddress, uint tokenAmount) external onlyOwner {
        require(
            tokenAddress != address(stakingToken),
            "Cannot withdraw the staking token"
        );
        IERC20(tokenAddress).safeTransfer(msg.sender, tokenAmount);
        emit Recovered(tokenAddress, tokenAmount);
    }

```
