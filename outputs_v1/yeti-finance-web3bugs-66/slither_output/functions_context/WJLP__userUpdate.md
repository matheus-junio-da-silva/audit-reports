# Context: WJLP._userUpdate

**Contract:** `WJLP` (Inherits: IWAsset, ERC20_8, IERC20)
**Signature:** `_userUpdate(address,uint256,bool)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `private`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** _MasterChefJoe, _poolPid, userInfo
- **Writes:** userInfo

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IMasterChefJoeV2.TMP_191(IMasterChefJoeV2.PoolInfo) = HIGH_LEVEL_CALL, dest:_MasterChefJoe(IMasterChefJoeV2), function:poolInfo, arguments:['_poolPid']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - accJoePerShare = _MasterChefJoe.poolInfo(_poolPid).accJoePerShare"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - user = userInfo(_user)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - cachedUserAmount = user.amount"]
    Node_3 --> Node_4
    Node_4["4: NodeType.IF - cachedUserAmount != 0"]
    Node_4 --> Node_5
    Node_4 --> Node_6
    Node_5["5: NodeType.EXPRESSION - user.unclaimedJOEReward = (cachedUserAmount * accJoePerShare / 1e12) - user.rewardDebt"]
    Node_5 --> Node_6
    Node_6["6: NodeType.ENDIF - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.IF - _isDeposit"]
    Node_7 --> Node_8
    Node_7 --> Node_9
    Node_8["8: NodeType.EXPRESSION - user.amount = cachedUserAmount + _amount"]
    Node_8 --> Node_10
    Node_9["9: NodeType.EXPRESSION - user.amount = cachedUserAmount - _amount"]
    Node_9 --> Node_10
    Node_10["10: NodeType.ENDIF - "]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - user.rewardDebt = user.amount * accJoePerShare / 1e12"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/AssetWrappers/WJLP.sol` on lines **322** to **340**

```solidity
    function _userUpdate(address _user, uint256 _amount, bool _isDeposit) private {
        // latest accumulated Joe Per Share:
        uint256 accJoePerShare = _MasterChefJoe.poolInfo(_poolPid).accJoePerShare;
        UserInfo storage user = userInfo[_user];
        uint256 cachedUserAmount = user.amount;

        if (cachedUserAmount != 0) {
            user.unclaimedJOEReward = (cachedUserAmount * accJoePerShare / 1e12) - user.rewardDebt;
        }

        if (_isDeposit) {
            user.amount = cachedUserAmount + _amount;
        } else {
            user.amount = cachedUserAmount - _amount;
        }

        // update for JOE rewards that are already accounted for in user.unclaimedJOEReward
        user.rewardDebt = user.amount * accJoePerShare / 1e12;
    }

```
