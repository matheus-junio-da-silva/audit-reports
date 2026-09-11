# Context: RCTreasury.depositAbleToWithdraw

**Contract:** `RCTreasury` (Inherits: IRCTreasury, NativeMetaTransaction, Ownable, Context)
**Signature:** `depositAbleToWithdraw(address) returns (uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** user
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
    Node_1["1: NodeType.VARIABLE - collection = rentOwedUser(_user,block.timestamp)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.IF - collection >= user(_user).deposit"]
    Node_2 --> Node_3
    Node_2 --> Node_4
    Node_3["3: NodeType.RETURN - 0"]
    Node_4["4: NodeType.RETURN - uint256(user(_user).deposit) - (collection)"]
```

### Source Mapping
Declared in: `contracts/RCTreasury.sol` on lines **642** to **653**

```solidity
    function depositAbleToWithdraw(address _user)
        internal
        view
        returns (uint256)
    {
        uint256 collection = rentOwedUser(_user, block.timestamp);
        if (collection >= user[_user].deposit) {
            return 0;
        } else {
            return uint256(user[_user].deposit) - (collection);
        }
    }

```
