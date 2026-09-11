# Context: WJLP.endTreasuryReward

**Contract:** `WJLP` (Inherits: IWAsset, ERC20_8, IERC20)
**Signature:** `endTreasuryReward(address,uint256)`
**Method Selector ID:** `0xca70560a`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** YetiFinanceTreasury
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
    Node_1["1: NodeType.EXPRESSION - _requireCallerIsSPorDP()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - _updateReward(YetiFinanceTreasury,_to,_amount)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/AssetWrappers/WJLP.sol` on lines **250** to **255**

```solidity
    function endTreasuryReward(address _to, uint _amount) external override {
        _requireCallerIsSPorDP();

        // Then update new owner of rewards.
        _updateReward(YetiFinanceTreasury, _to, _amount);
    }

```
