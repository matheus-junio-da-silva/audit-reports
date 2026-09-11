# Context: WBQI.getPendingRewards

**Contract:** `WBQI` (Inherits: IWAsset, ERC20_8, IERC20)
**Signature:** `getPendingRewards(address) returns (address[], uint256[])`
**Method Selector ID:** `0xf6ed2017`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** QI, userInfo
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
    Node_1["1: NodeType.VARIABLE - tokens = new address()(2)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - amounts = new uint256()(2)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - tokens(0) = address(0)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - amounts(0) = userInfo(_for).pendingAVAXReward"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - tokens(1) = address(QI)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - amounts(1) = userInfo(_for).pendingQIReward"]
    Node_6 --> Node_7
    Node_7["7: NodeType.RETURN - (tokens,amounts)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/AssetWrappers/WBQI.sol` on lines **202** to **212**

```solidity
    function getPendingRewards(address _for) external view override returns
        (address[] memory, uint[] memory)  {
     
        address[] memory tokens = new address[](2);
        uint[] memory amounts = new uint[](2);
        tokens[0] = address(0);
        amounts[0] = userInfo[_for].pendingAVAXReward;
        tokens[1] = address(QI);
        amounts[1] = userInfo[_for].pendingQIReward;
        return (tokens, amounts);
    }

```
