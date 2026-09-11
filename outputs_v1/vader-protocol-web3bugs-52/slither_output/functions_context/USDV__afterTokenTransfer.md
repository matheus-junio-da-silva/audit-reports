# Context: USDV._afterTokenTransfer

**Contract:** `USDV` (Inherits: Ownable, ERC20, IERC20Metadata, IERC20, Context, ProtocolConstants, IUSDV)
**Signature:** `_afterTokenTransfer(address,address,uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
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
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol` on lines **364** to **364**

```solidity
    function _afterTokenTransfer(address from, address to, uint256 amount) internal virtual {}

```
