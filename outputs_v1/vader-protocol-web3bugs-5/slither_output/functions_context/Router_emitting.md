# Context: Router.emitting

**Contract:** `Router` (Inherits: None)
**Signature:** `emitting() returns (bool)`
**Method Selector ID:** `0x0781f4d2`
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
- `iVADER.TMP_594(bool) = HIGH_LEVEL_CALL, dest:TMP_593(iVADER), function:emitting, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.RETURN - iVADER(VADER).emitting()"]
```

### Source Mapping
Declared in: `contracts/Router.sol` on lines **470** to **472**

```solidity
    function emitting() public view returns(bool){
        return iVADER(VADER).emitting();
    }

```
