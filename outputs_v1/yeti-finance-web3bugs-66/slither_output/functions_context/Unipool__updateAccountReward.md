# Context: Unipool._updateAccountReward

**Contract:** `Unipool` (Inherits: IUnipool, CheckContract, Ownable, LPTokenWrapper, ILPTokenWrapper)
**Signature:** `_updateAccountReward(address)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** rewardPerTokenStored
- **Writes:** rewards, userRewardPerTokenPaid

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(account != address(0),_updateAccountReward: account is address(0))`

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
    Node_1["1: NodeType.EXPRESSION - _updateReward()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(account != address(0),_updateAccountReward: account is address(0))"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - rewards(account) = earned(account)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - userRewardPerTokenPaid(account) = rewardPerTokenStored"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/LPRewards/Unipool.sol` on lines **236** to **243**

```solidity
    function _updateAccountReward(address account) internal {
        _updateReward();

        require(account != address(0), "_updateAccountReward: account is address(0)");

        rewards[account] = earned(account);
        userRewardPerTokenPaid[account] = rewardPerTokenStored;
    }

```
