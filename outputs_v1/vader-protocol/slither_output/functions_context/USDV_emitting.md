# Context: USDV.emitting

**Contract:** `USDV` (Inherits: iERC20)
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
- `iVADER.TMP_836(bool) = HIGH_LEVEL_CALL, dest:TMP_835(iVADER), function:emitting, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.RETURN - iVADER(VADER).emitting()"]
```

### Source Mapping
Declared in: `contracts/USDV.sol` on lines **212** to **214**

```solidity
    function emitting() public view returns(bool){
        return iVADER(VADER).emitting();
    }

```
