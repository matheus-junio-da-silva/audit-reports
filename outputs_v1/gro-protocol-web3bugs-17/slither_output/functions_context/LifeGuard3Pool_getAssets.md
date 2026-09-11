# Context: LifeGuard3Pool.getAssets

**Contract:** `LifeGuard3Pool` (Inherits: FixedStablecoins, Constants, Whitelist, Controllable, Ownable, Context, ILifeGuard)
**Signature:** `getAssets() returns (uint256[3])`
**Method Selector ID:** `0x67e4ac2c`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** N_COINS, assets
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
    Node_0 --> Node_3
    Node_1["1: NodeType.STARTLOOP - "]
    Node_1 --> Node_4
    Node_2["2: NodeType.ENDLOOP - "]
    Node_2 --> Node_7
    Node_3["3: NodeType.VARIABLE - "]
    Node_3 --> Node_1
    Node_4["4: NodeType.IFLOOP - i < N_COINS"]
    Node_4 --> Node_5
    Node_4 --> Node_2
    Node_5["5: NodeType.EXPRESSION - _assets(i) = assets(i)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - i ++"]
    Node_6 --> Node_4
    Node_7["7: NodeType.RETURN - _assets"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/pools/LifeGuard3Pool.sol` on lines **94** to **98**

```solidity
    function getAssets() external view override returns (uint256[N_COINS] memory _assets) {
        for (uint256 i; i < N_COINS; i++) {
            _assets[i] = assets[i];
        }
    }

```
