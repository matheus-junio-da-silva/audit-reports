# Context: CheapERC20.cheapTransferFrom

**Contract:** `CheapERC20` (Inherits: None)
**Signature:** `cheapTransferFrom(IERC20,address,address,uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(success && (data.length == 0 || abi.decode(data,(bool))),Mochi Vault: TRANSFER_FROM_FAILED)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `low-level-call`

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - "]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - (success,data) = address(asset).call(abi.encodeWithSelector(IERC20.transferFrom.selector,from,to,value))"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - require(bool,string)(success && (data.length == 0 || abi.decode(data,(bool))),Mochi Vault: TRANSFER_FROM_FAILED)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-library/contracts/CheapERC20.sol` on lines **13** to **16**

```solidity
    function cheapTransferFrom(IERC20 asset, address from, address to, uint value) internal {
        (bool success, bytes memory data) = address(asset).call(abi.encodeWithSelector(IERC20.transferFrom.selector, from, to, value));
        require(success && (data.length == 0 || abi.decode(data, (bool))), 'Mochi Vault: TRANSFER_FROM_FAILED');
    }

```
