# Context: USDM.maxFlashLoan

**Contract:** `USDM` (Inherits: IUSDM, IERC3156FlashLender, ERC20, IERC20Metadata, IERC20, Context)
**Signature:** `maxFlashLoan(address) returns (uint256)`
**Method Selector ID:** `0x613255ab`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_token == address(this),!this)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(_token == address(this),!this)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.RETURN - type()(uint256).max - totalSupply()"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-core/contracts/assets/usdm.sol` on lines **38** to **46**

```solidity
    function maxFlashLoan(address _token)
        external
        view
        override
        returns (uint256)
    {
        require(_token == address(this), "!this");
        return type(uint256).max - totalSupply();
    }

```
