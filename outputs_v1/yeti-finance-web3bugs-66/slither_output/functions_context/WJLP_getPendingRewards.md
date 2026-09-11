# Context: WJLP.getPendingRewards

**Contract:** `WJLP` (Inherits: IWAsset, ERC20_8, IERC20)
**Signature:** `getPendingRewards(address) returns (address[], uint256[])`
**Method Selector ID:** `0xf6ed2017`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** JLP, _MasterChefJoe, _poolPid, userInfo
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IMasterChefJoeV2.TMP_177(IMasterChefJoeV2.PoolInfo) = HIGH_LEVEL_CALL, dest:_MasterChefJoe(IMasterChefJoeV2), function:poolInfo, arguments:['_poolPid']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - accJoePerShare = _MasterChefJoe.poolInfo(_poolPid).accJoePerShare"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - user = userInfo(_for)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - unclaimed = user.unclaimedJOEReward"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - pending = (user.amount * accJoePerShare / 1e12) - user.rewardDebt"]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - tokens = new address()(1)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - amounts = new uint256()(1)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - tokens(0) = address(JLP)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - amounts(0) = unclaimed + pending"]
    Node_8 --> Node_9
    Node_9["9: NodeType.RETURN - (tokens,amounts)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/AssetWrappers/WJLP.sol` on lines **275** to **290**

```solidity
    function getPendingRewards(address _for) external view override returns
        (address[] memory, uint[] memory)  {
        // latest accumulated Joe Per Share:
        uint256 accJoePerShare = _MasterChefJoe.poolInfo(_poolPid).accJoePerShare;
        UserInfo storage user = userInfo[_for];

        uint unclaimed = user.unclaimedJOEReward;
        uint pending = (user.amount * accJoePerShare / 1e12) - user.rewardDebt;

        address[] memory tokens = new address[](1);
        uint[] memory amounts = new uint[](1);
        tokens[0] = address(JLP);
        amounts[0] = unclaimed + pending;

        return (tokens, amounts);
    }

```
