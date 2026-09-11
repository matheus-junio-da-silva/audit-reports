# Context: sYETIToken._transfer

**Contract:** `sYETIToken` (Inherits: BoringOwnable, BoringOwnableData, Domain, IERC20)
**Signature:** `_transfer(address,address,uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** users
- **Writes:** users

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(block.timestamp >= fromUser.lockedUntil,Locked)`
- require/assert: `require(bool,string)(fromUser.balance >= shares,Low balance)`
- require/assert: `require(bool,string)(to != address(0),Zero address)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `BoringMath.TMP_266(uint128) = LIBRARY_CALL, dest:BoringMath, function:BoringMath.to128(uint256), arguments:['shares'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - fromUser = users(from)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(block.timestamp >= fromUser.lockedUntil,Locked)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.IF - shares != 0"]
    Node_3 --> Node_4
    Node_3 --> Node_12
    Node_4["4: NodeType.EXPRESSION - require(bool,string)(fromUser.balance >= shares,Low balance)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.IF - from != to"]
    Node_5 --> Node_6
    Node_5 --> Node_11
    Node_6["6: NodeType.EXPRESSION - require(bool,string)(to != address(0),Zero address)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - toUser = users(to)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.VARIABLE - shares128 = shares.to128()"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - users(from).balance = fromUser.balance - shares128"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - users(to).balance = toUser.balance + shares128"]
    Node_10 --> Node_11
    Node_11["11: NodeType.ENDIF - "]
    Node_11 --> Node_12
    Node_12["12: NodeType.ENDIF - "]
    Node_12 --> Node_13
    Node_13["13: NodeType.EXPRESSION - Transfer(from,to,shares)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/YETI/sYETIToken.sol` on lines **81** to **99**

```solidity
    function _transfer(
        address from,
        address to,
        uint256 shares
    ) internal {
        User memory fromUser = users[from];
        require(block.timestamp >= fromUser.lockedUntil, "Locked");
        if (shares != 0) {
            require(fromUser.balance >= shares, "Low balance");
            if (from != to) {
                require(to != address(0), "Zero address"); // Moved down so other failed calls safe some gas
                User memory toUser = users[to];
                uint128 shares128 = shares.to128();
                users[from].balance = fromUser.balance - shares128; // Underflow is checked
                users[to].balance = toUser.balance + shares128; // Can't overflow because totalSupply would be greater than 2^128-1;
            }
        }
        emit Transfer(from, to, shares);
    }

```
