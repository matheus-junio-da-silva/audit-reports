# Context: Vault.DAO

**Contract:** `Vault` (Inherits: None)
**Signature:** `DAO() returns (address)`
**Method Selector ID:** `0x98fabd3a`
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
- `iVADER.TMP_1308(address) = HIGH_LEVEL_CALL, dest:TMP_1307(iVADER), function:DAO, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.RETURN - iVADER(VADER).DAO()"]
```

### Source Mapping
Declared in: `contracts/Vault.sol` on lines **198** to **200**

```solidity
    function DAO() public view returns(address){
        return iVADER(VADER).DAO();
    }

```
