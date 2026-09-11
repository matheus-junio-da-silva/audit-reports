# Context: USDV.convertForMember

**Contract:** `USDV` (Inherits: iERC20)
**Signature:** `convertForMember(address,uint256) returns (uint256)`
**Method Selector ID:** `0xfbe521a0`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
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
- None

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - getFunds(VADER,amount)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.RETURN - _convert(member,amount)"]
```

### Source Mapping
Declared in: `contracts/USDV.sol` on lines **169** to **172**

```solidity
    function convertForMember(address member, uint amount) public returns(uint) {
        getFunds(VADER, amount);
        return _convert(member, amount);
    }

```
