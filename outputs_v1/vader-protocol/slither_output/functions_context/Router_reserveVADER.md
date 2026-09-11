# Context: Router.reserveVADER

**Contract:** `Router` (Inherits: None)
**Signature:** `reserveVADER() returns (uint256)`
**Method Selector ID:** `0x62cea340`
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
- `iERC20.TMP_567(uint256) = HIGH_LEVEL_CALL, dest:TMP_565(iERC20), function:balanceOf, arguments:['TMP_566']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.RETURN - iERC20(VADER).balanceOf(address(this))"]
```

### Source Mapping
Declared in: `contracts/Router.sol` on lines **439** to **441**

```solidity
    function reserveVADER() public view returns(uint) {
        return iERC20(VADER).balanceOf(address(this));
    }

```
