# Context: Router.getVADERAmount

**Contract:** `Router` (Inherits: None)
**Signature:** `getVADERAmount(uint256) returns (uint256)`
**Method Selector ID:** `0x6cc06ded`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** one
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
    Node_1["1: NodeType.VARIABLE - _price = getAnchorPrice()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.RETURN - (_price * USDVAmount) / one"]
    Node_3["3: NodeType.RETURN - vaderAmount"]
```

### Source Mapping
Declared in: `contracts/Router.sol` on lines **295** to **298**

```solidity
    function getVADERAmount(uint USDVAmount) public view returns (uint vaderAmount){
        uint _price = getAnchorPrice();
        return (_price * USDVAmount) / one;
    }

```
