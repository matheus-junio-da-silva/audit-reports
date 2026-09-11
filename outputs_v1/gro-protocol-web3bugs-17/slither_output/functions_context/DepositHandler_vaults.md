# Context: DepositHandler.vaults

**Contract:** `DepositHandler` (Inherits: IDepositHandler, FixedVaults, FixedStablecoins, Constants, Controllable, Ownable, Context)
**Signature:** `vaults() returns (address[3])`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** DAI_VAULT, USDC_VAULT, USDT_VAULT
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
    Node_1["1: NodeType.EXPRESSION - _vaults(0) = DAI_VAULT"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - _vaults(1) = USDC_VAULT"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - _vaults(2) = USDT_VAULT"]
    Node_3 --> Node_4
    Node_4["4: NodeType.RETURN - _vaults"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/common/FixedContracts.sol` on lines **98** to **102**

```solidity
    function vaults() internal view returns (address[N_COINS] memory _vaults) {
        _vaults[0] = DAI_VAULT;
        _vaults[1] = USDC_VAULT;
        _vaults[2] = USDT_VAULT;
    }

```
