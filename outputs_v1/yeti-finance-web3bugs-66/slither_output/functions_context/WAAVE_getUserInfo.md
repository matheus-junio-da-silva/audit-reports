# Context: WAAVE.getUserInfo

**Contract:** `WAAVE` (Inherits: IWAsset, ERC20_8, IERC20)
**Signature:** `getUserInfo(address) returns (uint256, uint256, uint256)`
**Method Selector ID:** `0x6386c1c7`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** userInfo
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
    Node_1["1: NodeType.VARIABLE - user = userInfo(_user)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.RETURN - (balanceOf(_user) * aavePerShare() / 1e18,0,balanceOf(_user))"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/AssetWrappers/WAAVE.sol` on lines **157** to **160**

```solidity
    function getUserInfo(address _user) external view override returns (uint, uint, uint)  {
        UserInfo memory user = userInfo[_user];
        return (balanceOf(_user)*aavePerShare()/1e18, 0, balanceOf(_user));
    }

```
