# Context: WBQI.updateReward

**Contract:** `WBQI` (Inherits: IWAsset, ERC20_8, IERC20)
**Signature:** `updateReward(address,address,uint256)`
**Method Selector ID:** `0x2c8e8dfa`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** userInfo
- **Writes:** userInfo

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
    Node_1["1: NodeType.EXPRESSION - _requireCallerIsLRD()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - accumulateRewards(_from)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - userInfo(_from).amount = userInfo(_from).amount - _amount"]
    Node_3 --> Node_4
    Node_4["4: NodeType.IF - address(_to) != address(0)"]
    Node_4 --> Node_5
    Node_4 --> Node_7
    Node_5["5: NodeType.EXPRESSION - accumulateRewards(_to)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - userInfo(_to).amount = userInfo(_to).amount + _amount"]
    Node_6 --> Node_7
    Node_7["7: NodeType.ENDIF - "]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/AssetWrappers/WBQI.sol` on lines **190** to **199**

```solidity
    function updateReward(address _from, address _to, uint _amount) external override {
        _requireCallerIsLRD();
       
        accumulateRewards(_from);
        userInfo[_from].amount = userInfo[_from].amount - _amount;
        if (address(_to) != address(0)) {
            accumulateRewards(_to);
            userInfo[_to].amount = userInfo[_to].amount + _amount;
        }
    }

```
