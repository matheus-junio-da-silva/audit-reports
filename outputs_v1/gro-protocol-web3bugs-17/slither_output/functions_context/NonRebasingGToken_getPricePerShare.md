# Context: NonRebasingGToken.getPricePerShare

**Contract:** `NonRebasingGToken` (Inherits: GToken, IToken, Whitelist, Ownable, Constants, GERC20, IERC20, Context)
**Signature:** `getPricePerShare() returns (uint256)`
**Method Selector ID:** `0x3d68175c`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** BASE
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
    Node_1["1: NodeType.VARIABLE - f = factor()"]
    Node_1 --> Node_3
    Node_3["3: NodeType.IF - f > 0"]
    Node_3 --> Node_4
    Node_3 --> Node_5
    Node_4["4: NodeType.RETURN - applyFactor(BASE,f,false)"]
    Node_5["5: NodeType.RETURN - 0"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/tokens/NonRebasingGToken.sol` on lines **46** to **49**

```solidity
    function getPricePerShare() public view override returns (uint256) {
        uint256 f = factor();
        return f > 0 ? applyFactor(BASE, f, false) : 0;
    }

```
