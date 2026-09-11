# Context: Pool2Unipool.claimReward

**Contract:** `Pool2Unipool` (Inherits: IUnipool, CheckContract, Ownable, LPTokenWrapper, ILPTokenWrapper)
**Signature:** `claimReward()`
**Method Selector ID:** `0xb88a802f`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** uniToken, yetiToken
- **Writes:** rewards

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(address(uniToken) != address(0),Liquidity Pool Token has not been set yet)`
- require/assert: `require(bool,string)(reward != 0,Nothing to claim)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IYETIToken.TMP_198(bool) = HIGH_LEVEL_CALL, dest:yetiToken(IYETIToken), function:transfer, arguments:['msg.sender', 'reward']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(address(uniToken) != address(0),Liquidity Pool Token has not been set yet)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - _updatePeriodFinish()"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - _updateAccountReward(msg.sender)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - reward = earned(msg.sender)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - require(bool,string)(reward != 0,Nothing to claim)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - rewards(msg.sender) = 0"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - yetiToken.transfer(msg.sender,reward)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - RewardPaid(msg.sender,reward)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/LPRewards/Pool2Unipool.sol` on lines **196** to **209**

```solidity
    function claimReward() public override {
        require(address(uniToken) != address(0), "Liquidity Pool Token has not been set yet");

        _updatePeriodFinish();
        _updateAccountReward(msg.sender);

        uint256 reward = earned(msg.sender);

        require(reward != 0, "Nothing to claim");

        rewards[msg.sender] = 0;
        yetiToken.transfer(msg.sender, reward);
        emit RewardPaid(msg.sender, reward);
    }

```
