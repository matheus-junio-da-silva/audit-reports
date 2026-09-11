# Context: Router.addDepositData

**Contract:** `Router` (Inherits: None)
**Signature:** `addDepositData(address,address,uint256,uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** mapMemberToken_depositBase, mapMemberToken_depositToken
- **Writes:** mapMemberToken_depositBase, mapMemberToken_depositToken, mapMemberToken_lastDeposited

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
    Node_1["1: NodeType.EXPRESSION - mapMemberToken_depositBase(member)(token) += amountBase"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - mapMemberToken_depositToken(member)(token) += amountToken"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - mapMemberToken_lastDeposited(member)(token) = block.timestamp"]
```

### Source Mapping
Declared in: `contracts/Router.sol` on lines **196** to **200**

```solidity
    function addDepositData(address member, address token, uint amountBase, uint amountToken) internal {
        mapMemberToken_depositBase[member][token] += amountBase;
        mapMemberToken_depositToken[member][token] += amountToken;
        mapMemberToken_lastDeposited[member][token] = block.timestamp;
    }

```
