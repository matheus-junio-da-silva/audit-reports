# Context: RCTreasury._increaseMarketBalance

**Contract:** `RCTreasury` (Inherits: IRCTreasury, NativeMetaTransaction, Ownable, Context)
**Signature:** `_increaseMarketBalance(uint256,address)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** marketBalance, totalDeposits, user
- **Writes:** marketBalance, totalDeposits, user

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeCast.TMP_1757(uint128) = LIBRARY_CALL, dest:SafeCast, function:SafeCast.toUint128(uint256), arguments:['rentCollected'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - marketBalance += rentCollected"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - user(_user).deposit -= SafeCast.toUint128(rentCollected)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - totalDeposits -= rentCollected"]
```

### Source Mapping
Declared in: `contracts/RCTreasury.sol` on lines **748** to **754**

```solidity
    function _increaseMarketBalance(uint256 rentCollected, address _user)
        internal
    {
        marketBalance += rentCollected;
        user[_user].deposit -= SafeCast.toUint128(rentCollected);
        totalDeposits -= rentCollected;
    }

```
