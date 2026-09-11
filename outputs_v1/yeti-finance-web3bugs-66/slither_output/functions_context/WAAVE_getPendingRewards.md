# Context: WAAVE.getPendingRewards

**Contract:** `WAAVE` (Inherits: IWAsset, ERC20_8, IERC20)
**Signature:** `getPendingRewards(address) returns (address[], uint256[])`
**Method Selector ID:** `0xf6ed2017`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** aToken
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
    Node_1["1: NodeType.VARIABLE - tokens = new address()(1)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - amounts = new uint256()(1)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - tokens(0) = address(aToken)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - amounts(0) = balanceOf(_for) * aavePerShare() / 1e18"]
    Node_4 --> Node_5
    Node_5["5: NodeType.RETURN - (tokens,amounts)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/AssetWrappers/WAAVE.sol` on lines **143** to **154**

```solidity
    function getPendingRewards(address _for) external view override returns
        (address[] memory, uint[] memory)  {
            
        address[] memory tokens = new address[](1);
        uint[] memory amounts = new uint[](1);

    
        tokens[0] = address(aToken);
        amounts[0] = balanceOf(_for)*aavePerShare()/1e18;

        return (tokens, amounts);
    }

```
