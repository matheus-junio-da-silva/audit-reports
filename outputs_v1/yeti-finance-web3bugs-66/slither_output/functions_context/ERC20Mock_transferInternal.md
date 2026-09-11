# Context: ERC20Mock.transferInternal

**Contract:** `ERC20Mock` (Inherits: ERC20, IERC20, Context)
**Signature:** `transferInternal(address,address,uint256)`
**Method Selector ID:** `0x222f5be0`
**Visibility:** `public`
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
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - _transfer(from,to,value)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/LPRewards/TestContracts/ERC20Mock.sol` on lines **28** to **30**

```solidity
    function transferInternal(address from, address to, uint256 value) public {
        _transfer(from, to, value);
    }

```
