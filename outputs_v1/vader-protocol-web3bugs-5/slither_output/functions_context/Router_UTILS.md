# Context: Router.UTILS

**Contract:** `Router` (Inherits: None)
**Signature:** `UTILS() returns (address)`
**Method Selector ID:** `0x7b0e5c45`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** VADER
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `iVADER.TMP_590(address) = HIGH_LEVEL_CALL, dest:TMP_589(iVADER), function:UTILS, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.RETURN - iVADER(VADER).UTILS()"]
```

### Source Mapping
Declared in: `contracts/Router.sol` on lines **464** to **466**

```solidity
    function UTILS() public view returns(address){
        return iVADER(VADER).UTILS();
    }

```
