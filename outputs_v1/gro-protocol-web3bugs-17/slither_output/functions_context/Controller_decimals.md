# Context: Controller.decimals

**Contract:** `Controller` (Inherits: IController, FixedGTokens, FixedStablecoins, Constants, Whitelist, Ownable, Pausable, Context)
**Signature:** `decimals() returns (uint256[3])`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** DAI_DECIMALS, USDC_DECIMALS, USDT_DECIMALS
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
    Node_1["1: NodeType.EXPRESSION - _decimals(0) = DAI_DECIMALS"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - _decimals(1) = USDC_DECIMALS"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - _decimals(2) = USDT_DECIMALS"]
    Node_3 --> Node_4
    Node_4["4: NodeType.RETURN - _decimals"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/common/FixedContracts.sol` on lines **42** to **46**

```solidity
    function decimals() internal view returns (uint256[N_COINS] memory _decimals) {
        _decimals[0] = DAI_DECIMALS;
        _decimals[1] = USDC_DECIMALS;
        _decimals[2] = USDT_DECIMALS;
    }

```
