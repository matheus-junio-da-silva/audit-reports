# Context: RCOrderbook.bidExists

**Contract:** `RCOrderbook` (Inherits: IRCOrderbook, NativeMetaTransaction, Ownable, Context)
**Signature:** `bidExists(address,address,uint256) returns (bool)`
**Method Selector ID:** `0x678729eb`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** index, user
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
    Node_1["1: NodeType.IF - user(_user).length != 0"]
    Node_1 --> Node_2
    Node_1 --> Node_8
    Node_2["2: NodeType.IF - index(_user)(_market)(_card) != 0"]
    Node_2 --> Node_3
    Node_2 --> Node_4
    Node_3["3: NodeType.RETURN - true"]
    Node_4["4: NodeType.IF - user(_user)(0).market == _market && user(_user)(0).token == _card"]
    Node_4 --> Node_5
    Node_4 --> Node_6
    Node_5["5: NodeType.RETURN - true"]
    Node_6["6: NodeType.ENDIF - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.ENDIF - "]
    Node_7 --> Node_8
    Node_8["8: NodeType.ENDIF - "]
    Node_8 --> Node_9
    Node_9["9: NodeType.RETURN - false"]
```

### Source Mapping
Declared in: `contracts/RCOrderbook.sol` on lines **770** to **791**

```solidity
    function bidExists(
        address _user,
        address _market,
        uint256 _card
    ) public view override returns (bool) {
        if (user[_user].length != 0) {
            //some bids exist
            if (index[_user][_market][_card] != 0) {
                // this bid exists
                return true;
            } else {
                // check bid isn't index 0
                if (
                    user[_user][0].market == _market &&
                    user[_user][0].token == _card
                ) {
                    return true;
                }
            }
        }
        return false;
    }

```
